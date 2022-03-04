prompt --application/deployment/install/install_sample_data_package_body
begin
--   Manifest
--     INSTALL: INSTALL-Sample Data Package body
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(1934386639107662061)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Sample Data Package body'
,p_sequence=>250
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE PACKAGE BODY "EBA_STDS_DATA" is',
'    procedure load_initial_data is',
'    begin',
'        if not is_initial_data_loaded() then',
'            insert into eba_stds_types (id, display_sequence, name)',
'                values (1, 10, ''Default'');',
'            insert into eba_stds_types (id, display_sequence, name)',
'                values (2, 20, ''Information Technology'');',
'            insert into eba_stds_types (id, display_sequence, name)',
'                values (3, 30, ''Engineering'');',
'            insert into eba_stds_app_statuses (id, display_sequence, name)',
'                values (1, 10,''Test Application'');',
'            insert into eba_stds_app_statuses (id, display_sequence, name)',
'                values (2, 20,''Initial development'');',
'            insert into eba_stds_app_statuses (id, display_sequence, name)',
'                values (3, 30,''Releasable'');',
'            insert into eba_stds_app_statuses (id, display_sequence, name)',
'                values (4, 40,''Production'');',
'        end if;',
'    end load_initial_data;',
'    function is_initial_data_loaded return boolean is',
'    begin',
'        for c1 in ( select null',
'                    from eba_stds_types',
'                    where id < 100',
'                    union',
'                    select null',
'                    from eba_stds_app_statuses',
'                    where id < 100 ) loop',
'            return true;',
'        end loop;',
'        return false;',
'    end is_initial_data_loaded;',
'    procedure load_sample_data is',
'    begin',
'        if not is_sample_data_loaded() then',
'            -- Create a sample standard to hold the tests.',
'            insert into eba_stds_standards ( id, name, description )',
'            values ( 1, ''Sample Standard'', ''A demonstration standard with some example tests.'');',
'            -- Associate the sample standard with all existing application types.',
'            insert into eba_stds_standard_type_ref ( id, standard_id, type_id )',
'            select rownum, 1 standard_id, t.id type_id',
'            from eba_stds_types t',
'            where not exists ( select null',
'                               from eba_stds_standard_type_ref r',
'                               where r.standard_id = 1',
'                                   and r.type_id = t.id );',
'            -- Create a few sample tests.',
'            insert into eba_stds_standard_tests ( id,',
'                standard_id,',
'                name,',
'                test_type,',
'                link_type,',
'                check_sql,',
'                app_bind_variable,',
'                failure_help_text )',
'            select 1 id,',
'                1 standard_id,',
'                ''Item Templates Exist'' name,',
'                ''FAIL_REPORT'' test_type,',
'                ''PAGE_ITEM'' link_type,',
'                ltrim(rtrim(q''[',
'select case',
'        when pi.item_label_template_id is null then ''N''',
'        when not exists ( select null',
'                          from apex_application_temp_label tl',
'                          where pi.item_label_template_id = tl.label_template_id',
'                              and pi.application_id = tl.application_id ) then ''N''',
'        else ''Y''',
'    end as pass_fail,',
'    pi.item_id,',
'    pi.page_id||''. ''||pi.page_name page,',
'    pi.region,',
'    pi.item_name,',
'    pi.label,',
'    pi.display_as item_type,',
'    pi.item_label_template',
'from apex_application_page_items pi',
'where pi.application_id = :APP_ID',
'    and pi.display_as_code not in',
'        ( ''NATIVE_DISPLAY_ONLY'',',
'           ''NATIVE_HIDDEN'',',
'           ''NATIVE_STOP_AND_START_HTML_TABLE'' )',
'                    ]'','' ''||chr(10)||chr(13)),'' ''||chr(10)||chr(13)) check_sql,',
'                '':APP_ID'' app_bind_variable,',
'                ltrim(rtrim(q''[',
'All displayed page items should have an item template that exists in the application.',
'                    ]'','' ''||chr(10)||chr(13)),'' ''||chr(10)||chr(13)) failure_help_text',
'            from dual;',
'            insert into eba_stds_standard_tests ( id,',
'                standard_id,',
'                name,',
'                test_type,',
'                link_type,',
'                check_sql,',
'                app_bind_variable,',
'                failure_help_text )',
'            select 2 id,',
'                1 standard_id,',
'                ''Help text, wrong template'' name,',
'                ''FAIL_REPORT'' test_type,',
'                ''PAGE_ITEM'' link_type,',
'                ltrim(rtrim(q''[',
'select case when upper(tl.theme_class) like ''%WITH HELP%'' then ''Y''',
'        else ''N''',
'    end as pass_fail,',
'    pi.item_id,',
'    pi.page_id||''. ''||pi.page_name page,',
'    pi.region,',
'    pi.item_name,',
'    pi.label,',
'    pi.display_as item_type,',
'    pi.item_label_template,',
'    tl.theme_class',
'from apex_application_page_items pi,',
'    apex_application_temp_label tl',
'where pi.application_id = :APP_ID',
'    and pi.display_as_code != ''NATIVE_HIDDEN''',
'    and pi.item_help_text is not null',
'    and pi.item_label_template_id = tl.label_template_id',
'    and pi.application_id = tl.application_id',
'                    ]'','' ''||chr(10)||chr(13)),'' ''||chr(10)||chr(13)) check_sql,',
'                '':APP_ID'' app_bind_variable,',
'                ltrim(rtrim(q''[',
'Items which have help text should have a "with Help" template.',
'                    ]'','' ''||chr(10)||chr(13)),'' ''||chr(10)||chr(13)) failure_help_text',
'            from dual;',
'            insert into eba_stds_standard_tests ( id,',
'                standard_id,',
'                name,',
'                test_type,',
'                link_type,',
'                check_sql,',
'                app_bind_variable,',
'                failure_help_text )',
'            select 3 id,',
'                1 standard_id,',
'                ''No Help Text'' name,',
'                ''FAIL_REPORT'' test_type,',
'                ''PAGE_ITEM'' link_type,',
'                ltrim(rtrim(q''[',
'select case when upper(tl.theme_class) like ''%WITH HELP%'' then ''N''',
'        else ''Y''',
'    end as pass_fail,',
'    pi.item_id,',
'    pi.page_id||''. ''||pi.page_name page,',
'    pi.region,',
'    pi.item_name,',
'    pi.label,',
'    pi.display_as item_type,',
'    pi.item_label_template,',
'    tl.theme_class',
'from apex_application_page_items pi,',
'    apex_application_temp_label tl',
'where pi.application_id = :APP_ID',
'    and pi.display_as_code != ''NATIVE_HIDDEN''',
'    and pi.item_help_text is null',
'    and pi.item_label_template_id = tl.label_template_id',
'    and pi.application_id = tl.application_id',
'                    ]'','' ''||chr(10)||chr(13)),'' ''||chr(10)||chr(13)) check_sql,',
'                '':APP_ID'' app_bind_variable,',
'                ltrim(rtrim(q''[',
'Any item with a "with Help" template needs to have help text.',
'                    ]'','' ''||chr(10)||chr(13)),'' ''||chr(10)||chr(13)) failure_help_text',
'            from dual;',
'        end if;',
'    end load_sample_data;',
'    procedure remove_sample_data is',
'    begin',
'        delete from eba_stds_standards',
'        where id < 100;',
'    end remove_sample_data;',
'    function is_sample_data_loaded return boolean is',
'    begin',
'        for c1 in ( select null',
'                    from eba_stds_standards',
'                    where id < 100',
'                    union',
'                    select null',
'                    from eba_stds_standard_tests',
'                    where id < 100',
'                    union',
'                    select null',
'                    from eba_stds_standard_type_ref',
'                    where id < 100 ) loop',
'            return true;',
'        end loop;',
'        return false;',
'    end is_sample_data_loaded;',
'end eba_stds_data;',
'/',
'',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084881546213629327)
,p_script_id=>wwv_flow_api.id(1934386639107662061)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE BODY'
,p_object_name=>'EBA_STDS_DATA'
,p_last_updated_on=>to_date('20141219062050','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062050','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
