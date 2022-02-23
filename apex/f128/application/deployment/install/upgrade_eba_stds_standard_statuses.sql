prompt --application/deployment/install/upgrade_eba_stds_standard_statuses
begin
--   Manifest
--     INSTALL: UPGRADE-eba_stds_standard_statuses
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
 p_id=>wwv_flow_api.id(1997467237774149671)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'eba_stds_standard_statuses'
,p_sequence=>30
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from all_tab_cols',
'where table_name = ''EBA_STDS_STANDARD_STATUSES''',
'    and column_name = ''PASS_FAIL_PCT'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_stds_standard_statuses',
'    add ( pass_fail_pct number );',
'',
'update eba_stds_standard_statuses',
'set pass_fail_pct = decode( pass_fail_yn, ''Y'', 100, ''N'', 0 )',
'where pass_fail_yn is not null;',
'',
'alter table eba_stds_standard_statuses',
'    drop column pass_fail_yn;',
''))
);
wwv_flow_api.component_end;
end;
/
