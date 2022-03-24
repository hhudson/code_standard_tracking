prompt --application/shared_components/user_interface/lovs/access_control_scope1
begin
--   Manifest
--     ACCESS CONTROL SCOPE1
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
 p_id=>wwv_flow_api.id(3100589006166303736)
,p_lov_name=>'ACCESS CONTROL SCOPE1'
,p_lov_query=>'.'||wwv_flow_api.id(3100589006166303736)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3100589443031303739)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Readers'
,p_lov_return_value=>'PUBLIC_READONLY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(3100589838542303741)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Contributors'
,p_lov_return_value=>'PUBLIC_CONTRIBUTE'
);
wwv_flow_api.component_end;
end;
/
