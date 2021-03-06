create or replace package body eba_stds_export as

    function encode_as_str( p_value in varchar2 ) return varchar2 is
    begin
        if p_value is null then
            return 'null';
        elsif instr( p_value, ']''' ) = 0 then
            return 'q''['||p_value||']''';
        elsif instr( p_value, ')''' ) = 0 then
            return 'q''('||p_value||')''';
        elsif instr( p_value, '#''' ) = 0 then
            return 'q''#'||p_value||'#''';
        elsif instr( p_value, '~''' ) = 0 then
            return 'q''~'||p_value||'~''';
        elsif instr( p_value, '!''' ) = 0 then
            return 'q''!'||p_value||'!''';
        elsif instr( p_value, '"''' ) = 0 then
            return 'q''"'||p_value||'"''';
        elsif instr( p_value, '$''' ) = 0 then
            return 'q''$'||p_value||'$''';
        else
            sys.htp.p('Error: Can''t encode string "'||p_value||'"');
            return p_value;
        end if;
    end encode_as_str;

    function timestamp_as_str( p_value in timestamp ) return varchar2 is
    begin
        if p_value is null then
            return 'null';
        end if;
        return q'[to_timestamp(']'
            ||to_char( p_value, 'DD-MM-YYYY HH24:MI:SS.FF')
            ||q'[', 'DD-MM-YYYY HH24:MI:SS.FF')]';
    end timestamp_as_str;

    procedure export( p_standard_id in number, p_test_id in number ) is
        l_chunk number := 500;
        l_str varchar2(31000) := '';
        l_off number := 1;
        l_sz  number;
        l_crlf char(2) := chr(13)||chr(10);
        l_tab  char(4) := '    ';
    begin
        for c1 in ( select id,              -- number        not null
                        name,               -- varchar2(64)  not null
                        description,        -- varchar2(4000)
                        primary_developer,  -- varchar2(255)
                        implementation,     -- clob
                        date_started,       -- timestamp(6)  not null
                        created,            -- timestamp(6)  not null
                        created_by,         -- varchar2(255) not null
                        updated,            -- timestamp(6)  not null
                        updated_by,         -- varchar2(255) not null
                        standards_flex_01,  -- varchar2(4000)
                        standards_flex_02,  -- varchar2(4000)
                        standards_flex_03,  -- varchar2(4000)
                        standards_flex_04,  -- varchar2(4000)
                        standards_flex_05,  -- varchar2(4000)
                        standards_flex_06,  -- varchar2(4000)
                        standards_flex_07,  -- varchar2(4000)
                        standards_flex_08,  -- varchar2(4000)
                        standards_flex_n01, -- number
                        standards_flex_n02, -- number
                        standards_flex_n03, -- number
                        standards_flex_n04, -- number
                        standards_flex_d01, -- timestamp(6) with local time zone
                        standards_flex_d02, -- timestamp(6) with local time zone
                        standards_flex_d03, -- timestamp(6) with local time zone
                        standards_flex_d04, -- timestamp(6) with local time zone
                        standards_flex_clob -- clob
                    from eba_stds_standards st
                    where (p_standard_id is null
                            or st.id = p_standard_id )
                        and ( p_test_id is null
                            or exists ( select null
                                        from eba_stds_standard_tests tst
                                        where tst.id = p_test_id
                                            and tst.standard_id = st.id ))
                ) loop
            sys.htp.p('delete from eba_stds_standards where id = '||c1.id||';');
            sys.htp.p('insert into eba_stds_standards( '
                ||'id, name, description, primary_developer, '
                ||'date_started, created, created_by, updated, updated_by, '
                ||'standards_flex_01, standards_flex_02, standards_flex_03, '
                ||'standards_flex_04, standards_flex_05, standards_flex_06, '
                ||'standards_flex_07, standards_flex_08, standards_flex_n01, '
                ||'standards_flex_n02, standards_flex_n03, standards_flex_n04, '
                ||'standards_flex_d01, standards_flex_d02, standards_flex_d03, '
                ||'standards_flex_d04 ) '
                ||'values ('
                ||c1.id||', '
                ||encode_as_str(c1.name)||', '
                ||encode_as_str(c1.description)||', '
                ||encode_as_str(c1.primary_developer)||', '
                ||timestamp_as_str(c1.date_started)||', '
                ||timestamp_as_str(c1.created)||', '
                ||encode_as_str(c1.created_by)||', '
                ||timestamp_as_str(c1.updated)||', '
                ||encode_as_str(c1.updated_by)||', '
                ||encode_as_str(c1.standards_flex_01)||', '
                ||encode_as_str(c1.standards_flex_02)||', '
                ||encode_as_str(c1.standards_flex_03)||', '
                ||encode_as_str(c1.standards_flex_04)||', '
                ||encode_as_str(c1.standards_flex_05)||', '
                ||encode_as_str(c1.standards_flex_06)||', '
                ||encode_as_str(c1.standards_flex_07)||', '
                ||encode_as_str(c1.standards_flex_08)||', '
                ||nvl(to_char(c1.standards_flex_n01),'null')||', '
                ||nvl(to_char(c1.standards_flex_n02),'null')||', '
                ||nvl(to_char(c1.standards_flex_n03),'null')||', '
                ||nvl(to_char(c1.standards_flex_n04),'null')||', '
                ||timestamp_as_str(c1.standards_flex_d01)||', '
                ||timestamp_as_str(c1.standards_flex_d02)||', '
                ||timestamp_as_str(c1.standards_flex_d03)||', '
                ||timestamp_as_str(c1.standards_flex_d04)||');'
            );
            -- Save implementation
            if dbms_lob.getlength( c1.implementation ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.implementation );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.implementation, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standards '
                    ||'set implementation = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;
            -- Save standards_flex_clob
            if dbms_lob.getlength( c1.standards_flex_clob ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.standards_flex_clob );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.standards_flex_clob, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standards '
                    ||'set standards_flex_clob = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;
        end loop;

        for c1 in ( select id,              -- number       not null
                        standard_id,       -- number       not null
                        test_type,         -- varchar2(16) not null
                        name,              -- varchar2(64) not null
                        display_sequence,  -- number
                        -- check_sql,         -- clob
                        -- app_bind_variable, -- varchar2(30) not null
                        link_type,         -- varchar2(64)
                        failure_help_text, -- varchar2(4000)
                        created,           -- timestamp(6) with local time zone   not null
                        created_by,        -- varchar2(255) not null
                        updated,           -- timestamp(6) with local time zone   not null
                        updated_by,        -- varchar2(255) not null
                        tests_flex_01,     -- varchar2(4000)
                        tests_flex_02,     -- varchar2(4000)
                        tests_flex_03,     -- varchar2(4000)
                        tests_flex_04,     -- varchar2(4000)
                        tests_flex_05,     -- varchar2(4000)
                        tests_flex_06,     -- varchar2(4000)
                        tests_flex_07,     -- varchar2(4000)
                        tests_flex_08,     -- varchar2(4000)
                        tests_flex_n01,    -- number
                        tests_flex_n02,    -- number
                        tests_flex_n03,    -- number
                        tests_flex_n04,    -- number
                        tests_flex_d01,    -- timestamp(6) with local time zone
                        tests_flex_d02,    -- timestamp(6) with local time zone
                        tests_flex_d03,    -- timestamp(6) with local time zone
                        tests_flex_d04,    -- timestamp(6) with local time zone
                        tests_flex_clob    -- clob
                    from eba_stds_standard_tests tst
                    where ( p_test_id is null
                            or tst.id = p_test_id )
                        and ( p_standard_id is null
                            or tst.standard_id = p_standard_id )
                ) loop
            sys.htp.p('delete from eba_stds_standard_tests where id = '||c1.id||';');
            sys.htp.p('insert into eba_stds_standard_tests( '
                ||'id, standard_id, test_type, name, display_sequence, '
                -- ||'app_bind_variable, link_type, failure_help_text, created, '
                ||'created_by, updated, updated_by, tests_flex_01, tests_flex_02, '
                ||'tests_flex_03, tests_flex_04, tests_flex_05, tests_flex_06, '
                ||'tests_flex_07, tests_flex_08, tests_flex_n01, tests_flex_n02, '
                ||'tests_flex_n03, tests_flex_n04, tests_flex_d01, tests_flex_d02, '
                ||'tests_flex_d03, tests_flex_d04 ) '
                ||'values ('
                ||c1.id||', '
                ||c1.standard_id||', '
                ||encode_as_str(c1.test_type)||', '
                ||encode_as_str(c1.name)||', '
                ||c1.display_sequence||', '
                -- ||encode_as_str(c1.app_bind_variable)||', '
                ||encode_as_str(c1.link_type)||', '
                ||encode_as_str(c1.failure_help_text)||', '
                ||timestamp_as_str(c1.created)||', '
                ||encode_as_str(c1.created_by)||', '
                ||timestamp_as_str(c1.updated)||', '
                ||encode_as_str(c1.updated_by)||', '
                ||encode_as_str(c1.tests_flex_01)||', '
                ||encode_as_str(c1.tests_flex_02)||', '
                ||encode_as_str(c1.tests_flex_03)||', '
                ||encode_as_str(c1.tests_flex_04)||', '
                ||encode_as_str(c1.tests_flex_05)||', '
                ||encode_as_str(c1.tests_flex_06)||', '
                ||encode_as_str(c1.tests_flex_07)||', '
                ||encode_as_str(c1.tests_flex_08)||', '
                ||nvl(to_char(c1.tests_flex_n01),'null')||', '
                ||nvl(to_char(c1.tests_flex_n02),'null')||', '
                ||nvl(to_char(c1.tests_flex_n03),'null')||', '
                ||nvl(to_char(c1.tests_flex_n04),'null')||', '
                ||timestamp_as_str(c1.tests_flex_d01)||', '
                ||timestamp_as_str(c1.tests_flex_d02)||', '
                ||timestamp_as_str(c1.tests_flex_d03)||', '
                ||timestamp_as_str(c1.tests_flex_d04)
                ||');'
            );
            -- Save check_sql
            /*if dbms_lob.getlength( c1.check_sql ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.check_sql );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.check_sql, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standard_tests '
                    ||'set check_sql = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;*/
            -- Save tests_flex_clob
            if dbms_lob.getlength( c1.tests_flex_clob ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.tests_flex_clob );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.tests_flex_clob, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standard_tests '
                    ||'set tests_flex_clob = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;
        end loop;
    end export;
end eba_stds_export;
/