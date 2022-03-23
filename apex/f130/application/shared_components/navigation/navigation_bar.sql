prompt --application/shared_components/navigation/navigation_bar
begin
--   Manifest
--     ICON BAR ITEMS: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(4016471920329409446)
,p_icon_sequence=>10
,p_icon_subtext=>'Help'
,p_icon_target=>'f?p=&APP_ID.:help:&SESSION.::&DEBUG.:::'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(4016472949984420763)
,p_icon_sequence=>20
,p_icon_subtext=>'Administration'
,p_icon_target=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.::::'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
,p_security_scheme=>wwv_flow_api.id(7607913474670171749)
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(4016473588665424759)
,p_icon_sequence=>30
,p_icon_subtext=>'Mobile'
,p_icon_target=>'f?p=&APP_ID.:mobile:&SESSION.::&DEBUG.:::'
,p_nav_entry_is_feedback_yn=>'N'
,p_icon_bar_disp_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''mobile enabled''',
'from apex_application_pages',
'where application_id = :APP_ID',
'    and lower(page_alias) = ''mobile'''))
,p_icon_bar_disp_cond_type=>'EXISTS'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(7627822278308377746)
,p_icon_sequence=>40
,p_icon_subtext=>'Sign Out'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Logout'
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_api.component_end;
end;
/
