prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 128
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(4578904365199564796)
,p_welcome_message=>'This application installer will guide you through the process of creating your database objects and seed data.'
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_get_version_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select table_name',
'from user_tables',
'where table_name like ''EBA\_STDS\_%'' escape ''\'''))
,p_deinstall_success_message=>'Deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    wwv_flow_api.create_or_remove_file( ',
'        p_location => ''APPLICATION'',',
'        p_name     => ''fs-sprite.png'',',
'        p_mode     => ''REMOVE'',',
'        p_type     => ''IMAGE'');',
'end;',
'/',
'',
'declare',
'    l_stmt varchar2(1000);',
'begin',
'    for c1 in ( select sj.job_name, ao.object_name',
'                from user_scheduler_jobs sj, sys.all_objects ao',
'                where sj.job_name = ''EBA_STDS_TEST_UPD_JOB''',
'                    and ao.object_name in (''DBMS_SCHEDULER'', ''CLOUD_SCHEDULER'')',
'                    and ao.object_type = ''PACKAGE''',
'                order by object_name desc ) loop',
'        l_stmt := ''[begin ''||sys.dbms_assert.enquote_name(c1.object_name, false)',
'            ||''.drop_job( name => ''''''||c1.job_name||''''''); end;]'';',
'        execute immediate l_stmt;',
'        return;',
'    end loop;',
'end;',
'/',
'',
'drop type eba_stds_filter_col_tbl;',
'drop type eba_stds_filter_column_t;',
'',
'drop table eba_stds_flex_page_map      cascade constraints;',
'drop table eba_stds_flex_registry      cascade constraints;',
'drop table eba_stds_flex_static_lovs   cascade constraints;',
'drop table eba_stds_standard_statuses  cascade constraints;',
'drop table eba_stds_standard_type_ref  cascade constraints;',
'drop table eba_stds_standard_app_ref   cascade constraints;',
'drop table eba_stds_standard_tests     cascade constraints;',
'drop table eba_stds_standards          cascade constraints;',
'drop table eba_stds_app_statuses       cascade constraints;',
'drop table eba_stds_applications       cascade constraints;',
'drop table eba_stds_types              cascade constraints;',
'drop table eba_stds_notes              cascade constraints;',
'drop table eba_stds_access_levels      cascade constraints;',
'drop table eba_stds_history            cascade constraints;',
'drop table eba_stds_tags               cascade constraints;',
'drop table eba_stds_tags_type_sum      cascade constraints;',
'drop table eba_stds_tags_sum           cascade constraints;',
'drop table eba_stds_notifications      cascade constraints;',
'drop table eba_stds_preferences        cascade constraints;',
'drop table eba_stds_error_lookup       cascade constraints;',
'drop table eba_stds_users              cascade constraints;',
'drop table eba_stds_tz_pref            cascade constraints;',
'drop table eba_stds_errors             cascade constraints;',
'drop table eba_stds_test_validations   cascade constraints;',
'',
'drop sequence eba_stds_seq;',
'',
'drop package  eba_stds_export;',
'drop package  eba_stds_flex_fw;',
'drop package  eba_stds_filter2_fw;',
'drop package  eba_stds_parser;',
'drop package  eba_stds;',
'drop package  eba_stds_fw;',
'drop package  eba_stds_security;',
'drop package  eba_stds_data;',
''))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE TYPE :CREATE VIEW'
,p_required_names_available=>'EBA_STDS:EBA_STDS_FW:EBA_STDS_TAGS:EBA_STDS_ACCESS_LEVELS:EBA_STDS_HISTORY:EBA_STDS_TAGS_TYPE_SUM:EBA_STDS_TAGS_SUM:EBA_STDS_NOTIFICATIONS:EBA_STDS_PREFERENCES:EBA_STDS_ERROR_LOOKUP:EBA_STDS_USERS:EBA_STDS_TZ_PREF:EBA_STDS_ERRORS:EBA_STDS_SAMPLE_DATA'
||':EBA_STDS_SECURITY:EBA_STDS_APPLICATIONS:EBA_STDS_STANDARDS:EBA_STDS_STANDARD_APP_REF:EBA_STDS_STANDARD_TYPE_REF:EBA_STDS_TYPES:EBA_STDS_APP_STATUSES:EBA_STDS_STANDARD_STATUSES:EBA_STDS_SEQ:EBA_STDS_DATA:EBA_STDS_FILTER2_FW:EBA_STDS_TEST_VALIDATIONS'
,p_deinstall_message=>'This operation will completely remove this application from your workspace.'
);
wwv_flow_api.component_end;
end;
/
