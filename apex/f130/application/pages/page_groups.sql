prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5748326416229541738)
,p_group_name=>'ACL'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(7626844614315070021)
,p_group_name=>'Administration'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5748325909995539962)
,p_group_name=>'Core Application - Creation'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5098179599957720168)
,p_group_name=>'Core Application - Data Editing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5098179496148719078)
,p_group_name=>'Core Application - Data Viewing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5748326112766540698)
,p_group_name=>'Help'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5748326213805541041)
,p_group_name=>'Home'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5748326315190541428)
,p_group_name=>'Login'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5748334516369626970)
,p_group_name=>'Mobile'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5748326011381540350)
,p_group_name=>'Reports'
);
wwv_flow_api.component_end;
end;
/
