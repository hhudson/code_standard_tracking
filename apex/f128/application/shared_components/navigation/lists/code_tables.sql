prompt --application/shared_components/navigation/lists/code_tables
begin
--   Manifest
--     LIST: Code Tables
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(5361117212884043622)
,p_name=>'Code Tables'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2529040159375834846)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Application Types'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-list-alt'
,p_list_text_01=>'Manage the types of applications which standards can apply to; one standard can be applied to multiple application types.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(5057645067995553528)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1855663133752403253)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Application Statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-stethoscope'
,p_list_text_01=>'Manage the list of statuses applications may belong to (development, production, etc.).'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(5057645067995553528)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4805700458071949876)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Notifications'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_01=>'Manage notification messages displayed on the home page of this application.  Use notifications to alert application users of important information.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_api.id(5057645067995553528)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(1934606046349947379)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Manage Sample Data'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_list_text_01=>'This application ships with a sample Standard. You can remove or recreate the sample Standard using this administrative page.'
,p_list_text_02=>'gearIcon'
,p_security_scheme=>wwv_flow_api.id(5057645067995553528)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
