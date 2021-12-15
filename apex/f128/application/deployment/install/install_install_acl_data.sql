prompt --application/deployment/install/install_install_acl_data
begin
--   Manifest
--     INSTALL: INSTALL-Install ACL Data
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(5057643855547351239)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Install ACL Data'
,p_sequence=>220
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Packaged App Tracker access levels */',
'insert into eba_stds_access_levels (id, access_level) values (1, ''Reader'');',
'insert into eba_stds_access_levels (id, access_level) values (2, ''Contributor'');',
'insert into eba_stds_access_levels (id, access_level) values (3, ''Administrator'');',
'',
'/* Packaged App Tracker preferences */',
'insert into eba_stds_preferences (id, preference_name, preference_value) values (1, ''ACCESS_CONTROL_ENABLED'', ''N'');',
'insert into eba_stds_preferences (id, preference_name, preference_value) values (2, ''ACCESS_CONTROL_SCOPE'', ''ACL_ONLY'');',
'insert into eba_stds_preferences (id, preference_name, preference_value) values (3, ''USERNAME_FORMAT'', ''EMAIL'');',
'',
'/* Constraint error lookups */',
'insert into eba_stds_error_lookup (constraint_name, message, language_code) values (''eba_stds_users_uk'', ''Username must be unique.'', ''en'');',
'',
'commit;',
'',
''))
);
wwv_flow_api.component_end;
end;
/
