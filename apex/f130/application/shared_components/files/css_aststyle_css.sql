prompt --application/shared_components/files/css_aststyle_css
begin
--   Manifest
--     APP STATIC FILES: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2916431860810340515
,p_default_owner=>'ILA'
);
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E742D427574746F6E2D2D64697361626C65640A20202020202020207B0A2020202020202020637572736F723A206E6F742D616C6C6F7765643B0A2020202020202020706F696E7465722D6576656E74733A206E6F6E653B0A0A20202020202020202F2A';
wwv_flow_api.g_varchar2_table(2) := '427574746F6E2064697361626C6564202D2043535320636F6C6F7220636C6173732A2F0A2020202020202020636F6C6F723A20236330633063303B0A20202020202020206261636B67726F756E642D636F6C6F723A20236666666666663B0A0A20202020';
wwv_flow_api.g_varchar2_table(3) := '202020207D0A0A2E686964650A20202020202020207B0A202020202020202020202020202020207669736962696C6974793A2068696464656E3B0A20202020202020207D0A0A2E73686F770A20202020202020207B0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(4) := '20207669736962696C6974793A2073686F773B0A20202020202020207D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(2927688321890124808)
,p_file_name=>'css/astStyle.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
wwv_flow_api.component_end;
end;
/
