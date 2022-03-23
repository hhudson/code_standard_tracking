prompt --application/shared_components/user_interface/lovs/open_status
begin
--   Manifest
--     OPEN_STATUS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(4365410632151195074)
,p_lov_name=>'OPEN_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(4365410632151195074)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4365410927791195081)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4365411230255195084)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Implemented'
,p_lov_return_value=>'I'
);
wwv_flow_api.component_end;
end;
/
