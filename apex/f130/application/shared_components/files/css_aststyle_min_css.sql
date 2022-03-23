prompt --application/shared_components/files/css_aststyle_min_css
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
wwv_flow_api.g_varchar2_table(1) := '2E742D427574746F6E2D2D64697361626C65647B637572736F723A6E6F742D616C6C6F7765643B706F696E7465722D6576656E74733A6E6F6E653B636F6C6F723A73696C7665723B6261636B67726F756E642D636F6C6F723A236666667D2E686964657B';
wwv_flow_api.g_varchar2_table(2) := '7669736962696C6974793A68696464656E7D2E73686F777B7669736962696C6974793A73686F777D0A2F2A2320736F757263654D617070696E6755524C3D6173745374796C652E6373732E6D61702A2F';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(2984063526587368964)
,p_file_name=>'css/astStyle.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
