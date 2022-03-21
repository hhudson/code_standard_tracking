prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2916431860810340515
,p_default_owner=>'ILA'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(2929297865994622484)
,p_build_option_name=>'DEV_ONLY'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(2929298206419631794)
,p_build_option_name=>'TO_DELETE'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(4493671437345691184)
,p_build_option_name=>'Link to Builder'
,p_build_option_status=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When enabled, this feature provides links into the APEX builder for any users who have an active APEX builder session.'
);
wwv_flow_api.component_end;
end;
/
