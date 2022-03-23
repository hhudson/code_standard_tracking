prompt --application/shared_components/security/authorizations/permalink_page_auth
begin
--   Manifest
--     SECURITY SCHEME: PERMALINK_PAGE_AUTH
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2953977059365452042
,p_default_owner=>'ILA'
);
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(5073915653908123510)
,p_name=>'PERMALINK_PAGE_AUTH'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if eba_stds_security.is_authorized_viewer(:APP_USER) = ''Y'' then',
'        return true;',
'    else',
'        return false;',
'    end if;',
'exception',
'    when no_data_found then',
'        -- Not a controlled report page.',
'        return true;',
'end;'))
,p_error_message=>'You do not have permission to view this page.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
wwv_flow_api.component_end;
end;
/
