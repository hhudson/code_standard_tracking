prompt --application/deployment/install/upgrade_reload_sample_data
begin
--   Manifest
--     INSTALL: UPGRADE-Reload Sample Data
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
 p_id=>wwv_flow_api.id(1999334125064535342)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Reload Sample Data'
,p_sequence=>70
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXPRESSION'
,p_condition=>'eba_stds_data.is_initial_data_loaded()'
,p_condition2=>'PLSQL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_stds_data.remove_sample_data();',
'    eba_stds_data.load_sample_data();',
'end;'))
);
wwv_flow_api.component_end;
end;
/
