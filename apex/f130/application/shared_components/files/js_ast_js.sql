prompt --application/shared_components/files/js_ast_js
begin
--   Manifest
--     APP STATIC FILES: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20636865636B616C6C6630312829207B0A20206966202824282223636865636B616C6C22292E697328273A636865636B6564272929207B200A20202020242822696E7075745B6E616D653D6630315D22292E70726F70282263686563';
wwv_flow_api.g_varchar2_table(2) := '6B6564222C2074727565293B0A20207D20656C7365207B200A20202020242822696E7075745B6E616D653D6630315D22292E70726F702822636865636B6564222C2066616C7365293B0A20207D0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(3023543375676551404)
,p_file_name=>'js/ast.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
