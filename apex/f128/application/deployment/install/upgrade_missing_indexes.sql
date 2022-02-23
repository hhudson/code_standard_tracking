prompt --application/deployment/install/upgrade_missing_indexes
begin
--   Manifest
--     INSTALL: UPGRADE-Missing Indexes
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
 p_id=>wwv_flow_api.id(2057363623770244579)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Missing Indexes'
,p_sequence=>120
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_indexes',
'where index_name = ''EBA_STDS_STANDARD_APP_REF_N1'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create index eba_stds_standard_app_ref_n1 on eba_stds_standard_app_ref( application_id );',
'',
'create index eba_stds_standard_statuses_n1 on eba_stds_standard_statuses( application_id );',
'create index eba_stds_standard_statuses_n2 on eba_stds_standard_statuses( standard_id );',
'create index eba_stds_standard_statuses_n3 on eba_stds_standard_statuses( test_id );',
'',
'create index eba_stds_standard_type_ref_n1 on eba_stds_standard_type_ref( type_id );',
''))
);
wwv_flow_api.component_end;
end;
/
