set define off
create or replace package body eba_stds_parser as

    gc_scope_prefix   constant varchar2(31) := lower($$plsql_unit) || '.';
    gc_default_app_id constant number := 130;
    

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
    l_scope varchar2(128) := gc_scope_prefix || 'is_valid_query';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';

    l_source_query  clob := p_query;
    l_source_queryv clob;
    l_report_cursor integer;
    begin
        apex_debug.message(l_debug_template,'START', 'p_query', p_query);
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
    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;
    end is_valid_query;

    function view_sql (p_view_name in user_views.view_name%type) return clob
    is
    l_scope varchar2(128) := gc_scope_prefix || 'view_sql';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';

    l_view_name user_views.view_name%type := upper(p_view_name);
    l_sql_long  user_views.text%type;
    begin
      
      assert.is_not_null (  
                      val_in => p_view_name
                    , msg_in => 'The View Name must not be null' 
                );

      select text 
        into l_sql_long
        from user_views
        where view_name  = l_view_name;
        
        return  to_clob(l_sql_long);

    exception 
        when no_data_found then
            apex_debug.message(p_message => l_debug_template, p0 => 'View does not exist :'||p_view_name, p_level => apex_debug.c_log_level_warn, p_force => true);
            raise;
        when others then
            apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception :'||p_view_name, p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
            raise;
    end view_sql;

    function view_sql_w_apex_filter (p_view_name in user_views.view_name%type,
                                     p_app_id    in eba_stds_applications.apex_app_id%type) return clob
    is 
    l_scope varchar2(128) := gc_scope_prefix || 'view_sql_w_apex_filter';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';
    l_sql clob;
    begin
        apex_debug.message(l_debug_template,'START', 'p_view_name', p_view_name, 'p_app_id', p_app_id);
        l_sql := 'select * from ('||eba_stds_parser.view_sql (p_view_name => p_view_name)||') where application_id = '||p_app_id;
        
        apex_debug.message(l_debug_template, 'l_sql', l_sql);
        return l_sql;

    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;      
    end view_sql_w_apex_filter;

    procedure validate_view( p_view_name in user_views.view_name%type       default null,
                             p_test_id   in eba_stds_standard_tests.id%type default null,
                             x_view_sql  out nocopy clob,
                             x_feedback  out nocopy varchar2,
                             x_pass      out nocopy boolean)
    is
    l_scope varchar2(128) := gc_scope_prefix || 'validate_view';
    l_debug_template varchar2(4000) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';
    
    l_view_name       user_views.view_name%type;
    l_sql             clob;
    l_dummy           pls_integer;
    l_failure_message varchar2(4096);

        function get_view_name(p_test_id in eba_stds_standard_tests.id%type) 
                                return user_views.view_name%type
        is 
        l_query_view  eba_stds_standard_tests.query_view%type;
        begin

            select query_view  
                into l_query_view
                from eba_stds_standard_tests st 
                where st.id = p_test_id;

            apex_debug.message(l_debug_template, 'get_view_name', 'END', 'p_test_id', p_test_id, 'l_query_view', l_query_view);
            return l_query_view;
        exception when no_data_found then
            apex_debug.error(p_message => l_debug_template, p0 =>'No Query View found!', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
            raise;
        end get_view_name;

    begin
        apex_debug.message(l_debug_template,'START', 'p_view_name', p_view_name);

        l_view_name := case when p_view_name is not null 
                            then upper(p_view_name)
                            when p_test_id is not null 
                            then get_view_name(p_test_id => p_test_id)
                            end;

        assert.is_not_null (  
                      val_in => l_view_name
                    , msg_in => 'The View Name must not be null' 
                );

        begin <<view_sql>>
            l_sql := eba_stds_parser.view_sql (p_view_name => l_view_name);
        exception when no_data_found then
            apex_debug.message(p_message => l_debug_template, p0 => 'View does not exist', p_level => apex_debug.c_log_level_warn, p_force => true);
            l_failure_message := apex_string.format(p_message => '%0<li>%1</li>', 
                                                    p0 => l_failure_message,
                                                    p1 => apex_lang.message (p_name => 'view_not_in_schema', 
                                                                             p_lang => 'en', 
                                                                             p_application_id => gc_default_app_id)
                                                    );
        end view_sql;

        begin <<pass_fail>>    
            select 1
                into l_dummy
                from all_tab_cols
                where table_name = l_view_name
                and column_name = 'PASS_FAIL'
                and column_id = 1;
        exception when no_data_found then
            apex_debug.message(p_message => l_debug_template, p0 => 'No Application id', p_level => apex_debug.c_log_level_warn, p_force => true);
            l_failure_message := apex_string.format(p_message => '%0<li>%1</li>', 
                                                    p0 => l_failure_message,
                                                    p1 => apex_lang.message (p_name => 'view_must_have_pass_fail', 
                                                                             p_lang => 'en', 
                                                                             p_application_id => gc_default_app_id)
                                                    );
        end application_id;

        begin <<reference_code>>    
            select 1
                into l_dummy
                from all_tab_cols
                where table_name = l_view_name
                and column_name = 'REFERENCE_CODE'
                and column_id = 2;
        exception when no_data_found then
            apex_debug.message(p_message => l_debug_template, p0 => 'No Reference Code', p_level => apex_debug.c_log_level_warn, p_force => true);
            l_failure_message := apex_string.format(p_message => '%0<li>%1</li>', 
                                                    p0 => l_failure_message,
                                                    p1 => apex_lang.message (p_name => 'view_must_have_ref_code', 
                                                                             p_lang => 'en', 
                                                                             p_application_id => gc_default_app_id)
                                                    );
        end reference_code;

        begin <<application_id>>    
            select 1
                into l_dummy
                from all_tab_cols
                where table_name = l_view_name
                and column_name = 'APPLICATION_ID'
                and column_id = 3;
        exception when no_data_found then
            apex_debug.message(p_message => l_debug_template, p0 => 'No Application id', p_level => apex_debug.c_log_level_warn, p_force => true);
            l_failure_message := apex_string.format(p_message => '%0<li>%1</li>', 
                                                    p0 => l_failure_message,
                                                    p1 => apex_lang.message (p_name => 'view_must_have_app_id', 
                                                                             p_lang => 'en', 
                                                                             p_application_id => gc_default_app_id)
                                                    );
        end application_id;


        x_view_sql := apex_string.format('<pre>%s</pre>', l_sql);

        x_feedback := case  when l_failure_message is not null 
                            then apex_string.format('<ul class="u-danger-text">%s</ul>', l_failure_message)
                            else apex_string.format('<p class="u-success-text">%s<p>',
                                                    apex_lang.message (p_name => 'view_meets_criteria', 
                                                                       p_lang => 'en', 
                                                                       p_application_id => gc_default_app_id)
                                                   )
                            end;

        x_pass := case  when l_failure_message is null 
                        then true
                        else false
                        end;

        apex_debug.message(p_message => l_debug_template, 
                           p0 => 'message', 
                           p1 => case when x_pass
                                      then 'view passed!'
                                      else l_failure_message
                                      end, 
                           p_level => apex_debug.c_log_level_warn, 
                           p_force => true);

    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);    
        raise;
    end validate_view;

    -- Procedure: update_standard_status
    -- Updates the standard_statuses table with the current pass/fail
    --   status for each relevant automated test.
    procedure update_standard_status is
        l_scope varchar2(128) := gc_scope_prefix || 'update_standard_status';
        l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';
        
        l_query clob;
        l_cursor integer := null;
        l_feedback integer;
        cursor tst_csr is
            select standard_id,
                id test_id,
                test_type,
                name,
                query_view,
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
            apex_debug.message(l_debug_template, 'save_status', 'p_standard_id', p_standard_id
                                                              , 'p_application_id', p_application_id
                                                              , 'p_test_id', p_test_id
                                                              , 'p_status', p_status
                                                              , 'p_duration', p_duration
                                                              );
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

        exception when others then
            apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        end save_status;
    begin
        apex_debug.message(l_debug_template,'START');

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
            l_message := is_valid_query( eba_stds_parser.view_sql (p_view_name => tst_rec.query_view) );
            
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
                            assert.is_not_null (val_in => tst_rec.query_view , msg_in => 'query_view cannot be null');
                            assert.is_not_null (val_in => app_rec.apex_app_id , msg_in => 'app_rec.apex_app_id cannot be null');
                            sys.dbms_sql.parse( l_cursor, 
                                                view_sql_w_apex_filter (p_view_name => tst_rec.query_view,
                                                                        p_app_id    => app_rec.apex_app_id),
                                                dbms_sql.native);
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
                            apex_debug.message(l_debug_template, 'cursor loop - others exception', sqlerrm);
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
        apex_debug.message(l_debug_template,'END');
    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;
    end update_standard_status;
    
    /**
     * This public function links to objects in the application workspace from the test results page
     *
     *
     * @author Hayden Hudson
     * @created March 29, 2022
     * @p_test_id refers to eba_stds_standard_tests.id → this value is necessary to know the link_type to build (link to app, page, page item, etc)
     * @p_param colon-separated list of parameters necessary to build the link. The 1st parameter is always application id.
     */ 
    function build_link( p_test_id        in eba_stds_standard_tests.id%type, 
                         p_param          in varchar2
                          )
            return varchar2 is

    l_scope varchar2(50) := gc_scope_prefix || 'build_link';
    l_debug_template varchar2(4000) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10';

    
    l_link_type  eba_stds_standard_tests.link_type%type;
    l_app number;
    l_page number;
    l_builder_session number := v('APX_BLDR_SESSION');
    l_link varchar2(4000) := null;
    l_version number;
    l_url_params apex_t_varchar2 := apex_string.split(p_param, ':');
    l_app_being_tested apex_applications.application_id%type;
    l_param varchar2(25); -- := l_url_params(2)
    l_valid_workspace boolean := true;
    l_logged_into_builder boolean := true;
    
    procedure start_assertions is 
    begin
        assert.is_not_null (  
            val_in => p_test_id
            , msg_in => 'Test id cannot be null');
        assert.is_not_null (  
            val_in => p_param
            , msg_in => 'p_param cannot be null');
    end start_assertions;

    procedure link_to_db_object is 
    l_object_name user_objects.object_name%type;
    l_object_type user_objects.object_type%type;
    l_line_number user_source.line%type;
    l_object_id   user_objects.object_id%type;
    begin
        l_app := 4500;
            
        l_url_params := apex_string.split(p_param, ':');
        l_object_name := l_url_params(2);
        l_object_type := case when l_url_params(3) = 'PACKAGE BODY'
                              then 'PACKAGE'
                              when l_url_params(3) = 'TYPE BODY'
                              then 'TYPE'
                              else l_url_params(3)
                              end;
        l_line_number := l_url_params(4);

        l_page := case when 1=1
                        then 1001
                        when l_object_type = 'FUNCTION'
                        then 2250
                        when l_object_type like 'PACKAGE%'
                        then 2300
                        else 1001
                        end;
        
        select object_id
        into l_object_id
        from user_objects
        where object_type = l_object_type
        and object_name = l_object_name;

        apex_debug.info(l_debug_template, 'l_object_name', l_object_name, 'l_object_type', l_object_type,'l_line_number', l_line_number, 'l_object_id', l_object_id);

        l_link := apex_string.format(p_message => ':FOCUS:::OB_CURRENT_TYPE,OB_FIND,OB_OBJECT_NAME,OB_OBJECT_ID'||
                                                        ':%1,%2,%3,%4',
                                        p1 => l_object_type,
                                        p2 => l_object_name,
                                        p3 => l_object_name,
                                        p4 => l_object_id
                                        );
        apex_debug.message(p_message => l_debug_template, p0 => 'l_link', p1 => l_link, p_level => apex_debug.c_log_level_warn, p_force => true);
    end link_to_db_object;

    procedure link_to_listentry is
    l_list_entry_id apex_application_list_entries.list_entry_id%type;
    begin
        l_list_entry_id := l_url_params(3);
        l_app := 4000;
        l_page := 4052;
        l_link := ':::RP,4050,4052:F4000_P4052_ID,F4000_P4050_LIST_ID,FB_FLOW_ID:'
            ||l_list_entry_id||','||l_param||','||l_app_being_tested;
    end link_to_listentry;

    procedure app_in_current_workspace (p_app_id in apex_applications.application_id%type)
    is 
    l_dummy number;
    begin

        assert.is_not_null (  
            val_in => p_app_id
            , msg_in => 'App id cannot be null');

         assert.is_not_null (  
            val_in => v('APP_ID')
            , msg_in => 'You cannot test this outside of an APEX session');

        select 1
            into l_dummy
            from apex_applications aa 
            where aa.application_id = p_app_id
            and aa.workspace = (select workspace
                                from apex_applications
                                where application_id =  v('APP_ID'));
    exception when no_data_found then
        apex_debug.message(p_message => l_debug_template, p0 =>'wrong workspace', p1 => sqlerrm, p2 => v('APP_ID'), p3=> p_app_id);
        l_valid_workspace := false;
    end app_in_current_workspace;
    begin
        apex_debug.message(l_debug_template,'START', 'p_test_id', p_test_id, 
                                                     'p_param', p_param,
                                                     'l_builder_session', l_builder_session);

        start_assertions;

        if l_builder_session is null then
            -- Not logged in to the builder; bail out.
            l_logged_into_builder := false;
        end if;
        -- Do things differently depending on the APEX version.
        for c1 in ( select to_number(substr(version_no,0,instr(version_no,'.'))) vrsn from apex_release ) loop
            l_version := c1.vrsn;
        end loop;
        if l_version >= 5 then
            l_app := 4000;
            l_page := 4500;
        end if;
        apex_debug.info(l_debug_template, 'l_version', l_version);

        for c1 in ( select link_type, test_type
                        from eba_stds_standard_tests 
                        where id = p_test_id ) loop
            l_link_type := case when c1.link_type is not null
                                then c1.link_type
                                when c1.test_type = 'PASS_FAIL'
                                then 'APPLICATION'
                                end;
            
            apex_debug.message(p_message => l_debug_template, p0 => 'link_type', p1 => l_link_type, p_level => apex_debug.c_log_level_warn, p_force => true);
            
            case l_link_type
            when 'DB_SUPPORTING_OBJECT' then
                link_to_db_object;
            else 
                case l_link_type
                when 'APPLICATION' then
                    l_app_being_tested := p_param;
                    app_in_current_workspace (p_app_id => l_app_being_tested);
                    apex_debug.info(l_debug_template, 'l_app_being_tested', l_app_being_tested);
                    l_app := 4000;
                    l_page := 1;
                    l_link := ':::RP:FB_FLOW_ID,F4000_P1_FLOW,P0_FLOWPAGE:'
                        ||l_app_being_tested||','||l_app_being_tested||','||l_app_being_tested;
                else 
                    l_param := l_url_params(2);
                    apex_debug.message(p_message => l_debug_template, p0 => 'l_param', p1 => l_param, p_level => apex_debug.c_log_level_warn, p_force => true);
                    case l_link_type
                        when 'PAGE' then
                        if l_version < 5 then
                            l_app := 4000;
                            l_page := 4150;
                            l_link := '::::FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4150_GOTO_PAGE:'
                                ||l_app_being_tested||','||l_param||','||l_param;
                        else
                            l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                                ||':'||l_app_being_tested||','||l_param||','||l_app_being_tested||','||l_param||','||l_param
                                ||'#5000:'||l_param;
                        end if;
                    when 'REGION' then
                        for c2 in ( select page_id
                                    from apex_application_page_regions
                                    where application_id = l_app_being_tested
                                        and region_id = l_param ) loop
                            if l_version < 5 then
                                l_app := 4000;
                                l_page := 4651;
                                l_link := ':::RP,4651,960,420,601,4050,27,196,121,232,695,754,832,287,2000'
                                    ||':FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4651_ID:'
                                    ||l_app_being_tested||','||c2.page_id||','||l_param;
                            else
                                l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                                    ||':'||l_app_being_tested||','||c2.page_id||','||l_app_being_tested||','||c2.page_id||','||c2.page_id
                                    ||'#5110:'||l_param;
                            end if;
                        end loop;
                    when 'PAGE_ITEM' then
                        for c2 in ( select page_id
                                    from apex_application_page_items
                                    where application_id = l_app_being_tested
                                        and item_id = l_param ) loop
                            if l_version < 5 then
                                l_app := 4000;
                                l_page := 4311;
                                l_link := ':::RP,4311:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4311_ID:'
                                    ||l_app_being_tested||','||c2.page_id||','||l_param;
                            else
                                l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                                    ||':'||l_app_being_tested||','||c2.page_id||','||l_app_being_tested||','||c2.page_id||','||c2.page_id
                                    ||'#5120:'||l_param;
                            end if;
                        end loop;
                    when 'APP_ITEM' then
                        l_app := 4000;
                        l_page := 4303;
                        l_link := '::::FB_FLOW_ID,F4000_P4303_ID:'
                            ||l_app_being_tested||','||l_param;
                    when 'BUTTON' then
                        for c2 in ( select page_id
                                    from apex_application_page_buttons
                                    where application_id = l_app_being_tested
                                        and button_id = l_param ) loop
                            if l_version < 5 then
                                l_app := 4000;
                                l_page := 4314;
                                l_link := ':::RP,4314:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4314_ID:'
                                    ||l_app_being_tested||','||c2.page_id||','||l_param;
                            else
                                l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                                    ||':'||l_app_being_tested||','||c2.page_id||','||l_app_being_tested||','||c2.page_id||','||c2.page_id
                                    ||'#5130:'||l_param;
                            end if;
                        end loop;
                    when 'LIST' then
                        l_app := 4000;
                        l_page := 4050;
                        l_link := ':::4050:FB_FLOW_ID,F4000_P4050_LIST_ID:'
                            ||l_app_being_tested||','||l_param;
                    when 'LISTENTRY' then
                        link_to_listentry;
                    else
                    -- Someone tried to link to a component we don't support yet.
                        apex_debug.error(p_message => l_debug_template, p0 =>'Unknown link type', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
                    end case;
                end case;
            end case;
        end loop;
        l_link := case when l_logged_into_builder = false
                       then null
                       when l_valid_workspace = false 
                       then null
                       when l_link is not null
                       then 'f?p='||l_app||':'||l_page||':'||l_builder_session||l_link
                       end;
        apex_debug.info(l_debug_template, 'l_link', l_link);
        return l_link;

    exception 
        when others then 
            apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
            raise;
    end build_link;

    procedure load_collection(  p_test_id        in eba_stds_standard_tests.id%type,
                                p_page_id        in apex_application_pages.page_id%type,
                                p_application_id in apex_applications.application_id%type default null
                                )
    is
    l_scope varchar2(50) := gc_scope_prefix || 'load_collection';
    l_debug_template varchar2(4000) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10';

    l_query_view        eba_stds_standard_tests.query_view%type;
    l_sql               clob;

    l_collection apex_collections.collection_name%type := apex_string.format('EBA_STDS_P%s_TEST_RESULTS', p_page_id);
    l_names      apex_application_global.vc_arr2;
    l_values     apex_application_global.vc_arr2;

    l_cursor    number;
    l_feedback  number;
    l_col_cnt   integer;
    l_col_max   pls_integer := 10;
    l_rec_tab   dbms_sql.desc_tab;

    procedure assertions is
    begin
        assert.is_not_null (  
                    val_in => p_page_id  
                , msg_in => 'The Page ID must not be null' 
            );
        assert.is_not_null (  
                    val_in => p_test_id  
                , msg_in => 'The Test ID must not be null' 
            );
        
    end assertions;
    begin
        apex_debug.message(l_debug_template,'START', 'p_page_id', p_page_id, 'p_application_id', p_application_id, 'p_test_id', p_test_id, 'l_collection', l_collection);

       assertions;

        -- If the collection already exists, we need to delete it; otherwise,
        -- create_collection_from_query_b will throw an error.
        if apex_collection.collection_exists( l_collection ) then
            apex_collection.delete_collection( l_collection );
        end if;


        select query_view
        into l_query_view
        from eba_stds_standard_tests
        where id = p_test_id;

        assert.is_not_null (  
                  val_in => l_query_view  
                , msg_in => 'Query View must not be null' 
            );
        
        l_sql := case when p_application_id is null 
                      then view_sql (p_view_name => l_query_view)
                      else view_sql_w_apex_filter (p_view_name => l_query_view,
                                                   p_app_id => p_application_id)
                      end;

         assert.is_not_null (  
                  val_in => l_sql  
                , msg_in => 'sql must not be null' 
            );
        
        apex_collection.create_collection_from_query_b(
            p_collection_name => l_collection,
            p_query => l_sql,
            p_names => l_names,
            p_values => l_values,
            p_truncate_if_exists => 'YES'
        );
    
        -- Now get the column headings and which columns to display.
        l_cursor := dbms_sql.open_cursor;
        dbms_sql.parse(l_cursor, l_sql, dbms_sql.native);

        l_feedback := dbms_sql.execute(l_cursor);

        dbms_sql.describe_columns(l_cursor, l_col_cnt, l_rec_tab);
        
        apex_debug.info(l_debug_template, 'l_col_cnt', l_col_cnt);

        l_col_cnt := least(l_col_cnt, l_col_max);

        for j in 3..l_col_cnt loop
            apex_util.set_session_state(apex_string.format('P%s_COL%s', p_page_id, j), 
                                        initcap(replace(l_rec_tab(j).col_name,'_',' ')));
        end loop;
        dbms_sql.close_cursor(l_cursor);

    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
        raise;
    end load_collection;

    procedure assert_exception (
                p_result_identifier in eba_stds_test_validations.result_identifier%type,
                p_test_id           in eba_stds_test_validations.test_id%type          default null,
                p_app_id            in eba_stds_test_validations.application_id%type   default null,
                p_exception_type    in varchar2                                        default g_false_neg
                )
    is 
    l_scope varchar2(50) := gc_scope_prefix || 'assert_exception';
    l_debug_template varchar2(4000) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15';
    
    
    l_app_id                eba_stds_test_validations.application_id%type;
    l_1st_identifer_w_sign  varchar2(112); -- this is the test id with a plus or a minus in front
    l_test_id               eba_stds_test_validations.test_id%type;
    l_false_positive_yn     eba_stds_test_validations.false_positive_yn%type := case when p_exception_type = g_false_neg
                                                                                     then 'Y'
                                                                                     end;
    l_legacy_yn             eba_stds_test_validations.legacy_yn%type := case when p_exception_type = g_legacy
                                                                             then 'Y'
                                                                             end;

    procedure parse_result_identifier is 
    l_params         apex_t_varchar2;
    l_2nd_identifier varchar2(25);

    begin
        l_params := apex_string.split(p_result_identifier, ':');
        l_1st_identifer_w_sign  := l_params(1);

        l_app_id := case when p_app_id is not null 
                            then p_app_id 
                            else l_params(2)
                            end;

        l_test_id := case when p_test_id is not null 
                            then p_test_id 
                            else substr(l_1st_identifer_w_sign,2)
                            end;
                            

        apex_debug.message(l_debug_template, 'parse_result_identifier', 'l_params(1)',l_params(1), 
                                                                        'l_params(2)', l_params(2),
                                                                        'l_app_id', l_app_id,
                                                                        'l_test_id', l_test_id);
        
    end parse_result_identifier;

    begin
        apex_debug.message(l_debug_template,'START', 'p_result_identifier', p_result_identifier, 
                                                     'p_test_id', p_test_id, 
                                                     'p_app_id', p_app_id,
                                                     'p_exception_type', p_exception_type);

        assert.is_not_null (  
                      val_in => p_result_identifier  
                    , msg_in => 'The Result Identifier must not be null' 
                );

        parse_result_identifier;

        assert.is_not_null (  
                      val_in => l_app_id  
                    , msg_in => 'The App ID must not be null' 
                );
        
        assert.is_not_null (  
                      val_in => l_test_id  
                    , msg_in => 'The Test ID must not be null' 
                );

        if substr(l_1st_identifer_w_sign,1,1) = '+' then
            merge into eba_stds_test_validations dest
                using ( select 
                            l_test_id test_id,
                            l_app_id application_id,
                            substr(p_result_identifier,2) result_identifier
                        from dual ) src
                on ( dest.test_id = src.test_id
                    and dest.application_id = src.application_id
                    and dest.result_identifier = src.result_identifier
                )
            when matched then
                update set dest.false_positive_yn = case when p_exception_type = g_false_neg
                                                         then 'Y'
                                                         else dest.false_positive_yn
                                                         end,
                           dest.legacy_yn = case when p_exception_type = g_legacy
                                                 then 'Y'
                                                 else dest.legacy_yn
                                                 end
            when not matched then
                insert ( test_id    , application_id    , result_identifier    ,   false_positive_yn,  legacy_yn )
                values ( src.test_id, src.application_id, src.result_identifier, l_false_positive_yn,l_legacy_yn );
        else
            update eba_stds_test_validations tv
            set tv.false_positive_yn = case when p_exception_type = g_false_neg
                                            then 'N'
                                            else tv.false_positive_yn
                                            end,
                tv.legacy_yn = case when p_exception_type = g_legacy
                                    then 'N'
                                    else tv.legacy_yn
                                    end
            where tv.test_id = l_test_id
                and tv.application_id = l_app_id
                and tv.result_identifier = substr(p_result_identifier,2);
        end if;

    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
        raise;
    end assert_exception;

    function default_application_id  
        return eba_stds_test_validations.application_id%type deterministic
    is 
    l_scope varchar2(50) := gc_scope_prefix || 'default_application_id';
    l_debug_template varchar2(4000) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10';

    l_app_id apex_applications.application_id%type;
    begin
        select application_id 
            into l_app_id
            from apex_applications aa
            where application_id = gc_default_app_id;
        
        return l_app_id;
    
    exception 
        when no_data_found then
            apex_debug.error(p_message => l_debug_template, p0 =>'You need to specify a valid default application id', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
            raise;
        when others then
            apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
            raise;
    end default_application_id;

    function test_results_sql return varchar2
    is 
    l_scope varchar2(50) := gc_scope_prefix || 'test_results_sql';
    l_debug_template varchar2(4000) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10';

    begin
        apex_debug.message(l_debug_template,'START');

        return q'~
            select 
                 apex_item.checkbox(1,
                                case when ac.c001 = 'N' and tv.legacy_yn = 'Y'
                                     then '-'||:P19_TEST_ID||':' ||ac.c002
                                     when ac.c001 = 'N'
                                     then '+'||:P19_TEST_ID||':'||ac.c002
                                     else ''
                                     end
                              ) cb,
                case when ac.c001 = 'Y' 
                     then 'Pass'
                     when tv.false_positive_yn = 'Y' 
                     then 'False Negative'
                     when tv.legacy_yn = 'Y'
                     then 'Legacy'
                     else 'Fail'
                     end as status,
                case when ac.c001 = 'N' and tv.false_positive_yn = 'Y' 
                     then
                     '<a href="javascript:$s(''P19_VALIDATE'',''-'||:P19_TEST_ID||':'||ac.c002||''');" '
                        ||'class="t-Button t-Button--success t-Button--stretch">'
                        ||'Marked as Valid</a>'
                        ||'<div style="text-align:center">'||apex_util.get_since(tv.updated)
                        ||' by '||apex_escape.html(tv.updated_by)||'</div>'
                     when ac.c001 = 'N' 
                     then
                        '<a href="javascript:$s(''P19_VALIDATE'',''+'||:P19_TEST_ID||':'||ac.c002||''');" '
                        ||'class="t-Button t-Button--stretch">'
                        ||'Mark as Valid</a>'
                     else '&nbsp;' 
                     end as false_neg_date,
                case when ac.c001 = 'N' and tv.legacy_yn = 'Y' 
                     then '<a href="javascript:$s(''P19_LEGACY'',''-'||:P19_TEST_ID||':'||ac.c002||''');" 
                           class="t-Button t-Button--primary t-Button--stretch">
                           Marked as Legacy</a>
                           <div style="text-align:center">'||apex_util.get_since(tv.updated)||' by '||apex_escape.html(tv.updated_by)||'</div>'
                     when ac.c001 = 'N' 
                     then '<a href="javascript:$s(''P19_LEGACY'',''+'||:P19_TEST_ID||':'||ac.c002||''');"
                          class="t-Button t-Button--stretch"> Mark as Legacy</a>'
                     else ' ' 
                     end as legacy_date,
                case when :APX_BLDR_SESSION is not null
                        and apex_util.get_build_option_status(p_application_id => :APP_ID,
                                                            p_build_option_name => 'Link to Builder') = 'INCLUDE' 
                     then
                     'javascript:openInBuilder('''
                        ||eba_stds_parser.build_link( :P19_TEST_ID, ac.c002 )
                        ||''');'
                     else 'javascript:null;'
                     end as edit_link,
                ac.c002 reference_code , ac.c003 application_id, 
                ac.c004, ac.c005, ac.c006, ac.c007, ac.c008, ac.c009, ac.c010,
                ac.c011, ac.c012, ac.c013, ac.c014, ac.c015, ac.c016, ac.c017, ac.c018, ac.c019, ac.c020,
                ac.c021, ac.c022, ac.c023, ac.c024, ac.c025, ac.c026, ac.c027, ac.c028, ac.c029, ac.c030,
                ac.c031, ac.c032, ac.c033, ac.c034, ac.c035, ac.c036, ac.c037, ac.c038, ac.c039, ac.c040,
                ac.c041, ac.c042, ac.c043, ac.c044, ac.c045, ac.c046, ac.c047, ac.c048, ac.c049, ac.c050,
                ac.seq_id,
                case when length(''''||eba_stds_parser.build_link( :P19_TEST_ID, ac.c002 )||'''') > 2 -- only enable button if there is a link to follow
                     then case when ac.c001 = 'Y' or tv.false_positive_yn = 'Y' 
                               then 'success'
                               when tv.legacy_yn = 'Y'
                               then 'primary'
                               else 'warning' 
                               end 
                     else 'disabled'
                     end as button_style,
                stat.name app_status, sty.name app_type, aa.application_name
            from apex_collections ac
            inner join eba_stds_applications sa on sa.apex_app_id = ac.c003
            inner join apex_applications aa on aa.application_id = sa.apex_app_id
            left join eba_stds_types sty on sa.type_id = sty.id
            left join eba_stds_app_statuses stat on sa.status_id  = stat.id
            left join eba_stds_test_validations tv on  tv.test_id = :P19_TEST_ID
                                                   and tv.result_identifier = :P19_TEST_ID||':'||ac.c002
            where ac.collection_name = 'EBA_STDS_P19_TEST_RESULTS'
            and (sa.apex_app_id = :P19_APPLICATION_ID or :P19_APPLICATION_ID is null)
            ~';
    
    exception when others then
            apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
            raise;
    end test_results_sql;

    function test_status_sql return varchar2
    is 
    l_scope varchar2(128) := gc_scope_prefix || 'test_status_sql';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';
    begin
        apex_debug.message(l_debug_template,'START');

        return q'~
        select t.name test_name,
            s.pass_fail_pct,
            case
                when s.pass_fail_pct is null then
                    'The query for this test is invalid.'
                when s.pass_fail_pct < 100 then
                    t.failure_help_text
                else
                    null
            end as message,
            t.id test_id,
            a.apex_app_id application_id,
            case when t.test_type = 'PASS_FAIL' 
                 then case when tv.false_positive_yn = 'Y' 
                           then 'Marked as Valid <div style="text-align:center">'||apex_util.get_since(tv.updated)||' by '||apex_escape.html(tv.updated_by)||'</div>'
                           when s.pass_fail_pct < 100 and nvl(tv.false_positive_yn,'X') <> 'Y' 
                           then 'Mark as Valid'
                           end
                 end as validation_button_message,
            case when t.test_type = 'PASS_FAIL' 
                 then case when tv.false_positive_yn = 'Y' 
                           then
                                'javascript:$s(''P20_VALIDATE'',''-'||t.id||':'||a.apex_app_id||''');'
                           when s.pass_fail_pct < 100 and nvl(tv.false_positive_yn,'X') <> 'Y' 
                           then
                                'javascript:$s(''P20_VALIDATE'',''+'||t.id||':'||a.apex_app_id||''');'
                           end
                 end as validation_javascript,
            case when t.test_type = 'PASS_FAIL'
                 then case when s.pass_fail_pct < 100
                           then 'show'
                           else 'hide'
                           end
                 else 'hide'
                 end as validation_show_hide,
            case when t.test_type = 'PASS_FAIL'
                 then case when tv.false_positive_yn = 'Y' 
                           then
                                'success'
                           when s.pass_fail_pct < 100 and nvl(tv.false_positive_yn,'X') <> 'Y' 
                           then
                                'warning'
                           end
                 end as validation_style
        from 
            eba_stds_standard_statuses s join eba_stds_applications a on a.id = s.application_id
            inner join eba_stds_standard_tests t on t.id = s.test_id and t.standard_id = s.standard_id
            left outer join eba_stds_test_validations tv on s.test_id = tv.test_id and a.apex_app_id = tv.application_id
        where s.application_id = :P20_APPLICATION_ID
            and s.standard_id = :P20_ID
        order by t.display_sequence nulls last, lower(t.name)    
        ~';
    
    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;
    end test_status_sql;


    procedure run_all_tests (p_standard_id in eba_stds_standards.id%type)
    is 
    l_scope varchar2(50) := gc_scope_prefix || 'run_all_tests';
    l_debug_template varchar2(4000) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';
    begin
        apex_debug.message(l_debug_template,'START', 'p_standard_id', p_standard_id);

        delete from eba_stds_standard_statuses
            where standard_id = p_standard_id;

        --select uses_plscope_yn
        --    from eba_stds_standard_tests
        --    where standard_id = p_standard_id;
      
    exception when others then
            apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4000);
            raise;
    end run_all_tests;

    procedure add_applications
    is
    l_scope varchar2(128) := gc_scope_prefix || 'add_applications';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20'; 
    f number;
    l_default_id eba_stds_types.id%type;
        procedure get_default_id
        is 
        begin
           select id 
            into l_default_id
            from eba_stds_types
            where lower(name) = 'default';
        
        exception when no_data_found then 
            l_default_id := null;
            apex_debug.message(l_debug_template, 'No Default ID');
        end get_default_id;
    begin
        apex_debug.message(l_debug_template,'START');

        get_default_id;
        
        for i in 1..wwv_flow.g_f01.count loop
            f := wwv_flow.g_f01(i);
            insert into eba_stds_applications(apex_app_id, type_id) values (f, l_default_id);
        end loop;

    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;
    end add_applications;
    
    procedure bulk_mark_exception (
                p_test_id           in eba_stds_test_validations.test_id%type          default null,
                p_app_id            in eba_stds_test_validations.application_id%type   default null,
                p_exception_type    in varchar2                                        default g_false_neg)
    is
    l_scope varchar2(128) := gc_scope_prefix || 'bulk_mark_exception';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20'; 
    
    l_reference_code varchar2(128);
    begin
        apex_debug.message(l_debug_template,'START', 'p_test_id', p_test_id, 'p_app_id', p_app_id, 'p_exception_type', p_exception_type);

        for i in 1..wwv_flow.g_f01.count loop
            l_reference_code := wwv_flow.g_f01(i);
            apex_debug.message(l_debug_template, 'l_reference_code', l_reference_code);
            if l_reference_code is not null then 
                eba_stds_parser.assert_exception (
                    p_result_identifier => l_reference_code,
                    p_test_id           => p_test_id,
                    p_exception_type    => p_exception_type
                    );
            end if;
        end loop;

    exception when others then
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;
    end bulk_mark_exception;

end eba_stds_parser;
/