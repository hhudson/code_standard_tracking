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
,p_default_id_offset=>2916431860810340515
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5673108076484332005)
,p_group_name=>'ACL'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(7551626274569860288)
,p_group_name=>'Administration'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5673107570250330229)
,p_group_name=>'Core Application - Creation'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5022961260212510435)
,p_group_name=>'Core Application - Data Editing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5022961156403509345)
,p_group_name=>'Core Application - Data Viewing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5673107773021330965)
,p_group_name=>'Help'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5673107874060331308)
,p_group_name=>'Home'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5673107975445331695)
,p_group_name=>'Login'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5673116176624417237)
,p_group_name=>'Mobile'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5673107671636330617)
,p_group_name=>'Reports'
);
wwv_flow_api.component_end;
end;
/
