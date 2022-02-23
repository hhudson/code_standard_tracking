prompt --application/deployment/install/upgrade_drop_released_in_version
begin
--   Manifest
--     INSTALL: UPGRADE-Drop Released_In_Version
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
 p_id=>wwv_flow_api.id(2001794216259440347)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Drop Released_In_Version'
,p_sequence=>100
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_STDS_APPLICATIONS''',
'    and column_name = ''RELEASED_IN_VERSION'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_stds_applications',
'    drop column released_in_version;',
''))
);
wwv_flow_api.component_end;
end;
/
