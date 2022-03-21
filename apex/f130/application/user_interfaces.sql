prompt --application/user_interfaces
begin
--   Manifest
--     USER INTERFACES: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(5518741433308135589)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_theme_style_by_user_pref=>true
,p_navigation_list_id=>wwv_flow_api.id(3893809645484413006)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(4363724021747402924)
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#pkgapp_ui/css/5.0#MIN#.css',
'#APP_IMAGES#css/astStyle.min.css'))
,p_javascript_file_urls=>'#APP_IMAGES#js/ast.min.js'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(4376419214745736662)
,p_nav_bar_list_template_id=>wwv_flow_api.id(4363723872834402921)
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_api.component_end;
end;
/
