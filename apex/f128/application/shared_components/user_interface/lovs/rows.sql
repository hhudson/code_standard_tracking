prompt --application/shared_components/user_interface/lovs/rows
begin
--   Manifest
--     ROWS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4796620575330833291)
,p_lov_name=>'ROWS'
,p_lov_query=>'.'||wwv_flow_api.id(4796620575330833291)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4796620764916833292)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'10'
,p_lov_return_value=>'10'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4796645078793834261)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'15'
,p_lov_return_value=>'15'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4796620961139833292)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'20'
,p_lov_return_value=>'20'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4796621158931833292)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'30'
,p_lov_return_value=>'30'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4796621360058833292)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'50'
,p_lov_return_value=>'50'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4796621582912833293)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'500'
,p_lov_return_value=>'500'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4796621770607833293)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'1000'
,p_lov_return_value=>'1000'
);
wwv_flow_api.component_end;
end;
/
