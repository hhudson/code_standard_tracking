prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(5594253093425280902)
,p_name=>'Grid Edit'
,p_alias=>'GRID-EDIT'
,p_step_title=>'Grid Edit'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.filterSearchIcon {',
'width: 16px;',
'height: 16px;',
'margin: 8px 4px 8px 8px;',
'display: inline-block;',
'vertical-align: top;',
'background: url(#IMAGE_PREFIX#themes/apps/images/app_theme.png) -176px -528px no-repeat transparent;',
'}',
'.filterSearchContainer {',
'border: 1px solid #999;',
'border-right: none;',
'-webkit-box-shadow: 0 1px 0 rgba(255,255,255,0.75);',
'-moz-box-shadow: 0 1px 0 rgba(255,255,255,0.75);',
'box-shadow: 0 1px 0 rgba(255,255,255,0.75);',
'border-radius: 2px;',
'background-color: #FFF;',
'display: inline-block;',
'}',
'table.formlayout input.text_field.filterSearchField {',
'padding: 8px 4px;',
'border: none;',
'height: 16px;',
'font-size: 16px;',
'line-height: 16px;',
'display: inline-block;',
'background-color: #FFF;',
'color: #404040;',
'border-radius: 0;',
'-webkit-box-shadow: none;',
'-moz-box-shadow: none;',
'box-shadow: none;',
'vertical-align: top;',
'width: 100px !important;',
'}',
'.filterSideRegion table.formlayout>tbody>tr>td {',
'padding: 0;',
'}',
'',
'div.searchFilters {',
'margin: 8px 0 8px 0;',
'}',
'div.searchFilters h2 {',
'font: normal 13px/30px "Helvetica Neue",Helvetica,Arial,sans-serif;',
'color: #404040;',
'text-shadow: 0 1px 0 rgba(255,255,255,0.5);',
'vertical-align: top',
'}',
'div.searchFilters span.searchFilter {',
'vertical-align: top;',
'margin-right: 4px;',
'display: inline-block;',
'-webkit-border-radius: 3px;',
'-moz-border-radius: 3px;',
'border-radius: 3px;',
'font: normal 11px/30px "Helvetica Neue",Helvetica,Arial,sans-serif;',
'background-color: #FFF;',
'background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #F8F8F8), color-stop(100%, #E0E0E0));',
'background-image: -webkit-linear-gradient(#F8F8F8,#E0E0E0);',
'background-image: -moz-linear-gradient(#F8F8F8,#E0E0E0);',
'background-image: linear-gradient(#FAFAFA,#F0F0F0);',
'border: 1px solid #DDD;',
'border-bottom-color: #CCC;',
'color: #404040;',
'text-shadow: 0 1px 0 rgba(255,255,255,.35);',
'-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1), 0 1px 0 rgba(255, 255, 255, .65) inset;',
'-moz-box-shadow: 0 1px 1px rgba(0,0,0,0.1);',
'box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);',
'padding: 0 4px;',
'margin-bottom: 4px;',
'}',
'div.searchFilters span.searchFilter strong {',
'font: bold 11px/12px "Helvetica Neue",Helvetica,Arial,sans-serif;',
'display: block;',
'padding: 8px 0 2px 0;',
'color: #404040',
'}',
'div.searchFilters span.searchFilter span.noFilterText {',
'text-shadow: none;',
'color: #707070;',
'text-decoration: none;',
'padding: 0 4px 0 4px;',
'line-height: 22px;',
'display: inline-block;',
'border: 1px solid transparent;',
'margin: 0 2px;',
'position: relative',
'}',
'div.searchFilters span.searchFilter a {',
'text-shadow: none;',
'color: #404040;',
'text-decoration: none;',
'padding: 0 22px 0 4px;',
'line-height: 22px;',
'display: inline-block;',
'-webkit-border-radius: 2px;',
'-moz-border-radius: 2px;',
'border-radius: 2px;',
'border: 1px solid #b1bbcb;',
'background-color: #e5effb;',
'margin: 0 0 4px 0;',
'position: relative',
'}',
'div.searchFilters span.searchFilter a.noRemoveButton {',
'padding-right: 4px',
'}',
'div.searchFilters span.searchFilter a:hover img {',
'background-color: #b1bbcb;',
'background: url(#IMAGE_PREFIX#themes/apps/images/app_theme.png) -96px -50px no-repeat #b1bbcb;',
'border: 1px solid #7887a0',
'}',
'div.searchFilters span.searchFilter a img {',
'-webkit-border-radius: 2px;',
'-moz-border-radius: 2px;',
'border-radius: 2px;',
'margin: 3px;',
'border: 1px solid #b1bbcb;',
'width: 14px;',
'height: 14px;',
'vertical-align: middle;',
'background-color: #FFF;',
'background: url(#IMAGE_PREFIX#themes/apps/images/app_theme.png) -72px -50px no-repeat #fff;',
'display: block;',
'position: absolute;',
'right: 0;',
'top: 0',
'}',
'div.searchFilters span.filterOperator {',
'font: normal 13px/24px "Helvetica Neue",Helvetica,Arial,sans-serif;',
'color: #999;',
'margin: 0 8px',
'}',
'',
'a.uButton.go-button {',
'font-size: 13px;',
'line-height: 32px;',
'vertical-align: top;',
'border-radius: 0 3px 3px 0;',
'margin-left: -4px;',
'}',
'a.uButton.go-button span {',
'border-radius: 0 2px 2px 0;',
'padding: 0 12px;',
'}',
'',
'.fs-filter-region{border-width:1px;border-style:solid;border-color:#AAA;margin-bottom:8px}.fs-filter-region.collapsed .fs-fg-title{border-bottom:none}.fs-filter-region.collapsed .fs-fg-body{display:none}.fs-fg-title{background-color:#F0F0F0;border-bo'
||'ttom:1px solid #aaa}.fs-fg-title h3{font-size:12px;font-weight:bold;line-height:24px;padding:0 8px;display:inline-block}.fs-fg-current-filter{background-color:#F8F8F8;border-bottom:1px solid #d0d0d0;padding:4px}.fs-fg-current-filter .fs-fg-current-fi'
||'lter-item{border:1px solid #aaa;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;display:inline-block;padding:0 0 0 8px;font-weight:bold;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;text-decoration:'
||'none;background-color:#FFF;line-height:20px;font-size:11px;color:#404040}.fs-fg-current-filter .fs-fg-current-filter-item:hover i.fs-icon{background-color:#D0D0D0}.fs-fg-current-filter .fs-fg-current-filter-item i.fs-icon{margin-left:4px;-webkit-bord'
||'er-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0;border-left:1px solid #aaa;background-color:#F0F0F0}ul.fs-filter-list{margin:0;padding:0;list-style:none}ul.fs-filter-list li{border-top:1px solid #ddd}ul.fs-filter-list l'
||'i:first-child{border-top:none}ul.fs-filter-list li .fs-filter-item{display:block;color:#404040;font-size:12px;line-height:20px;text-decoration:none;-webkit-transition:background-color 0.2s;-moz-transition:background-color 0.2s;transition:background-c'
||'olor 0.2s}ul.fs-filter-list li .fs-filter-item:hover{background-color:#F0F0F0}ul.fs-filter-list li .fs-filter-item .fs-count{float:right;padding-right:4px}ul.fs-filter-list li .fs-filter-item.active{font-weight:bold}ul.fs-filter-list li .fs-filter-it'
||'em.unavailable{color:#A0A0A0;padding-left:20px}ul.fs-filter-list li .fs-count{color:#707070;font-size:11px}i.fs-icon{width:20px;height:20px;display:inline-block;background-image:url(#APP_IMAGES#fs-sprite.png);background-repeat:no-repeat;background-co'
||'lor:transparent;vertical-align:bottom}i.fs-icon.triangle-right,i.fs-icon.expanded,.fs-filter-region.collapsed .fs-fg-title button.collapse-button i.collapse{background-position:0 0}i.fs-icon.collapse{background-position:-20px 0}i.fs-icon.edit{backgro'
||'und-position:-40px 0}i.fs-icon.plus{background-position:-60px 0}i.fs-icon.close{background-position:-80px 0}i.fs-icon.checkbox{background-position:-100px 0}i.fs-icon.checkbox-checked,ul.fs-filter-list li .fs-filter-item.active i.checkbox{background-p'
||'osition:-120px 0}i.fs-icon.bullet{background-position:-140px 0}i.fs-icon.clear-filter{background-position:-160px 0}.fs-filter-region{border-color:#A4A4A4;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 1px 1px '
||'rgba(0,0,0,0.15);-moz-box-shadow:0 1px 1px rgba(0,0,0,0.15);box-shadow:0 1px 1px rgba(0,0,0,0.15)}.fs-filter-region.collapsed .fs-fg-title{border-bottom:none;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.fs-fg-title{-webkit-bord'
||'er-radius:3px 3px 0 0;-moz-border-radius:3px 3px 0 0;border-radius:3px 3px 0 0;background-color:#F8F8F8;background-image:url(''data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3'
||'d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjUwJSIgeTE9IjAlIiB4Mj0iNTAlIiB5Mj0iMTAwJSI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2Y5ZjlmOSIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xv'
||'cj0iI2UwZTBlMCIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA=='');background-size:100%;background-image:-webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #f9'
||'f9f9), color-stop(100%, #e0e0e0));background-image:-webkit-linear-gradient(top, #f9f9f9,#e0e0e0);background-image:-moz-linear-gradient(top, #f9f9f9,#e0e0e0);background-image:linear-gradient(top, #f9f9f9,#e0e0e0);border-color:#C0C0C0}.fs-fg-title h3{c'
||'olor:#404040;text-shadow:0 1px 0 rgba(255,255,255,0.75)}ul.fs-filter-list{max-height:200px;overflow-y:auto;-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px}ul.fs-filter-list li{border-color:#EBEBEB}ul.fs-filt'
||'er-list li .fs-filter-item{font-size:11px}ul.fs-filter-list li .fs-filter-item:hover{background-color:#F8F8F8}',
'',
'/* Styles for Filter Side Column */',
'.side_col {',
'    float: left; width: 19%; margin-right: 0.5%;',
'}',
'.content_column {',
'    float: left;',
'    width: 80%;',
'}',
'',
'@media only screen and (max-width: 767px) {',
'.side_col,',
'.content_column {',
' float: none;',
' width: auto;',
'}',
'#active_filters_report {',
'min-height: 0;',
'}',
'}'))
,p_step_template=>wwv_flow_api.id(4439179195893548142)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7645782889922775014)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'HAYHUDSO'
,p_last_upd_yyyymmddhh24miss=>'20220321135455'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3032138453131360297)
,p_plug_name=>'Applications'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439219427293548192)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'EBA_STDS_APPLICATIONS'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Applications'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028746318151970411)
,p_name=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAGS'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tags'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028746452051970412)
,p_name=>'ROW_VERSION_NUMBER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_VERSION_NUMBER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028746561313970413)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028746650211970414)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028746684315970415)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028746796864970416)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028746920052970417)
,p_name=>'APPLICATIONS_FLEX_01'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_01'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747043167970418)
,p_name=>'APPLICATIONS_FLEX_02'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_02'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747165836970419)
,p_name=>'APPLICATIONS_FLEX_03'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_03'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747260478970420)
,p_name=>'APPLICATIONS_FLEX_04'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_04'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747314939970421)
,p_name=>'APPLICATIONS_FLEX_05'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_05'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747469599970422)
,p_name=>'APPLICATIONS_FLEX_06'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_06'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747523085970423)
,p_name=>'APPLICATIONS_FLEX_07'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_07'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747660905970424)
,p_name=>'APPLICATIONS_FLEX_08'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_08'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747677208970425)
,p_name=>'APPLICATIONS_FLEX_N01'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_N01'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747866081970426)
,p_name=>'APPLICATIONS_FLEX_N02'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_N02'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028747906674970427)
,p_name=>'APPLICATIONS_FLEX_N03'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_N03'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028748017747970428)
,p_name=>'APPLICATIONS_FLEX_N04'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_N04'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028748127789970429)
,p_name=>'APPLICATIONS_FLEX_D01'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_D01'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028748198585970430)
,p_name=>'APPLICATIONS_FLEX_D02'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_D02'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028748317129970431)
,p_name=>'APPLICATIONS_FLEX_D03'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_D03'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028748460572970432)
,p_name=>'APPLICATIONS_FLEX_D04'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_D04'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>340
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3028748504564970433)
,p_name=>'APPLICATIONS_FLEX_CLOB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLICATIONS_FLEX_CLOB'
,p_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032139508072360319)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032139943904360319)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032140571594360322)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032141111444360323)
,p_name=>'ROW_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROW_KEY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032142340963360324)
,p_name=>'APEX_APP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APEX_APP_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Apex App Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032142918119360324)
,p_name=>'STATUS_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUS_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(4428278393855065792)
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_null_text=>'- Select a Status -'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032143514523360324)
,p_name=>'TYPE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_api.id(4428285579813068406)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'- Select a Type -'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032144113932360324)
,p_name=>'PREFIX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PREFIX'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Prefix'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032144733128360325)
,p_name=>'LAST_ADVISOR_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_ADVISOR_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Last Advisor Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD-Mon-YYYY'
,p_item_width=>12
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(3032145314503360325)
,p_name=>'LAST_SECURITY_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_SECURITY_DATE'
,p_data_type=>'TIMESTAMP_LTZ'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Last Security Check'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD-Mon-YYYY'
,p_item_width=>12
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(3032138852430360313)
,p_internal_uid=>2919187276639303622
,p_is_editable=>true
,p_edit_operations=>'d'
,p_lost_update_check_type=>'VALUES'
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(3032139194024360316)
,p_interactive_grid_id=>wwv_flow_api.id(3032138852430360313)
,p_static_id=>'187122'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(3032139350902360317)
,p_report_id=>wwv_flow_api.id(3032139194024360316)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032140283636360321)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(3032139943904360319)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032140928501360323)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(3032140571594360322)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032141530610360323)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(3032141111444360323)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032142679748360324)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(3032142340963360324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032143321094360324)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(3032142918119360324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032143904784360324)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(3032143514523360324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032144563048360325)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(3032144113932360324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032145089617360325)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(3032144733128360325)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032145775502360325)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(3032145314503360325)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032154287513376694)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(3028746318151970411)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032154820739376696)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(3028746452051970412)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032155295027376697)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(3028746561313970413)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032155857784376699)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(3028746650211970414)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032156323817376700)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(3028746684315970415)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032156807356376701)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(3028746796864970416)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032157299649376702)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(3028746920052970417)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032157870705376703)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(3028747043167970418)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032158348671376704)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(3028747165836970419)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032158805603376705)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(3028747260478970420)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032159369731376706)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>20
,p_column_id=>wwv_flow_api.id(3028747314939970421)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032159798814376708)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(3028747469599970422)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032160338876376709)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>22
,p_column_id=>wwv_flow_api.id(3028747523085970423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032160849867376710)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>23
,p_column_id=>wwv_flow_api.id(3028747660905970424)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032161350908376711)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>24
,p_column_id=>wwv_flow_api.id(3028747677208970425)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032161808392376712)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>25
,p_column_id=>wwv_flow_api.id(3028747866081970426)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032162373825376713)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>26
,p_column_id=>wwv_flow_api.id(3028747906674970427)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032162827017376714)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>27
,p_column_id=>wwv_flow_api.id(3028748017747970428)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032163284331376715)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>28
,p_column_id=>wwv_flow_api.id(3028748127789970429)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032163709001376716)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>29
,p_column_id=>wwv_flow_api.id(3028748198585970430)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032164194277376718)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>30
,p_column_id=>wwv_flow_api.id(3028748317129970431)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032164691706376719)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>31
,p_column_id=>wwv_flow_api.id(3028748460572970432)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(3032165236618376720)
,p_view_id=>wwv_flow_api.id(3032139350902360317)
,p_display_seq=>32
,p_column_id=>wwv_flow_api.id(3028748504564970433)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4428273074328929547)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439222394230548202)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(8850087331635351449)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(4439237769043548253)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4428286778647080977)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4428540575839127406)
,p_plug_name=>'Filter Sidebar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'eba_stds_filter2_fw.render_sidebar();'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4428542066751143723)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4428273074328929547)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(4439236992958548250)
,p_button_image_alt=>'Reset Report'
,p_button_position=>'NEXT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4428270464392929539)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4428273074328929547)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'Cancel'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4428270684102929539)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4428273074328929547)
,p_button_name=>'MULTI_ROW_DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'Delete'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''MULTI_ROW_DELETE'');'
,p_button_execute_validations=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4428270569146929539)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4428273074328929547)
,p_button_name=>'SUBMIT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'NEXT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4428272785044929545)
,p_branch_action=>'f?p=&APP_ID.:16:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4428296187804083710)
,p_name=>'P16_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4428286778647080977)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4428532178746087998)
,p_name=>'P16_TEXT_SEARCH_LABEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4428286778647080977)
,p_use_cache_before_default=>'NO'
,p_source=>'Search Terms'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4428532374002090137)
,p_name=>'P16_FILTER_SEQUENCE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4428286778647080977)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4428271563596929541)
,p_tabular_form_region_id=>wwv_flow_api.id(3032138453131360297)
,p_validation_name=>'STATUS_ID must be numeric'
,p_validation_sequence=>50
,p_validation=>'STATUS_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_when_button_pressed=>wwv_flow_api.id(4428270569146929539)
,p_associated_column=>'STATUS_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4428271775722929543)
,p_tabular_form_region_id=>wwv_flow_api.id(3032138453131360297)
,p_validation_name=>'TYPE_ID must be numeric'
,p_validation_sequence=>60
,p_validation=>'TYPE_ID'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'#COLUMN_HEADER# must be numeric.'
,p_when_button_pressed=>wwv_flow_api.id(4428270569146929539)
,p_associated_column=>'TYPE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4428271970209929544)
,p_tabular_form_region_id=>wwv_flow_api.id(3032138453131360297)
,p_validation_name=>'LAST_ADVISOR_DATE must be a valid timestamp'
,p_validation_sequence=>90
,p_validation=>'LAST_ADVISOR_DATE'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#COLUMN_HEADER# must be a valid timestamp value.'
,p_when_button_pressed=>wwv_flow_api.id(4428270569146929539)
,p_associated_column=>'LAST_ADVISOR_DATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4428272182896929544)
,p_tabular_form_region_id=>wwv_flow_api.id(3032138453131360297)
,p_validation_name=>'LAST_SECURITY_DATE must be a valid timestamp'
,p_validation_sequence=>100
,p_validation=>'LAST_SECURITY_DATE'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#COLUMN_HEADER# must be a valid date value.'
,p_when_button_pressed=>wwv_flow_api.id(4428270569146929539)
,p_associated_column=>'LAST_SECURITY_DATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4438061169593546062)
,p_name=>'On Filter Change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_FILTER'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4438061482328546064)
,p_event_id=>wwv_flow_api.id(4438061169593546062)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4438062264183553946)
,p_name=>'Handle Filter Change'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input.filterLink'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4438062587311553946)
,p_event_id=>wwv_flow_api.id(4438062264183553946)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$s("P16_FILTER_SEQUENCE", $(this.triggeringElement).attr("data-sequence"));'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4438062770625558640)
,p_event_id=>wwv_flow_api.id(4438062264183553946)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_active varchar2(1);',
'begin',
'    if nvl(eba_stds_filter2_fw.get_filter( p_seq_id => :P16_FILTER_SEQUENCE ),''N'') = ''N'' then',
'        l_active := ''Y'';',
'    else',
'        l_active := ''N'';',
'    end if;',
'',
'    eba_stds_filter2_fw.set_filter( p_seq_id => :P16_FILTER_SEQUENCE,',
'                                    p_active  => l_active );',
'end;'))
,p_attribute_02=>'P16_FILTER_SEQUENCE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4438065891532564142)
,p_event_id=>wwv_flow_api.id(4438062264183553946)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P16_FILTER'
,p_attribute_01=>'FUNCTION_BODY'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    cursor l_csr is',
'        select c001 col, c003 disp',
'        from apex_collections',
'        where collection_name = ''APEX_FILTER_''||:APP_ID||''_''||:APP_PAGE_ID',
'            and c010 = ''Y''',
'        order by seq_id;',
'    l_rec l_csr%ROWTYPE;',
'    l_val varchar2(4000);',
'    c number := 0;',
'begin',
'    for l_rec in l_csr loop',
'        if c > 0 then',
'            l_val := l_val||''|'';',
'        end if;',
'        c := c+1;',
'',
'        if l_rec.col is null then',
'            l_val := l_val||apex_escape.html(l_rec.disp);',
'        else',
'            l_val := l_val||apex_escape.html(l_rec.col||'';''||l_rec.disp);',
'        end if;',
'    end loop;',
'    return l_val;',
'end;'))
,p_attribute_08=>'N'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3032145962163360327)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(3032138453131360297)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Applications - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4428547565637238025)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Filters'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P16_FILTER := null;',
'eba_stds_filter2_fw.reset_collection();'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4428542066751143723)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4428540377786118557)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Build Filter Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_lovs eba_stds_filter_col_tbl := eba_stds_filter_col_tbl();',
'    l_filter_sets apex_application_global.vc_arr2;',
'    l_filter apex_application_global.vc_arr2;',
'begin',
'    l_lovs.extend;',
'    l_lovs(l_lovs.COUNT) := eba_stds_filter_column_t(null,',
'                                                     ''VARCHAR2'',',
'                                                     ''N'',',
'                                                     ''N'',',
'                                                     ''N'',',
'                                                     null,',
'                                                     null,',
'                                                     ''D'');',
'    l_lovs(l_lovs.COUNT).query_column := ''type_id'';',
'    l_lovs(l_lovs.COUNT).header := ''Type'';',
'    l_lovs(l_lovs.COUNT).datatype := ''NUMBER'';',
'    l_lovs(l_lovs.COUNT).lov_name := ''APPLICATION TYPES'';',
'    l_lovs(l_lovs.COUNT).match_column := ''R'';',
'',
'    l_lovs.extend;',
'    l_lovs(l_lovs.COUNT) := eba_stds_filter_column_t(null,',
'                                                     ''VARCHAR2'',',
'                                                     ''N'',',
'                                                     ''N'',',
'                                                     ''N'',',
'                                                     null,',
'                                                     null,',
'                                                     ''D'');',
'    l_lovs(l_lovs.COUNT).query_column := ''status_id'';',
'    l_lovs(l_lovs.COUNT).header := ''Status'';',
'    l_lovs(l_lovs.COUNT).datatype := ''NUMBER'';',
'    l_lovs(l_lovs.COUNT).lov_name := ''APPLICATION STATUSES'';',
'    l_lovs(l_lovs.COUNT).match_column := ''R'';',
'',
'    eba_stds_filter2_fw.build_collection( p_col_tbl => l_lovs );',
'end;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_api.component_end;
end;
/
