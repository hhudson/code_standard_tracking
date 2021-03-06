prompt --application/shared_components/navigation/lists/activity_reports
begin
--   Manifest
--     LIST: Activity Reports
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(8868693934319578404)
,p_name=>'Activity Reports'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(8869921825819862643)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-spinner'
,p_list_text_01=>'Interactive report of page views per user.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(8869929230667864085)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>'Report of page views aggregated by user.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7787933915328503096)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Activity Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Page views by user summarized by day in a monthly calendar.'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
