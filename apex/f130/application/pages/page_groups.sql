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
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5729482687692573986)
,p_group_name=>'ACL'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(7608000885778102269)
,p_group_name=>'Administration'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5729482181458572210)
,p_group_name=>'Core Application - Creation'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5079335871420752416)
,p_group_name=>'Core Application - Data Editing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5079335767611751326)
,p_group_name=>'Core Application - Data Viewing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5729482384229572946)
,p_group_name=>'Help'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5729482485268573289)
,p_group_name=>'Home'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5729482586653573676)
,p_group_name=>'Login'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5729490787832659218)
,p_group_name=>'Mobile'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5729482282844572598)
,p_group_name=>'Reports'
);
wwv_flow_api.component_end;
end;
/
