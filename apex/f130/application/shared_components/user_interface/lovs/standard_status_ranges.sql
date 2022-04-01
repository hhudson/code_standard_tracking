prompt --application/shared_components/user_interface/lovs/standard_status_ranges
begin
--   Manifest
--     STANDARD_STATUS_RANGES
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
 p_id=>wwv_flow_api.id(4439948790718859349)
,p_lov_name=>'STANDARD_STATUS_RANGES'
,p_lov_query=>'.'||wwv_flow_api.id(4439948790718859349)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4439949073869859351)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'0%'
,p_lov_return_value=>'(,0]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4439949389493859355)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'1-25%'
,p_lov_return_value=>'(0,25]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4439949692222859355)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'26-50%'
,p_lov_return_value=>'(25,50]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4439949984063859355)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'51-75%'
,p_lov_return_value=>'(51,75]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4439950281649859355)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'76-99%'
,p_lov_return_value=>'(75,100)'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4439950596035859355)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'100%'
,p_lov_return_value=>'[100,)'
);
wwv_flow_api.component_end;
end;
/
