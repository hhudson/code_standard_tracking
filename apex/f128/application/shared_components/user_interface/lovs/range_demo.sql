prompt --application/shared_components/user_interface/lovs/range_demo
begin
--   Manifest
--     RANGE_DEMO
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
 p_id=>wwv_flow_api.id(2547137438003021306)
,p_lov_name=>'RANGE_DEMO'
,p_lov_query=>'.'||wwv_flow_api.id(2547137438003021306)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547137757011021314)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Less than 100'
,p_lov_return_value=>'(,100)'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547138066741021318)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'100-199'
,p_lov_return_value=>'[100,199]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547138349941021318)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'200-299'
,p_lov_return_value=>'[200,299]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547138658247021318)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'300-399'
,p_lov_return_value=>'[300,399]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547138968346021318)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'400-499'
,p_lov_return_value=>'[400,499]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547139251126021318)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'500-649'
,p_lov_return_value=>'[500,649]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547139545773021319)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'650-799'
,p_lov_return_value=>'[650,799]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547139851069021319)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'800-999'
,p_lov_return_value=>'[800,999]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(2547140152537021319)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'1,000+'
,p_lov_return_value=>'[1000,)'
);
wwv_flow_api.component_end;
end;
/
