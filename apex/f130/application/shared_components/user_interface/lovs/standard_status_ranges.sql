prompt --application/shared_components/user_interface/lovs/standard_status_ranges
begin
--   Manifest
--     STANDARD_STATUS_RANGES
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
 p_id=>wwv_flow_api.id(4345705256031014114)
,p_lov_name=>'STANDARD_STATUS_RANGES'
,p_lov_query=>'.'||wwv_flow_api.id(4345705256031014114)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4345705539182014116)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'0%'
,p_lov_return_value=>'(,0]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4345705854806014120)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'1-25%'
,p_lov_return_value=>'(0,25]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4345706157535014120)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'26-50%'
,p_lov_return_value=>'(25,50]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4345706449376014120)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'51-75%'
,p_lov_return_value=>'(51,75]'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4345706746962014120)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'76-99%'
,p_lov_return_value=>'(75,100)'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4345707061348014120)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>'100%'
,p_lov_return_value=>'[100,)'
);
wwv_flow_api.component_end;
end;
/