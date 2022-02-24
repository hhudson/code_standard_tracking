create or replace package body eba_stds_parser as

    gc_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';
    
    -- Private helper function.
    function clean_query( p_query in clob ) return clob;
    -- Do any necessary clean-up.
    function clean_query( p_query in clob ) return clob is
        l_query clob := p_query;
    begin
        loop
            if substr(l_query,-1) in (chr(10),chr(13),';',' ','/') then
                l_query := substr(l_query,1,length(l_query)-1);
            else
                exit;
            end if;
        end loop;
        return l_query;
    end clean_query;
    -- test if query is valid
    function is_valid_query( p_query in clob ) return varchar2 is
        l_source_query  clob := p_query;
        l_source_queryv clob;
        l_report_cursor integer;
    begin
        if l_source_query is not null then
            if substr(upper(ltrim(l_source_query)),1,6) != 'SELECT'
                    and substr(upper(ltrim(l_source_query)),1,4) != 'WITH' then
                return 'Query must begin with SELECT or WITH';
            end if;
            l_source_query := clean_query( l_source_query );
            l_source_queryv := sys.dbms_assert.noop( str => l_source_query );
            begin
                l_report_cursor := sys.dbms_sql.open_cursor;
                sys.dbms_sql.parse( l_report_cursor, l_source_queryv, SYS.DBMS_SQL.NATIVE );
                sys.dbms_sql.close_cursor(l_report_cursor);
            exception when others then
                if sys.dbms_sql.is_open( l_report_cursor ) then
                    sys.dbms_sql.close_cursor( l_report_cursor );
                end if;
                return sqlerrm;
            end;
        end if;
        return null;
    end is_valid_query;
    -- Procedure: update_standard_status
    -- Updates the standard_statuses table with the current pass/fail
    --   status for each relevant automated test.
    procedure update_standard_status is
        l_query clob;
        l_cursor integer := null;
        l_feedback integer;
        cursor tst_csr is
            select standard_id,
                id test_id,
                test_type,
                name,
                check_sql,
                app_bind_variable,
                failure_help_text
            from eba_stds_standard_tests;
        tst_rec tst_csr%ROWTYPE;
        cursor app_csr( d_standard_id in number, d_test_id in number ) is
            select ap.id application_id,
                ap.apex_app_id,
                aa.last_updated_on app_update,
                st_stat.updated test_run,
                st_stat.pass_fail_pct
            from eba_stds_applications ap,
                eba_stds_standards s,
                eba_stds_standard_type_ref st_type,
                eba_stds_standard_statuses st_stat,
                apex_applications aa
            where s.id = d_standard_id
                and st_type.standard_id = s.id
                and st_type.type_id = ap.type_id
                and aa.application_id = ap.apex_app_id
                and st_stat.standard_id(+) = d_standard_id
                and st_stat.test_id(+) = d_test_id
                and st_stat.application_id(+) = ap.id
            order by ap.apex_app_id;
        app_rec app_csr%ROWTYPE;
        l_message    varchar2(4000);
        l_status     varchar2(1);
        l_identifier varchar2(4000);
        l_pass_cnt   number;
        l_total      number;
        l_start      timestamp with local time zone;
        l_duration   interval day to second;
        l_dur_ms     number;
        procedure save_status( p_standard_id in number, p_application_id in number,
            p_test_id in number, p_status in number, p_duration in number ) is
        begin
            merge into eba_stds_standard_statuses dest
            using ( select p_application_id app_id,
                        p_standard_id standard_id,
                        p_test_id test_id,
                        p_status pass_fail_pct,
                        p_duration duration
                        from dual ) src
            on ( dest.application_id = src.app_id
                and dest.standard_id = src.standard_id
                and dest.test_id = src.test_id )
            when matched then
                update set dest.pass_fail_pct = src.pass_fail_pct, dest.test_duration = src.duration
            when not matched then
                insert ( dest.application_id, dest.standard_id, dest.test_id, dest.pass_fail_pct, dest.test_duration )
                values ( src.app_id, src.standard_id, src.test_id, src.pass_fail_pct, src.duration );
        end save_status;
    begin
        for tst_rec in tst_csr loop
            -- Remove any old records that don't apply any more.
            delete from eba_stds_standard_statuses
            where standard_id = tst_rec.standard_id
                and test_id = tst_rec.test_id
                and not exists (select null
                                from eba_stds_applications ap,
                                    eba_stds_standards s,
                                    eba_stds_standard_type_ref st_type,
                                    eba_stds_standard_statuses st_stat,
                                    apex_applications aa
                                where s.id = tst_rec.standard_id
                                    and st_type.standard_id = s.id
                                    and st_type.type_id = ap.type_id
                                    and aa.application_id = ap.apex_app_id
                                    and st_stat.standard_id(+) = tst_rec.standard_id
                                    and st_stat.test_id(+) = tst_rec.test_id
                                    and st_stat.application_id(+) = ap.id);
            -- Paranoia check.
            l_message := is_valid_query( tst_rec.check_sql );
            for app_rec in app_csr( tst_rec.standard_id, tst_rec.test_id ) loop
                if l_message is not null then
                    save_status( p_standard_id => tst_rec.standard_id,
                        p_application_id => null,
                        p_test_id => tst_rec.test_id,
                        p_status => null,
                        p_duration => null );
                else
                    if app_rec.app_update < nvl(app_rec.test_run, app_rec.app_update-1) then
                        null;
                    else
                        l_pass_cnt := 0;
                        l_total := 0;
                        l_start := localtimestamp;
                        begin
                            l_cursor := sys.dbms_sql.open_cursor;
                            sys.dbms_sql.parse( l_cursor, sys.dbms_assert.noop(tst_rec.check_sql), dbms_sql.native);
                            sys.dbms_sql.bind_variable( l_cursor, tst_rec.app_bind_variable, app_rec.apex_app_id );
                            sys.dbms_sql.define_column( l_cursor, 1, l_status, column_size => 1 );
                            if tst_rec.test_type = 'FAIL_REPORT' then
                                sys.dbms_sql.define_column( l_cursor, 2, l_identifier, column_size => 4000 );
                            end if;
                            l_feedback := sys.dbms_sql.execute( l_cursor );
                            loop
                                l_feedback := sys.dbms_sql.fetch_rows( l_cursor );
                                exit when l_feedback = 0;
                                sys.dbms_sql.column_value( l_cursor, 1, l_status );
                                l_total := l_total + 1;
                                if l_status = 'Y' then
                                    l_pass_cnt := l_pass_cnt + 1;
                                else
                                    -- Check the validations table for false positives.
                                    if tst_rec.test_type = 'FAIL_REPORT' then
                                        sys.dbms_sql.column_value( l_cursor, 2, l_identifier );
                                        for c1 in ( select null
                                                    from eba_stds_test_validations tv
                                                    where tv.test_id = tst_rec.test_id
                                                        and tv.application_id = app_rec.apex_app_id
                                                        and tv.result_identifier = l_identifier
                                                        and tv.false_positive_yn = 'Y' ) loop
                                            l_pass_cnt := l_pass_cnt + 1;
                                        end loop;
                                    else
                                        for c1 in ( select null
                                                    from eba_stds_test_validations tv
                                                    where tv.test_id = tst_rec.test_id
                                                        and tv.application_id = app_rec.apex_app_id
                                                        and tv.result_identifier is null
                                                        and tv.false_positive_yn = 'Y' ) loop
                                            l_pass_cnt := l_pass_cnt + 1;
                                        end loop;
                                    end if;
                                end if;
                            end loop;
                            sys.dbms_sql.close_cursor( l_cursor );
                            l_duration := localtimestamp - l_start;
                            l_dur_ms := extract(   day from l_duration) * 24*60*60*1000
                                      + extract(  hour from l_duration) * 60*60*1000
                                      + extract(minute from l_duration) * 60*1000
                                      + extract(second from l_duration) * 1000;
                            save_status( p_standard_id => tst_rec.standard_id,
                                p_application_id => app_rec.application_id,
                                p_test_id => tst_rec.test_id,
                                -- If the report doesn't return anything, treat it as a pass.
                                p_status => case l_total when 0 then 100 else 100*(l_pass_cnt/l_total) end,
                                p_duration => l_dur_ms );
                        exception when others then
                            -- If the Check SQL is bad, we don't want to raise the error;
                            -- the status will be null, indicating a bad test.
                            if sys.dbms_sql.is_open( l_cursor ) then
                                sys.dbms_sql.close_cursor( l_cursor );
                            end if;
                        end;
                    end if;
                end if;
            end loop;
        end loop;
    end update_standard_status;
    
    function build_link( p_test_id in number, p_application_id in number, p_param in varchar2 )
            return varchar2 is

        l_scope logger_logs.scope%type := gc_scope_prefix || 'build_link';
        l_params logger.tab_param;

        l_app number;
        l_page number;
        l_builder_session number := v('APX_BLDR_SESSION');
        l_link varchar2(4000) := null;
        l_version number;
    begin
        logger.append_param(l_params, 'p_test_id', p_test_id);
        logger.append_param(l_params, 'p_application_id', p_application_id);
        logger.append_param(l_params, 'p_param', p_param);
        logger.log('START', l_scope, null, l_params);


        if l_builder_session is null then
            -- Not logged in to the builder; bail out.
            return l_link;
        end if;
        -- Do things differently depending on the APEX version.
        for c1 in ( select to_number(substr(version_no,0,instr(version_no,'.'))) vrsn from apex_release ) loop
            l_version := c1.vrsn;
        end loop;
        if l_version >= 5 then
            l_app := 4000;
            l_page := 4500;
        end if;
        for c1 in ( select link_type from eba_stds_standard_tests where id = p_test_id ) loop
            logger.log('link_type :', l_scope, c1.link_type);
            case c1.link_type
            when 'APPLICATION' then
                l_app := 4000;
                l_page := 1;
                l_link := ':::RP:FB_FLOW_ID,F4000_P1_FLOW,P0_FLOWPAGE:'
                    ||p_application_id||','||p_application_id||','||p_application_id;
            when 'PAGE' then
                if l_version < 5 then
                    l_app := 4000;
                    l_page := 4150;
                    l_link := '::::FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4150_GOTO_PAGE:'
                        ||p_application_id||','||p_param||','||p_param;
                else
                    l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                        ||':'||p_application_id||','||p_param||','||p_application_id||','||p_param||','||p_param
                        ||'#5000:'||p_param;
                end if;
            when 'REGION' then
                for c2 in ( select page_id
                            from apex_application_page_regions
                            where application_id = p_application_id
                                and region_id = p_param ) loop
                    if l_version < 5 then
                        l_app := 4000;
                        l_page := 4651;
                        l_link := ':::RP,4651,960,420,601,4050,27,196,121,232,695,754,832,287,2000'
                            ||':FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4651_ID:'
                            ||p_application_id||','||c2.page_id||','||p_param;
                    else
                        l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                            ||':'||p_application_id||','||c2.page_id||','||p_application_id||','||c2.page_id||','||c2.page_id
                            ||'#5110:'||p_param;
                    end if;
                end loop;
            when 'PAGE_ITEM' then
                for c2 in ( select page_id
                            from apex_application_page_items
                            where application_id = p_application_id
                                and item_id = p_param ) loop
                    if l_version < 5 then
                        l_app := 4000;
                        l_page := 4311;
                        l_link := ':::RP,4311:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4311_ID:'
                            ||p_application_id||','||c2.page_id||','||p_param;
                    else
                        l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                            ||':'||p_application_id||','||c2.page_id||','||p_application_id||','||c2.page_id||','||c2.page_id
                            ||'#5120:'||p_param;
                    end if;
                end loop;
            when 'APP_ITEM' then
                l_app := 4000;
                l_page := 4303;
                l_link := '::::FB_FLOW_ID,F4000_P4303_ID:'
                    ||p_application_id||','||p_param;
            when 'BUTTON' then
                for c2 in ( select page_id
                            from apex_application_page_buttons
                            where application_id = p_application_id
                                and button_id = p_param ) loop
                    if l_version < 5 then
                        l_app := 4000;
                        l_page := 4314;
                        l_link := ':::RP,4314:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4314_ID:'
                            ||p_application_id||','||c2.page_id||','||p_param;
                    else
                        l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                            ||':'||p_application_id||','||c2.page_id||','||p_application_id||','||c2.page_id||','||c2.page_id
                            ||'#5130:'||p_param;
                    end if;
                end loop;
            when 'LIST' then
                l_app := 4000;
                l_page := 4050;
                l_link := ':::4050:FB_FLOW_ID,F4000_P4050_LIST_ID:'
                    ||p_application_id||','||p_param;
            when 'LISTENTRY' then
                l_app := 4000;
                l_page := 4052;
                l_link := ':::4050,4052:FB_FLOW_ID,F4000_P4052_ID:'
                    ||p_application_id||','||p_param;
            when 'SOURCE_CODE' then
                l_link := 'https://google.com';
                logger.log('. l_link:', l_scope, l_link);
            else
                -- Someone tried to link to a component we don't support yet.
                null;
            end case;
        end loop;
        if l_link is not null then
            l_link := 'f?p='||l_app||':'||l_page||':'||l_builder_session||l_link;
        end if;
        return l_link;

    exception when others then 
        logger.log_error('Unhandled Exception', l_scope, 'yo', l_params); 
        raise;
    end build_link;
end eba_stds_parser;
/