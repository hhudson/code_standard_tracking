prompt --application/shared_components/user_interface/lovs/range_demo
begin
--   Manifest
--     RANGE_DEMO
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
 p_id=>wwv_flow_api.id(5135274768157242781)
,p_lov_name=>'RANGE_DEMO'
,p_lov_query=>'.'||wwv_flow_api.id(5135274768157242781)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135275087165242789)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Less than 100'
,p_lov_return_value=>'(,100)'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135275396895242793)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'100-199'
,p_lov_return_value=>'[100,199]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135275680095242793)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'200-299'
,p_lov_return_value=>'[200,299]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135275988401242793)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'300-399'
,p_lov_return_value=>'[300,399]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135276298500242793)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'400-499'
,p_lov_return_value=>'[400,499]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135276581280242793)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'500-649'
,p_lov_return_value=>'[500,649]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135276875927242794)
,p_lov_disp_sequence=>7
,p_lov_disp_value=>'650-799'
,p_lov_return_value=>'[650,799]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135277181223242794)
,p_lov_disp_sequence=>8
,p_lov_disp_value=>'800-999'
,p_lov_return_value=>'[800,999]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5135277482691242794)
,p_lov_disp_sequence=>9
,p_lov_disp_value=>'1,000+'
,p_lov_return_value=>'[1000,)'
);
wwv_flow_api.component_end;
end;
/
