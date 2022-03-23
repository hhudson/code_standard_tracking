prompt --application/shared_components/user_interface/lovs/username_format
begin
--   Manifest
--     USERNAME_FORMAT
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2953977059365452042
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5076305652061073961)
,p_lov_name=>'USERNAME_FORMAT'
,p_lov_query=>'.'||wwv_flow_api.id(5076305652061073961)||'.'
,p_location=>'STATIC'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5076305950159073966)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Email Address'
,p_lov_return_value=>'EMAIL'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(5076306241365073971)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Non-Email Address'
,p_lov_return_value=>'STRING'
);
wwv_flow_api.component_end;
end;
/
