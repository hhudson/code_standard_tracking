prompt --application/deployment/install/upgrade_populate_flex_page_map
begin
--   Manifest
--     INSTALL: UPGRADE-Populate flex page map
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
 p_id=>wwv_flow_api.id(1688835443474550810)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Populate flex page map'
,p_sequence=>200
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_app_id number;',
'begin',
'    eba_stds_flex_fw.populate_page_map_table();',
'    -- Make sure we''re starting with a clean slate.',
'    eba_stds_flex_fw.reset_flex_registry();',
'end;'))
);
wwv_flow_api.component_end;
end;
/
