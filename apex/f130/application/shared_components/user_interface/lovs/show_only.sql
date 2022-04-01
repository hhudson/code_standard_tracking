prompt --application/shared_components/user_interface/lovs/show_only
begin
--   Manifest
--     SHOW ONLY
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(3013961201624088255)
,p_lov_name=>'SHOW ONLY'
,p_lov_query=>'.'||wwv_flow_api.id(3013961201624088255)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3013961551917088258)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Only Failures'
,p_lov_return_value=>'F'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3013961924754088259)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Only Passes'
,p_lov_return_value=>'P'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3013962326352088260)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'False Negatives'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3013962697827088260)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Legacy'
,p_lov_return_value=>'L'
);
wwv_flow_api.component_end;
end;
/
