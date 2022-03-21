prompt --application/shared_components/user_interface/lovs/notification_type
begin
--   Manifest
--     NOTIFICATION TYPE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2916431860810340515
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(7299655063887331282)
,p_lov_name=>'NOTIFICATION TYPE'
,p_lov_query=>'.'||wwv_flow_api.id(7299655063887331282)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7299655352425331284)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yellow'
,p_lov_return_value=>'YELLOW'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(7299655582216331285)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Red'
,p_lov_return_value=>'RED'
);
wwv_flow_api.component_end;
end;
/
