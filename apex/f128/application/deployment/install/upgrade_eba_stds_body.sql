prompt --application/deployment/install/upgrade_eba_stds_body
begin
--   Manifest
--     INSTALL: UPGRADE-eba_stds body
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
 p_id=>wwv_flow_api.id(2000421342337318140)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'eba_stds body'
,p_sequence=>90
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package body eba_stds as',
'',
'    -------------------------------------------------------------------------',
'    -- Generates a unique Identifier',
'    -------------------------------------------------------------------------',
'    function gen_id return number is',
'    begin',
'        return to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end gen_id;',
'',
'    -------------------------------------------------------------------------',
'    -- Handle the process of registering the scheduled job.',
'    -------------------------------------------------------------------------',
'    procedure register_job is',
'        c_workspace_id constant number := apex_application.get_security_group_id();',
'        l_app_id number;',
'        l_stmt varchar2(1000);',
'    begin',
'        l_app_id := nvl(wwv_flow_application_install.get_application_id,v(''FB_FLOW_ID''));',
'        l_stmt := q''[begin #PKG#.create_job( job_name => ''EBA_STDS_TEST_UPD_JOB'', ]''',
'            ||q''[job_type => ''PLSQL_BLOCK'', job_action => ''eba_stds_parser.update_standard_status;'', ]''',
'            ||q''[repeat_interval => ''FREQ=DAILY;interval=1'', enabled => TRUE); end;]'';',
'        for c1 in ( select object_name',
'                    from sys.all_objects',
'                    where object_name in (''DBMS_SCHEDULER'', ''CLOUD_SCHEDULER'')',
'                        and object_type = ''PACKAGE''',
'                    order by object_name desc ) loop',
'            execute immediate replace(l_stmt, ''#PKG#'',',
'                sys.dbms_assert.enquote_name(c1.object_name, false));',
'            return;',
'        end loop;',
'',
'    end register_job;',
'',
'end eba_stds;',
'/',
'show errors',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084880587311629265)
,p_script_id=>wwv_flow_api.id(2000421342337318140)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE BODY'
,p_object_name=>'EBA_STDS'
,p_last_updated_on=>to_date('20141219062049','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062049','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/