prompt --application/shared_components/user_interface/lovs/range_demo
begin
--   Manifest
--     RANGE_DEMO
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
 p_id=>wwv_flow_api.id(5116249573214607279)
,p_lov_name=>'RANGE_DEMO'
,p_lov_query=>'.'||wwv_flow_api.id(5116249573214607279)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116249892222607287)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Less than 100'
,p_lov_return_value=>'(,100)'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116250201952607291)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'100-199'
,p_lov_return_value=>'[100,199]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116250485152607291)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'200-299'
,p_lov_return_value=>'[200,299]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116250793458607291)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'300-399'
,p_lov_return_value=>'[300,399]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116251103557607291)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'400-499'
,p_lov_return_value=>'[400,499]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116251386337607291)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'500-649'
,p_lov_return_value=>'[500,649]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116251680984607292)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'650-799'
,p_lov_return_value=>'[650,799]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116251986280607292)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'800-999'
,p_lov_return_value=>'[800,999]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5116252287748607292)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'1,000+'
,p_lov_return_value=>'[1000,)'
);
wwv_flow_api.component_end;
end;
/
