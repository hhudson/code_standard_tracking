prompt --application/pages/page_00019
begin
--   Manifest
--     PAGE: 00019
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(3006115763271059427)
,p_name=>'Test Results'
,p_step_title=>'Test Results'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function openInBuilder(url) {',
'    apex.navigation.openInNewWindow(url,',
'        ''APEX_BUILDER'',',
'        {altSuffix:''&APX_BLDR_SESSION.'',favorTabbedBrowsing: true});',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'CELARA'
,p_last_upd_yyyymmddhh24miss=>'20190924133720'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1544635702724834143)
,p_plug_name=>'&P19_TEST_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1851068919125326699)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p style="white-space:pre">&P19_HELP_TEXT.</p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1998485347393348056)
,p_name=>'Test Results'
,p_template=>wwv_flow_api.id(1851082603972326722)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when ac.c001 = ''Y'' then',
'            ''Pass''',
'        when tv.false_positive_yn = ''Y'' then',
'            ''False Negative''',
'        else ''Fail''',
'    end as status,',
'    case when ac.c001 = ''N'' and tv.false_positive_yn = ''Y'' then',
'        ''<a href="javascript:$s(''''P19_VALIDATE'''',''''-''||ac.c002||'''''');" ''',
'            ||''class="t-Button t-Button--success t-Button--stretch">''',
'            ||''Marked as Valid</a>''',
'            ||''<div style="text-align:center">''||apex_util.get_since(tv.updated)',
'            ||'' by ''||apex_escape.html(tv.updated_by)||''</div>''',
'        when ac.c001 = ''N'' then',
'            ''<a href="javascript:$s(''''P19_VALIDATE'''',''''+''||ac.c002||'''''');" ''',
'            ||''class="t-Button t-Button--stretch">''',
'            ||''Mark as Valid</a>''',
'        else ''&nbsp;'' end as false_neg_date,',
'    case when :APX_BLDR_SESSION is not null',
'            and apex_util.get_build_option_status(p_application_id => :APP_ID,',
'                                                  p_build_option_name => ''Link to Builder'') = ''INCLUDE'' then',
'        ''javascript:openInBuilder(''''''',
'            ||eba_stds_parser.build_link( :P19_TEST_ID, :P19_APPLICATION_ID, ac.c002 )',
'            ||'''''');''',
'        else ''javascript:null;''',
'    end as edit_link,',
'    ac.c002, ac.c003, ac.c004, ac.c005, ac.c006, ac.c007, ac.c008, ac.c009, ac.c010,',
'    ac.c011, ac.c012, ac.c013, ac.c014, ac.c015, ac.c016, ac.c017, ac.c018, ac.c019, ac.c020,',
'    ac.c021, ac.c022, ac.c023, ac.c024, ac.c025, ac.c026, ac.c027, ac.c028, ac.c029, ac.c030,',
'    ac.c031, ac.c032, ac.c033, ac.c034, ac.c035, ac.c036, ac.c037, ac.c038, ac.c039, ac.c040,',
'    ac.c041, ac.c042, ac.c043, ac.c044, ac.c045, ac.c046, ac.c047, ac.c048, ac.c049, ac.c050,',
'    ac.seq_id,',
'    case when ac.c001 = ''Y'' or tv.false_positive_yn = ''Y'' then ''success''',
'        else ''warning'' end as button_style',
'from apex_collections ac,',
'    eba_stds_test_validations tv',
'where ac.collection_name = ''EBA_STDS_P19_TEST_RESULTS''',
'    and tv.test_id(+) = :P19_TEST_ID',
'    and tv.application_id(+) = :P19_APPLICATION_ID',
'    and tv.result_identifier(+) = ac.c002',
'    and (:P19_SHOWONLY is null',
'        or (:P19_SHOWONLY = ''F'' and (ac.c001 = ''N'' and nvl(tv.false_positive_yn,''N'') != ''Y''))',
'        or (:P19_SHOWONLY = ''P'' and (ac.c001 = ''Y'' or  nvl(tv.false_positive_yn,''N'')  = ''Y''))',
'        or (:P19_SHOWONLY = ''N'' and (ac.c001 = ''N'' and nvl(tv.false_positive_yn,''N'')  = ''Y''))',
'    )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P19_SHOWONLY,APX_BLDR_SESSION,P19_LINK_TYPE'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(1851089214477326740)
,p_query_headings=>'return :P19_HEADINGS;'
,p_query_headings_type=>'FUNCTION_BODY_RETURNING_COLON_DELIMITED_LIST'
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
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
 p_id=>wwv_flow_api.id(1998607539387969063)
