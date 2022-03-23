prompt --application/shared_components/security/authentications/covid_idp_dms_user
begin
--   Manifest
--     AUTHENTICATION: COVID IdP - DMS User
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(2935172164675071038)
,p_name=>'COVID IdP - DMS User'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_01=>'sch_authentication.bo_user_sentry'
,p_attribute_05=>'N'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'/account/signin/'
,p_logout_url=>'/account/signout/'
,p_cookie_name=>'ORA-COVID-CARS'
,p_use_secure_cookie_yn=>'Y'
,p_ras_mode=>0
,p_reference_id=>128536138486784250
);
wwv_flow_api.component_end;
end;
/
