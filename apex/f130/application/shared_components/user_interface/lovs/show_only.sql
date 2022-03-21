prompt --application/shared_components/user_interface/lovs/show_only
begin
--   Manifest
--     SHOW ONLY
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
 p_id=>wwv_flow_api.id(2919717666936243020)
,p_lov_name=>'SHOW ONLY'
,p_lov_query=>'.'||wwv_flow_api.id(2919717666936243020)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2919718017229243023)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Only Failures'
,p_lov_return_value=>'F'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2919718390066243024)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Only Passes'
,p_lov_return_value=>'P'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2919718791664243025)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'False Negatives'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2919719163139243025)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Legacy'
,p_lov_return_value=>'L'
);
wwv_flow_api.component_end;
end;
/
