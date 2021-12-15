prompt --application/deployment/install/upgrade_table_modifications_for_test_types
begin
--   Manifest
--     INSTALL: UPGRADE-Table modifications for Test Types
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(1997448736342120852)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Table modifications for Test Types'
,p_sequence=>20
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from all_tab_cols',
'where table_name = ''EBA_STDS_STANDARD_TESTS''',
'    and column_name = ''TEST_TYPE'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_stds_standard_tests',
'    add ( test_type         varchar2(16) default ''PASS_FAIL'' not null,',
'              constraint eba_stds_standard_tests_ck1',
'                  check ( test_type in (''PASS_FAIL'', ''FAIL_REPORT'', ''PERCENTAGE'') ),',
'          link_type varchar2(64) );'))
);
wwv_flow_api.component_end;
end;
/
