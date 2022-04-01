prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5767351611172177240)
,p_group_name=>'ACL'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(7645869809257705523)
,p_group_name=>'Administration'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5767351104938175464)
,p_group_name=>'Core Application - Creation'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5117204794900355670)
,p_group_name=>'Core Application - Data Editing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5117204691091354580)
,p_group_name=>'Core Application - Data Viewing'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5767351307709176200)
,p_group_name=>'Help'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5767351408748176543)
,p_group_name=>'Home'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5767351510133176930)
,p_group_name=>'Login'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5767359711312262472)
,p_group_name=>'Mobile'
);
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(5767351206324175852)
,p_group_name=>'Reports'
);
wwv_flow_api.component_end;
end;
/
