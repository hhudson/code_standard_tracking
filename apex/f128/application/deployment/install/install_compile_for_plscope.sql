prompt --application/deployment/install/install_compile_for_plscope
begin
--   Manifest
--     INSTALL: INSTALL-compile for plscope
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
 p_id=>wwv_flow_api.id(17659165958269387)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'compile for plscope'
,p_sequence=>12
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin   ',
'    dbms_utility.compile_schema(schema => user, compile_all => true);',
'end;'))
);
wwv_flow_api.component_end;
end;
/
