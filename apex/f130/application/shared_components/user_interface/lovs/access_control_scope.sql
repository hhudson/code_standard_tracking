prompt --application/shared_components/user_interface/lovs/access_control_scope
begin
--   Manifest
--     ACCESS CONTROL SCOPE
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
 p_id=>wwv_flow_api.id(7551586760688335439)
,p_lov_name=>'ACCESS CONTROL SCOPE'
,p_lov_query=>'.'||wwv_flow_api.id(7551586760688335439)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5043852341726486972)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Reader access for any authenticated user'
,p_lov_return_value=>'PUBLIC_READONLY'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5043852651694486972)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Contributor access for any authenticated user'
,p_lov_return_value=>'PUBLIC_CONTRIBUTE'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5043852945857486972)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Restricted to users defined in access control list'
,p_lov_return_value=>'ACL_ONLY'
);
wwv_flow_api.component_end;
end;
/