,p_query_column_id=>1
,p_column_alias=>'STATUS'
,p_column_display_sequence=>2
,p_column_link=>'#EDIT_LINK#'
,p_column_linktext=>'#STATUS#'
,p_column_link_attr=>'class="t-Button t-Button--#BUTTON_STYLE# t-Button--stretch"'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(610771442861532022)
,p_query_column_id=>2
,p_column_alias=>'FALSE_NEG_DATE'
,p_column_display_sequence=>3
,p_column_heading=>'Validation Status'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998608028807989153)
,p_query_column_id=>3
,p_column_alias=>'EDIT_LINK'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_required_patch=>wwv_flow_api.id(1999777641879314944)
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998607740021983937)
,p_query_column_id=>4
,p_column_alias=>'C002'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609125967036025)
,p_query_column_id=>5
,p_column_alias=>'C003'
,p_column_display_sequence=>5
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c003'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609216374036025)
,p_query_column_id=>6
,p_column_alias=>'C004'
,p_column_display_sequence=>6
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c004'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609332460036025)
,p_query_column_id=>7
,p_column_alias=>'C005'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c005'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609422144036025)
,p_query_column_id=>8
,p_column_alias=>'C006'
,p_column_display_sequence=>8
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c006'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609521181036025)
,p_query_column_id=>9
,p_column_alias=>'C007'
,p_column_display_sequence=>9
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c007'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609636265036025)
,p_query_column_id=>10
,p_column_alias=>'C008'
,p_column_display_sequence=>10
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c008'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609743390036025)
,p_query_column_id=>11
,p_column_alias=>'C009'
,p_column_display_sequence=>11
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c009'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609829725036025)
,p_query_column_id=>12
,p_column_alias=>'C010'
,p_column_display_sequence=>12
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c010'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998609922439036025)
,p_query_column_id=>13
,p_column_alias=>'C011'
,p_column_display_sequence=>13
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c011'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610028537036025)
,p_query_column_id=>14
,p_column_alias=>'C012'
,p_column_display_sequence=>14
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c012'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610128443036025)
,p_query_column_id=>15
,p_column_alias=>'C013'
,p_column_display_sequence=>15
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c013'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610217905036025)
,p_query_column_id=>16
,p_column_alias=>'C014'
,p_column_display_sequence=>16
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c014'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610340455036025)
,p_query_column_id=>17
,p_column_alias=>'C015'
,p_column_display_sequence=>17
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c015'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610446331036025)
,p_query_column_id=>18
,p_column_alias=>'C016'
,p_column_display_sequence=>18
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c016'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610532435036025)
,p_query_column_id=>19
,p_column_alias=>'C017'
,p_column_display_sequence=>19
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c017'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610648060036025)
,p_query_column_id=>20
,p_column_alias=>'C018'
,p_column_display_sequence=>20
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c018'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610727724036025)
,p_query_column_id=>21
,p_column_alias=>'C019'
,p_column_display_sequence=>21
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c019'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610837419036025)
,p_query_column_id=>22
,p_column_alias=>'C020'
,p_column_display_sequence=>22
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c020'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998610930721036025)
,p_query_column_id=>23
,p_column_alias=>'C021'
,p_column_display_sequence=>23
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c021'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611017967036025)
,p_query_column_id=>24
,p_column_alias=>'C022'
,p_column_display_sequence=>24
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c022'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611142743036026)
,p_query_column_id=>25
,p_column_alias=>'C023'
,p_column_display_sequence=>25
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c023'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611246615036026)
,p_query_column_id=>26
,p_column_alias=>'C024'
,p_column_display_sequence=>26
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c024'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611334057036027)
,p_query_column_id=>27
,p_column_alias=>'C025'
,p_column_display_sequence=>27
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c025'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611444095036027)
,p_query_column_id=>28
,p_column_alias=>'C026'
,p_column_display_sequence=>28
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c026'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611541300036027)
,p_query_column_id=>29
,p_column_alias=>'C027'
,p_column_display_sequence=>29
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c027'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611618890036027)
,p_query_column_id=>30
,p_column_alias=>'C028'
,p_column_display_sequence=>30
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c028'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611735058036027)
,p_query_column_id=>31
,p_column_alias=>'C029'
,p_column_display_sequence=>31
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c029'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611818091036027)
,p_query_column_id=>32
,p_column_alias=>'C030'
,p_column_display_sequence=>32
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c030'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998611939291036027)
,p_query_column_id=>33
,p_column_alias=>'C031'
,p_column_display_sequence=>33
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c031'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612025467036027)
,p_query_column_id=>34
,p_column_alias=>'C032'
,p_column_display_sequence=>34
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c032'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612124609036027)
,p_query_column_id=>35
,p_column_alias=>'C033'
,p_column_display_sequence=>35
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c033'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612219916036027)
,p_query_column_id=>36
,p_column_alias=>'C034'
,p_column_display_sequence=>36
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c034'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612331622036027)
,p_query_column_id=>37
,p_column_alias=>'C035'
,p_column_display_sequence=>37
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c035'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612447607036027)
,p_query_column_id=>38
,p_column_alias=>'C036'
,p_column_display_sequence=>38
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c036'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612528056036027)
,p_query_column_id=>39
,p_column_alias=>'C037'
,p_column_display_sequence=>39
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c037'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612642397036027)
,p_query_column_id=>40
,p_column_alias=>'C038'
,p_column_display_sequence=>40
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c038'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612718452036027)
,p_query_column_id=>41
,p_column_alias=>'C039'
,p_column_display_sequence=>41
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c039'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612842060036027)
,p_query_column_id=>42
,p_column_alias=>'C040'
,p_column_display_sequence=>42
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c040'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998612929069036027)
,p_query_column_id=>43
,p_column_alias=>'C041'
,p_column_display_sequence=>43
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c041'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613021514036027)
,p_query_column_id=>44
,p_column_alias=>'C042'
,p_column_display_sequence=>44
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c042'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613147614036027)
,p_query_column_id=>45
,p_column_alias=>'C043'
,p_column_display_sequence=>45
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c043'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613245495036027)
,p_query_column_id=>46
,p_column_alias=>'C044'
,p_column_display_sequence=>46
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c044'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613325934036027)
,p_query_column_id=>47
,p_column_alias=>'C045'
,p_column_display_sequence=>47
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c045'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613436221036027)
,p_query_column_id=>48
,p_column_alias=>'C046'
,p_column_display_sequence=>48
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c046'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613534649036027)
,p_query_column_id=>49
,p_column_alias=>'C047'
,p_column_display_sequence=>49
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c047'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613626064036027)
,p_query_column_id=>50
,p_column_alias=>'C048'
,p_column_display_sequence=>50
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c048'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613722613036028)
,p_query_column_id=>51
,p_column_alias=>'C049'
,p_column_display_sequence=>51
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c049'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1998613833703036028)
,p_query_column_id=>52
,p_column_alias=>'C050'
,p_column_display_sequence=>52
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>'instr(:P19_COLS,''c050'') > 0'
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1999307534939648556)
,p_query_column_id=>53
,p_column_alias=>'SEQ_ID'
,p_column_display_sequence=>53
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(2598689617906247349)
,p_query_column_id=>54
,p_column_alias=>'BUTTON_STYLE'
,p_column_display_sequence=>54
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1998485816353348085)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1851085064076326727)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(6261950001481129974)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1851100438889326778)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1998551522481434892)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1851068919125326699)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_07'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1998666641252264535)
,p_plug_name=>'Controls'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1851069051232326701)
,p_plug_display_sequence=>20
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2001560138771928454)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1998485816353348085)
,p_button_name=>'VIEW_APPLICATION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1851099662804326775)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Application'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:34:P34_ID:&P19_STDS_APP_ID.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2545850733345415627)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1998485816353348085)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(1851099662804326775)
,p_button_image_alt=>'Refresh'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(622671679544120618)
,p_name=>'P19_VALIDATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(1998551522481434892)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998552117682438899)
,p_name=>'P19_TEST_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1998551522481434892)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998605134704895275)
,p_name=>'P19_COLS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1998551522481434892)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998605330822897055)
,p_name=>'P19_HEADINGS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(1998551522481434892)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998667127120272640)
,p_name=>'P19_TEST_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1998551522481434892)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name',
'from eba_stds_standard_tests t',
'where t.id = :P19_TEST_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998668639819297140)
,p_name=>'P19_HELP_TEXT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(1998666641252264535)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select failure_help_text',
'from eba_stds_standard_tests',
'where id = :P19_TEST_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998682332965771330)
,p_name=>'P19_SHOWONLY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(1998666641252264535)
,p_prompt=>'Show'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Only Failures;F,Only Passes;P,False Negatives;N'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1851099389577326767)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2001562140884947258)
,p_name=>'P19_APPLICATION_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1998666641252264535)
,p_prompt=>'Application'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select aa.application_id||''. ''||aa.application_name d, aa.application_id r',
'from eba_stds_standard_tests st,',
'    eba_stds_standard_type_ref str,',
'    eba_stds_applications a,',
'    apex_applications aa',
'where st.id = :P19_TEST_ID',
'    and str.standard_id = st.standard_id',
'    and a.type_id = str.type_id',
'    and aa.application_id = a.apex_app_id',
'order by aa.application_id'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1851099389577326767)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2001564627716968499)
,p_name=>'P19_STDS_APP_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(1998551522481434892)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id',
'from eba_stds_applications',
'where apex_app_id = :P19_APPLICATION_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2058257427808415134)
,p_name=>'P19_LINK_TYPE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(1998551522481434892)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select link_type',
'from eba_stds_standard_tests',
'where id = :P19_TEST_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2001559347809913610)
,p_computation_sequence=>10
,p_computation_item=>'P5_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select standard_id',
'from eba_stds_standard_tests',
'where id = :P19_TEST_ID'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(2001559542634915973)
,p_computation_sequence=>10
,p_computation_item=>'P5_STANDARD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.name',
'from eba_stds_standards s',
'where s.id = :P5_ID'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1998683119498788176)
,p_name=>'Refresh Report'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_SHOWONLY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1998683716778794073)
,p_event_id=>wwv_flow_api.id(1998683119498788176)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Just store the new value in session state.',
'null;'))
,p_attribute_02=>'P19_SHOWONLY'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1998683426018788185)
,p_event_id=>wwv_flow_api.id(1998683119498788176)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1998485347393348056)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(622671738014120619)
,p_name=>'Set Valid'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_VALIDATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_security_scheme=>wwv_flow_api.id(5057645559768553539)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(622671896558120620)
,p_event_id=>wwv_flow_api.id(622671738014120619)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if substr(:P19_VALIDATE,1,1) = ''+'' then',
'    merge into eba_stds_test_validations dest',
'        using ( select :P19_TEST_ID test_id,',
'                    :P19_APPLICATION_ID application_id,',
'                    substr(:P19_VALIDATE,2) result_identifier',
'                from dual ) src',
'        on ( dest.test_id = src.test_id',
'            and dest.application_id = src.application_id',
'            and dest.result_identifier = src.result_identifier',
'           )',
'    when matched then',
'        update set dest.false_positive_yn = ''Y''',
'    when not matched then',
'        insert ( test_id, application_id, result_identifier, false_positive_yn )',
'        values ( src.test_id, src.application_id, src.result_identifier, ''Y'' );',
'else',
'    update eba_stds_test_validations tv',
'    set tv.false_positive_yn = ''N''',
'    where tv.test_id = :P19_TEST_ID',
'        and tv.application_id = :P19_APPLICATION_ID',
'        and tv.result_identifier = substr(:P19_VALIDATE,2);',
'end if;'))
,p_attribute_02=>'P19_VALIDATE,P19_TEST_ID,P19_APPLICATION_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(622671983122120621)
,p_event_id=>wwv_flow_api.id(622671738014120619)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1998485347393348056)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1999282236729580018)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_collection varchar2(255) := ''EBA_STDS_P19_TEST_RESULTS'';',
'    l_names apex_application_global.vc_arr2;',
'    l_values apex_application_global.vc_arr2;',
'',
'    l_cursor    number;',
'    l_feedback  number;',
'    col_cnt     integer;',
'    l_rec_tab   dbms_sql.desc_tab;',
'    col_num     number;',
'    l_headers   varchar2(4000);',
'    l_cols      varchar2(4000);',
'begin',
'    l_headers := '':Status:Validation:'';',
'    -- The first three columns are special-cased.',
'    l_cols    := ''c002'';',
'',
'    -- If the collection already exists, we need to delete it; otherwise,',
'    -- create_collection_from_query_b will throw an error.',
'    if apex_collection.collection_exists( l_collection ) then',
'        apex_collection.delete_collection( l_collection );',
'    end if;',
'',
'    for c1 in ( select check_sql,',
'                    ltrim(app_bind_variable,'':'') app_bind_variable,',
'                    link_type',
'                from eba_stds_standard_tests',
'                where id = :P19_TEST_ID ) loop',
'        l_names := apex_util.string_to_table( c1.app_bind_variable );',
'        l_values := apex_util.string_to_table( :P19_APPLICATION_ID );',
'',
'        apex_collection.create_collection_from_query_b(',
'            p_collection_name => l_collection,',
'            p_query => c1.check_sql,',
'            p_names => l_names,',
'            p_values => l_values',
'        );',
'    ',
'        -- Now get the column headings and which columns to display.',
'        l_cursor := dbms_sql.open_cursor;',
'        dbms_sql.parse(l_cursor, c1.check_sql, dbms_sql.native);',
'        sys.dbms_sql.bind_variable( l_cursor, c1.app_bind_variable, :P19_APPLICATION_ID );',
'',
'        l_feedback := dbms_sql.execute(l_cursor);',
'',
'        dbms_sql.describe_columns(l_cursor, col_cnt, l_rec_tab);',
'',
'        for j in 3..col_cnt loop',
'            l_headers := l_headers||'':''||initcap(replace(l_rec_tab(j).col_name,''_'','' ''));',
'            l_cols    := l_cols||'':c0''||to_char(j,''fm00'');',
'        end loop;',
'        dbms_sql.close_cursor(l_cursor);',
'    end loop;',
'',
'    :P19_HEADINGS := l_headers;',
'    :P19_COLS := l_cols;',
'end;'))
,p_process_clob_language=>'PLSQL'
);
wwv_flow_api.component_end;
end;
/
