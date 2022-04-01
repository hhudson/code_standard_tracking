prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(3023541400682467719)
,p_build_option_name=>'DEV_ONLY'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(3023541741107477029)
,p_build_option_name=>'TO_DELETE'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(4587914972033536419)
,p_build_option_name=>'Link to Builder'
,p_build_option_status=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When enabled, this feature provides links into the APEX builder for any users who have an active APEX builder session.'
);
wwv_flow_api.component_end;
end;
/
