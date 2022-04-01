prompt --application/shared_components/security/authorizations/application_sentry
begin
--   Manifest
--     SECURITY SCHEME: APPLICATION SENTRY
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(7645782597493775014)
,p_name=>'APPLICATION SENTRY'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :APP_PAGE_ID = 101 then',
'        return true;',
'    else',
'        return (eba_stds_security.get_authorization_level(:APP_USER) > 0);',
'    end if;',
'end;'))
,p_error_message=>'You are not authorized to view this application, either because you have not been granted access, or your account has been locked. Please contact the application administrator.'
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_api.component_end;
end;
/
