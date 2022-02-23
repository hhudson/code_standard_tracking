prompt --application/shared_components/user_interface/lovs/open_status
begin
--   Manifest
--     OPEN_STATUS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(1852784962114118912)
,p_lov_name=>'OPEN_STATUS'
,p_lov_query=>'.'||wwv_flow_api.id(1852784962114118912)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1852785257754118919)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'O'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(1852785560218118922)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Implemented'
,p_lov_return_value=>'I'
);
wwv_flow_api.component_end;
end;
/
