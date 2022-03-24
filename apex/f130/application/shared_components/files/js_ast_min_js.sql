prompt --application/shared_components/files/js_ast_min_js
begin
--   Manifest
--     APP STATIC FILES: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20636865636B616C6C66303128297B24282223636865636B616C6C22292E697328223A636865636B656422293F242822696E7075745B6E616D653D6630315D22292E70726F702822636865636B6564222C2130293A242822696E7075';
wwv_flow_api.g_varchar2_table(2) := '745B6E616D653D6630315D22292E70726F702822636865636B6564222C2131297D0A2F2F2320736F757263654D617070696E6755524C3D6173742E6A732E6D6170';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(3004518765661916555)
,p_file_name=>'js/ast.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
