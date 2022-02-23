prompt --application/deployment/install/upgrade_add_flex_columns
begin
--   Manifest
--     INSTALL: UPGRADE-Add Flex Columns
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
 p_id=>wwv_flow_api.id(1685699915784438183)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Add Flex Columns'
,p_sequence=>130
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_STDS_APPLICATIONS''',
'    and column_name = ''APPLICATIONS_FLEX_01'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_stds_applications',
'add ( applications_flex_01 varchar2(4000),',
'    applications_flex_02 varchar2(4000),',
'    applications_flex_03 varchar2(4000),',
'    applications_flex_04 varchar2(4000),',
'    applications_flex_05 varchar2(4000),',
'    applications_flex_06 varchar2(4000),',
'    applications_flex_07 varchar2(4000),',
'    applications_flex_08 varchar2(4000),',
'    applications_flex_n01 number,',
'    applications_flex_n02 number,',
'    applications_flex_n03 number,',
'    applications_flex_n04 number,',
'    applications_flex_d01 timestamp with local time zone,',
'    applications_flex_d02 timestamp with local time zone,',
'    applications_flex_d03 timestamp with local time zone,',
'    applications_flex_d04 timestamp with local time zone,',
'    applications_flex_clob clob',
');',
'',
'alter table eba_stds_standards',
'add ( standards_flex_01 varchar2(4000),',
'    standards_flex_02 varchar2(4000),',
'    standards_flex_03 varchar2(4000),',
'    standards_flex_04 varchar2(4000),',
'    standards_flex_05 varchar2(4000),',
'    standards_flex_06 varchar2(4000),',
'    standards_flex_07 varchar2(4000),',
'    standards_flex_08 varchar2(4000),',
'    standards_flex_n01 number,',
'    standards_flex_n02 number,',
'    standards_flex_n03 number,',
'    standards_flex_n04 number,',
'    standards_flex_d01 timestamp with local time zone,',
'    standards_flex_d02 timestamp with local time zone,',
'    standards_flex_d03 timestamp with local time zone,',
'    standards_flex_d04 timestamp with local time zone,',
'    standards_flex_clob clob',
');',
'',
'alter table eba_stds_standard_tests',
'add ( tests_flex_01 varchar2(4000),',
'    tests_flex_02 varchar2(4000),',
'    tests_flex_03 varchar2(4000),',
'    tests_flex_04 varchar2(4000),',
'    tests_flex_05 varchar2(4000),',
'    tests_flex_06 varchar2(4000),',
'    tests_flex_07 varchar2(4000),',
'    tests_flex_08 varchar2(4000),',
'    tests_flex_n01 number,',
'    tests_flex_n02 number,',
'    tests_flex_n03 number,',
'    tests_flex_n04 number,',
'    tests_flex_d01 timestamp with local time zone,',
'    tests_flex_d02 timestamp with local time zone,',
'    tests_flex_d03 timestamp with local time zone,',
'    tests_flex_d04 timestamp with local time zone,',
'    tests_flex_clob clob',
');'))
);
wwv_flow_api.component_end;
end;
/
