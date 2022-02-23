prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 128
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(1851101663041326788)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(1851039283873326660)
,p_default_dialog_template=>wwv_flow_api.id(1851055474985326683)
,p_error_template=>wwv_flow_api.id(1851048486825326675)
,p_printer_friendly_template=>wwv_flow_api.id(1851039283873326660)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(1851048486825326675)
,p_default_button_template=>wwv_flow_api.id(1851100268755326777)
,p_default_region_template=>wwv_flow_api.id(1851082603972326722)
,p_default_chart_template=>wwv_flow_api.id(1851082603972326722)
,p_default_form_template=>wwv_flow_api.id(1851082603972326722)
,p_default_reportr_template=>wwv_flow_api.id(1851082603972326722)
,p_default_tabform_template=>wwv_flow_api.id(1851082603972326722)
,p_default_wizard_template=>wwv_flow_api.id(1851082603972326722)
,p_default_menur_template=>wwv_flow_api.id(1851085064076326727)
,p_default_listr_template=>wwv_flow_api.id(1851082603972326722)
,p_default_irr_template=>wwv_flow_api.id(1851082097139326717)
,p_default_report_template=>wwv_flow_api.id(1851089214477326740)
,p_default_label_template=>wwv_flow_api.id(1851099389577326767)
,p_default_menu_template=>wwv_flow_api.id(1851100438889326778)
,p_default_calendar_template=>wwv_flow_api.id(1851100575995326779)
,p_default_list_template=>wwv_flow_api.id(1851094292758326748)
,p_default_nav_list_template=>wwv_flow_api.id(1851097621473326757)
,p_default_top_nav_list_temp=>wwv_flow_api.id(1851097621473326757)
,p_default_side_nav_list_temp=>wwv_flow_api.id(1851098351710326762)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(1851069051232326701)
,p_default_dialogr_template=>wwv_flow_api.id(1851068919125326699)
,p_default_option_label=>wwv_flow_api.id(1851099389577326767)
,p_default_header_template=>wwv_flow_api.id(1851068919125326699)
,p_default_footer_template=>wwv_flow_api.id(1851068919125326699)
,p_default_required_label=>wwv_flow_api.id(1851099516756326769)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.4/')
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
