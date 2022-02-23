prompt --application/deployment/install/upgrade_eba_stds_parser_spec
begin
--   Manifest
--     INSTALL: UPGRADE-eba_stds_parser spec
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
 p_id=>wwv_flow_api.id(1998562344728472652)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'eba_stds_parser spec'
,p_sequence=>40
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_stds_parser as',
'',
'    g_collection varchar2(255) := ''EBA_STDS_PARSER'';',
'',
'    function is_valid_query( p_query in clob ) return varchar2;',
'',
'    procedure update_standard_status;',
'',
'    function build_link( p_test_id in number, p_application_id in number, p_param in varchar2 )',
'        return varchar2;',
'',
'end eba_stds_parser;',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084884362053629525)
,p_script_id=>wwv_flow_api.id(1998562344728472652)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_STDS_PARSER'
,p_last_updated_on=>to_date('20141219062052','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062052','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
