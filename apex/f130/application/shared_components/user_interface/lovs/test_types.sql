prompt --application/shared_components/user_interface/lovs/test_types
begin
--   Manifest
--     TEST TYPES
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
 p_id=>wwv_flow_api.id(4492322041462996609)
,p_lov_name=>'TEST TYPES'
,p_lov_query=>'.'||wwv_flow_api.id(4492322041462996609)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4492322329423996624)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Pass/Fail (Y/N)'
,p_lov_return_value=>'PASS_FAIL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4492322620132996631)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Report'
,p_lov_return_value=>'FAIL_REPORT'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(4492322931773996632)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Percentage'
,p_lov_return_value=>'PERCENTAGE'
,p_lov_disp_cond_type=>'NEVER'
);
wwv_flow_api.component_end;
end;
/