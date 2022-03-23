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
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5691839951055031927)
,p_group_name=>'ACL'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(7570358149140560210)
,p_group_name=>'Administration'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5691839444821030151)
,p_group_name=>'Core Application - Creation'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5041693134783210357)
,p_group_name=>'Core Application - Data Editing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5041693030974209267)
,p_group_name=>'Core Application - Data Viewing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5691839647592030887)
,p_group_name=>'Help'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5691839748631031230)
,p_group_name=>'Home'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5691839850016031617)
,p_group_name=>'Login'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5691848051195117159)
,p_group_name=>'Mobile'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5691839546207030539)
,p_group_name=>'Reports'
);
wwv_flow_api.component_end;
end;
/
