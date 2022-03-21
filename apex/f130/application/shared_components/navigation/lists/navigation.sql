prompt --application/shared_components/navigation/lists/navigation
begin
--   Manifest
--     LIST: Navigation
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2916431860810340515
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(3875077770913713084)
,p_name=>'Navigation'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3875077886842713087)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,13,27,31,35,45,39,53,54,24,29,36'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3875077941074713090)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Applications [&A_NUM_APPS.]'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-th'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'200,6,51,52,20,22,20,6,28,34,17,16'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3875078084123713090)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'Standards [&A_NUM_STDS.]'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-check'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3,5,11,14,15,19'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(3875078187186713090)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(10278063259329271189)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(3875078187186713090)
,p_list_text_01=>'Interactive report of page views per user.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(10278070664177272631)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_api.id(3875078187186713090)
,p_list_text_01=>'Report of page views aggregated by user.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9196075348837911642)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Activity Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_api.id(3875078187186713090)
,p_list_text_01=>'Page views by user summarized by day in a monthly calendar.'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4421334537838332749)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gear'
,p_security_scheme=>wwv_flow_api.id(7551538863461929768)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4,7,8,9,18,21,23,25,26,30,32,175,37,38,40,37'
);
wwv_flow_api.component_end;
end;
/
