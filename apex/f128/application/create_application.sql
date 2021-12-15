prompt --application/create_application
begin
--   Manifest
--     FLOW: 128
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'ILA')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Application Standards Tracker')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'128')
,p_application_group=>wwv_flow_api.id(407818356095314706)
,p_application_group_name=>'19.2 Productivity Apps'
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'836D6BF7643D3434F10DF2E8E5491F9D8713FEDC040533DF11764FB6AE6F7B0F'
,p_checksum_salt_last_reset=>'20150102073829'
,p_bookmark_checksum_function=>'SH1'
,p_accept_old_checksums=>false
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'5.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'0'
,p_date_format=>'DD-MON-YYYY'
,p_date_time_format=>'DD-MON-YYYY HH24:MI'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'1.0.0 -> 1.0.1: Implemented redesigned administrative ACL controls'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(6261948619087129960)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'&APPLICATION_TITLE.'
,p_favicons=>'<link rel="shortcut icon" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-application-standards-tracker.ico"><link rel="icon" sizes="16x16" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-application-standards-tracker-16x16.png"><link rel="icon" sizes="32x'
||'32" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-application-standards-tracker-32x32.png"><link rel="apple-touch-icon" sizes="180x180" href="#IMAGE_PREFIX#apex_ui/img/favicons/app-application-standards-tracker.png">'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'2.1.9'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_referrer_policy=>'strict-origin-when-cross-origin'
,p_runtime_api_usage=>'T'
,p_security_scheme=>wwv_flow_api.id(5057645267339553539)
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'eba_stds_fw.apex_error_handling'
,p_friendly_url=>'N'
,p_substitution_string_01=>'GETTING_STARTED_URL'
,p_substitution_value_01=>'http://www.oracle.com/technetwork/developer-tools/apex/index.html'
,p_substitution_string_02=>'APP_NAME'
,p_substitution_value_02=>'Application Standards Tracker'
,p_substitution_string_03=>'APP_DATE_FORMAT'
,p_substitution_value_03=>'DD-MON-YYYY'
,p_substitution_string_04=>'APP_DATE_TIME_FORMAT'
,p_substitution_value_04=>'DD-MON-YYYY HH24:MI'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20211215182745'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
,p_print_server_type=>'INSTANCE'
);
wwv_flow_api.component_end;
end;
/
