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
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(2994936006681452753)
,p_lov_name=>'SHOW ONLY'
,p_lov_query=>'.'||wwv_flow_api.id(2994936006681452753)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2994936356974452756)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Only Failures'
,p_lov_return_value=>'F'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2994936729811452757)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Only Passes'
,p_lov_return_value=>'P'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2994937131409452758)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'False Negatives'
,p_lov_return_value=>'N'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2994937502884452758)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Legacy'
,p_lov_return_value=>'L'
);
wwv_flow_api.component_end;
end;
/
