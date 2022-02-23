prompt --application/deployment/install/upgrade_set_first_run_preference
begin
--   Manifest
--     INSTALL: UPGRADE-Set First Run Preference
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
 p_id=>wwv_flow_api.id(1584890034617335500)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Set First Run Preference'
,p_sequence=>250
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_preferences',
' where preference_name = ''FIRST_RUN'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_stds_fw.set_preference_value( p_preference_name => ''FIRST_RUN'', p_preference_value => ''NO'' );',
'end;'))
);
wwv_flow_api.component_end;
end;
/
