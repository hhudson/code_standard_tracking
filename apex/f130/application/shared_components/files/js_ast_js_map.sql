prompt --application/shared_components/files/js_ast_js_map
begin
--   Manifest
--     APP STATIC FILES: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B226173742E6A73225D2C226E616D6573223A5B22636865636B616C6C663031222C2224222C226973222C2270726F70225D2C226D617070696E6773223A22414141412C53414153412C634143';
wwv_flow_api.g_varchar2_table(2) := '48432C454141452C61414161432C474141472C5941437042442C454141452C6D4241416D42452C4B41414B2C574141572C4741457243462C454141452C6D4241416D42452C4B41414B2C57414157222C2266696C65223A226173742E6A73227D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(2985675351239948806)
,p_file_name=>'js/ast.js.map'
,p_mime_type=>'application/json'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
