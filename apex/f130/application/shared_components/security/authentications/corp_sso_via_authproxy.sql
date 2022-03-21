prompt --application/shared_components/security/authentications/corp_sso_via_authproxy
begin
--   Manifest
--     AUTHENTICATION: Corp SSO via AuthProxy
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
 p_id=>wwv_flow_api.id(2942927313470603425)
,p_name=>'Corp SSO via AuthProxy'
,p_scheme_type=>'NATIVE_HTTP_HEADER_VARIABLE'
,p_attribute_01=>'X-Oracle-Auth-UID'
,p_attribute_02=>'BUILTIN_URL'
,p_attribute_06=>'ALWAYS'
,p_attribute_07=>'/.auth/logout'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- set the global application item to indicate ',
'-- user is validated via support url using SSO ',
'PROCEDURE SUPPORT_AUTHENTICATED IS',
'begin',
'   :G_SUPPORT_SSO_AUTHENTICATED:=''Y'';',
'end;'))
,p_post_auth_process=>'SUPPORT_AUTHENTICATED'
,p_cookie_name=>'ORA-COVID-ADMIN'
,p_use_secure_cookie_yn=>'Y'
,p_ras_mode=>0
,p_reference_id=>3982054197511291
,p_comments=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://covid19-support.oracle.com/',
'',
'SSO headers set by AuthProxy:',
'- X-Oracle-Auth-Email',
'- X-Oracle-Auth-UID',
'- X-Oracle-Auth-FirstName',
'- X-Oracle-Auth-LastName'))
);
wwv_flow_api.component_end;
end;
/
