prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2916431860810340515
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(5500009558737435667)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'&APPLICATION_TITLE.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(5673107874060331308)
,p_javascript_code_onload=>'//detailedStatusListToolTip();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.subInfoTextRegion {',
'font-size: 11px;',
'line-height: 16px;',
'color: #707070;',
'}',
'',
'.scrollInside div.uRegionContent {',
'height: 220px;',
'overflow: auto;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'<p>This application is designed to assist in the development of consistent Oracle Application Express (APEX) applications by analyzing each application for adherence to best practices. Appl ications can be divided into different types, with some stan'
||'dards applying only to specific types of applications. To test for compliance, create a standard and associate it with the appropriate type(s) of application(s), defining at least one test against the APEX Data Dictionary to verify compliance.</p>'
,p_last_updated_by=>'HAYHUDSO'
,p_last_upd_yyyymmddhh24miss=>'20220321122902'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(3901171700170919469)
,p_name=>'Dashboard'
,p_template=>wwv_flow_api.id(4344976399438702962)
,p_display_sequence=>31
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xlarge:t-BadgeList--fixed:t-BadgeList--circular'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ( select count(*)',
'         from eba_stds_applications',
'       ) total_applications,',
'    ( select count(*)',
'      from eba_stds_standards',
'    ) all_standards,',
'    ( select count(*)',
'      from eba_stds_standard_tests',
'    ) total_tests',
'from dual'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4344980360162702973)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3901172201425919474)
,p_query_column_id=>1
,p_column_alias=>'TOTAL_APPLICATIONS'
,p_column_display_sequence=>1
,p_column_heading=>'Total Applications'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP:::'
,p_column_linktext=>'#TOTAL_APPLICATIONS#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3901172322071919475)
,p_query_column_id=>2
,p_column_alias=>'ALL_STANDARDS'
,p_column_display_sequence=>2
,p_column_heading=>'All Standards'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:::'
,p_column_linktext=>'#ALL_STANDARDS#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3901172370219919476)
,p_query_column_id=>3
,p_column_alias=>'TOTAL_TESTS'
,p_column_display_sequence=>3
,p_column_heading=>'Total Tests'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP:::'
,p_column_linktext=>'#TOTAL_TESTS#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4493442428886991427)
,p_name=>'Applications'
,p_template=>wwv_flow_api.id(4344976399438702962)
,p_display_sequence=>41
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--inline:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select na.id,',
'    na.apex_app_id,',
'    a.application_id||''. ''||a.application_name app_name,',
'    nvl(nas.name,''Unknown'') status,',
'    nvl(nt.name,''Unknown'') type,',
'    a.last_updated_on apex_app_last_updated,',
'    (   select floor(avg(ss.pass_fail_pct))',
'        from eba_stds_standard_statuses ss',
'        where ss.application_id = na.id ) completion',
'from eba_stds_applications na,',
'    eba_stds_app_statuses nas,',
'    eba_stds_types nt,',
'    apex_applications a',
'where na.status_id = nas.id(+)',
'    and na.type_id = nt.id(+)',
'    and a.application_id = na.apex_app_id',
'order by 7 asc, 2 asc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4344983009943702980)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493442718120991450)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493442818595991457)
,p_query_column_id=>2
,p_column_alias=>'APEX_APP_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Apex App ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493442937539991457)
,p_query_column_id=>3
,p_column_alias=>'APP_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Application'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:34:P34_ID:#ID#'
,p_column_linktext=>'#APP_NAME#'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493443011301991457)
,p_query_column_id=>4
,p_column_alias=>'STATUS'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493443121364991457)
,p_query_column_id=>5
,p_column_alias=>'TYPE'
,p_column_display_sequence=>5
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493443213494991457)
,p_query_column_id=>6
,p_column_alias=>'APEX_APP_LAST_UPDATED'
,p_column_display_sequence=>6
,p_column_heading=>'Last Updated'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493443334420991457)
,p_query_column_id=>7
,p_column_alias=>'COMPLETION'
,p_column_display_sequence=>7
,p_column_heading=>'Completion'
,p_use_as_row_header=>'N'
,p_column_format=>'PCT_GRAPH:E2ECF8:5284C1'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4493444620622017427)
,p_name=>'Standards'
,p_template=>wwv_flow_api.id(4344976399438702962)
,p_display_sequence=>51
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:i-h320'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--inline:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'V_EBA_STDS_STANDARDS'
,p_include_rowid_column=>false
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4344983009943702980)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493444934935017430)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493445013192017430)
,p_query_column_id=>2
,p_column_alias=>'STANDARD'
,p_column_display_sequence=>2
,p_column_heading=>'Standard'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_ID:#ID#'
,p_column_linktext=>'#STANDARD#'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4493445137035017430)
,p_query_column_id=>3
,p_column_alias=>'TESTS'
,p_column_display_sequence=>3
,p_column_heading=>'Tests'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2944648152928476925)
,p_query_column_id=>4
,p_column_alias=>'COMPLETION_STD'
,p_column_display_sequence=>4
,p_column_heading=>'Completion'
,p_column_format=>'PCT_GRAPH:#E2ECF8:#5284C1:'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4764335055898176062)
,p_plug_name=>'ACL Warning'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--defaultIcons:t-Alert--warning:t-Alert--horizontal'
,p_plug_template=>wwv_flow_api.id(4344960841526702936)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.ACL_WARNING'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'eba_stds_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''N'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attribute_01=>'f?p=&APP_ID.:SETTINGS:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4764339379225176105)
,p_plug_name=>'&APPLICATION_TITLE.'
,p_icon_css_classes=>'app-application-standards-tracker'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4344972686088702953)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in ( select preference_value',
'            from eba_stds_preferences',
'            where preference_name = ''APPLICATION_SUBTITLE''',
'            union all',
'            select ''Track and manage APEX application best practices''',
'            from dual',
'            where not exists ( select null',
'                               from eba_stds_preferences',
'                               where preference_name = ''APPLICATION_SUBTITLE'')',
'          ) loop',
'    sys.htp.p(''<p>''||apex_escape.html(c1.preference_value)||''</p>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5575592081870087464)
,p_name=>'Notifications'
,p_template=>wwv_flow_api.id(4344962714591702939)
,p_display_sequence=>11
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select     id,',
'    decode(lower(NOTIFICATION_TYPE),''yellow'',''warning'',''red'',''danger'',lower(NOTIFICATION_TYPE)) as ALERT_TYPE,',
'    NOTIFICATION_NAME as ALERT_TITLE,',
'    NOTIFICATION_DESCRIPTION as ALERT_DESC,',
'    '''' alert_action',
'  from eba_stds_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)',
' order by nvl(DISPLAY_SEQUENCE,0),NOTIFICATION_NAME'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4515107492599392662)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' '
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5575592378570087469)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4815905776943432416)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4815906192430432418)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Alert Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4815906571483432418)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Desc'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4815906970092432418)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Action'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7563726651874372626)
,p_plug_name=>'Show Timezone'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4344962714591702939)
,p_plug_display_sequence=>61
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div class="subInfoTextRegion"><p>Dates and Times are displayed in the <a href="&P1_TIMEZONE_URL.">&P1_TIMEZONE.</a> timezone.</p></div>'
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4074463571100892458)
,p_branch_name=>'Go to Getting Started Page'
,p_branch_action=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'eba_stds_fw.get_preference_value(''FIRST_RUN'') = ''YES'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5606827780143140639)
,p_name=>'P1_TIMEZONE_URL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7563726651874372626)
,p_source=>'apex_util.prepare_url(''f?p=''||:APP_ID||'':45:''||:APP_SESSION)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5606827972811144115)
,p_name=>'P1_TIMEZONE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7563726651874372626)
,p_use_cache_before_default=>'NO'
,p_source=>'nvl(apex_util.get_session_time_zone(),''unknown'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8774411414262368462)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
);
wwv_flow_api.component_end;
end;
/
