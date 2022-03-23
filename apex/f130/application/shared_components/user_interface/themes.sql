prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(4401370069715945009)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(4401307690547944881)
,p_default_dialog_template=>wwv_flow_api.id(4401323881659944904)
,p_error_template=>wwv_flow_api.id(4401316893499944896)
,p_printer_friendly_template=>wwv_flow_api.id(4401307690547944881)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(4401316893499944896)
,p_default_button_template=>wwv_flow_api.id(4401368675429944998)
,p_default_region_template=>wwv_flow_api.id(4401351010646944943)
,p_default_chart_template=>wwv_flow_api.id(4401351010646944943)
,p_default_form_template=>wwv_flow_api.id(4401351010646944943)
,p_default_reportr_template=>wwv_flow_api.id(4401351010646944943)
,p_default_tabform_template=>wwv_flow_api.id(4401351010646944943)
,p_default_wizard_template=>wwv_flow_api.id(4401351010646944943)
,p_default_menur_template=>wwv_flow_api.id(4401353470750944948)
,p_default_listr_template=>wwv_flow_api.id(4401351010646944943)
,p_default_irr_template=>wwv_flow_api.id(4401350503813944938)
,p_default_report_template=>wwv_flow_api.id(4401357621151944961)
,p_default_label_template=>wwv_flow_api.id(4401367796251944988)
,p_default_menu_template=>wwv_flow_api.id(4401368845563944999)
,p_default_calendar_template=>wwv_flow_api.id(4401368982669945000)
,p_default_list_template=>wwv_flow_api.id(4401362699432944969)
,p_default_nav_list_template=>wwv_flow_api.id(4401366028147944978)
,p_default_top_nav_list_temp=>wwv_flow_api.id(4401366028147944978)
,p_default_side_nav_list_temp=>wwv_flow_api.id(4401366758384944983)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(4401337457906944922)
,p_default_dialogr_template=>wwv_flow_api.id(4401337325799944920)
,p_default_option_label=>wwv_flow_api.id(4401367796251944988)
,p_default_header_template=>wwv_flow_api.id(4401337325799944920)
,p_default_footer_template=>wwv_flow_api.id(4401337325799944920)
,p_default_required_label=>wwv_flow_api.id(4401367923430944990)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.5/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.component_end;
end;
/
