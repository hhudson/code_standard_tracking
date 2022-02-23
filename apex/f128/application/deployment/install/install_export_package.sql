prompt --application/deployment/install/install_export_package
begin
--   Manifest
--     INSTALL: INSTALL-Export Package
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
 p_id=>wwv_flow_api.id(567995677918625500)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Export Package'
,p_sequence=>350
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_stds_export as',
'',
'    procedure export( p_standard_id in number default null, p_test_id in number default null );',
'',
'end eba_stds_export;',
''))
);
wwv_flow_api.component_end;
end;
/
