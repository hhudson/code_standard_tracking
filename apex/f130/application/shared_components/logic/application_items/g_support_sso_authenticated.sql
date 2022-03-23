prompt --application/shared_components/logic/application_items/g_support_sso_authenticated
begin
--   Manifest
--     APPLICATION ITEM: G_SUPPORT_SSO_AUTHENTICATED
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(2980570352468147740)
,p_name=>'G_SUPPORT_SSO_AUTHENTICATED'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
);
wwv_flow_api.component_end;
end;
/
