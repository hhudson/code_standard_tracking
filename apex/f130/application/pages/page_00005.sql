prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(5518741433308135589)
,p_name=>'&P5_STANDARD.'
,p_alias=>'STANDARD2'
,p_step_title=>'&P5_STANDARD.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#AVG_DURATION {white-space: nowrap;}',
'.check_sql {',
'white-space: pre;',
'font-family: monospace;',
'font-size: 10px;',
'line-height: 14px;',
'}',
'section.uModalRegion.ui-dialog-content {',
'    padding: 0;',
'}',
'section.uModalRegion.ui-dialog-content>div.uRegionContent {',
'    padding: 0 !important;',
'}'))
,p_step_template=>wwv_flow_api.id(4363677617432402842)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this page to define a standard and the automated tests which help indicate whether or not the standard has been implemented in each relevant application.</p>',
'',
'<p>Once a standard has at least one automated test, the status column of the applications section indicates the percentage of the automated test(s) each associated application passes.</p>'))
,p_last_updated_by=>'HAYHUDSO'
,p_last_upd_yyyymmddhh24miss=>'20220318212614'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4196556253720563679)
,p_plug_name=>'Region Display Selector'
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_translate_title=>'N'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4196556337135563680)
,p_plug_name=>'Applications'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(4363708274009402884)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2951124567604903618)
,p_plug_name=>'Applications Pass/Fail Report'
,p_parent_plug_id=>wwv_flow_api.id(4196556337135563680)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363707767176402879)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'V_EBA_STDS_APPLICATION_TEST_PASS_FAIL'
,p_query_where=>'standard_id = :P5_ID'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Applications Pass/Fail Report'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(2951124687586903619)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'HAYHUDSO'
,p_internal_uid=>2913684771912992241
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951124810424903620)
,p_db_column_name=>'STANDARD_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Standard ID'
,p_column_type=>'NUMBER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951125319724903626)
,p_db_column_name=>'TEST_ID'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Link'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951124885920903621)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Link'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951124941285903622)
,p_db_column_name=>'APEX_APP_ID'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Application ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951125066926903623)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Application Name'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RR,20:P20_ID,P20_APPLICATION_ID:#STANDARD_ID#,#APPLICATION_ID#'
,p_column_linktext=>'#APPLICATION_NAME#'
,p_column_link_attr=>'class="t-Button t-Button--stretch"'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951125140474903624)
,p_db_column_name=>'APPLICATION_TYPE'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Application Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951125290995903625)
,p_db_column_name=>'LAST_UPDATED_ON'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Last Updated On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951125421329903627)
,p_db_column_name=>'TEST_NAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Test Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2951125565010903628)
,p_db_column_name=>'PASS_FAIL_PCT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Pass Fail %'
,p_column_html_expression=>'#PASS_FAIL_PCT# %'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2953232783292825079)
,p_db_column_name=>'FALSE_POSITIVE_YN'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'False Positive'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(7248859036908642146)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2953232844214825080)
,p_db_column_name=>'LEGACY_YN'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Legacy'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_api.id(7248859036908642146)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2953223272870259844)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'29157834'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'APPLICATION_NAME:APPLICATION_TYPE:TEST_NAME:PASS_FAIL_PCT:APEX_APP_ID:'
,p_sort_column_1=>'APPLICATION_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PASS_FAIL_PCT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'APEX_APP_ID:0:0:0:0:0'
,p_break_enabled_on=>'APEX_APP_ID:0:0:0:0:0'
);
wwv_flow_api.create_worksheet_group_by(
 p_id=>wwv_flow_api.id(2953427599571039858)
,p_report_id=>wwv_flow_api.id(2953223272870259844)
,p_group_by_columns=>'APPLICATION_NAME:APPLICATION_TYPE'
,p_function_01=>'AVG'
,p_function_column_01=>'PASS_FAIL_PCT'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'N'
,p_sort_column_01=>'APEX_APP_ID'
,p_sort_direction_01=>'ASC'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4362612611327085541)
,p_name=>'Applications'
,p_region_name=>'applications_region'
,p_parent_plug_id=>wwv_flow_api.id(4196556337135563680)
,p_template=>wwv_flow_api.id(4363708274009402884)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select application_id,',
'    apex_app_id,',
'    application_name,',
'    application_type,',
'    last_updated_on,',
'    status,',
'    null link_col2',
'from (  select na.id application_id,',
'            na.apex_app_id,',
'            na.apex_app_id||''. ''||aa.application_name application_name,',
'            nt.name application_type,',
'            aa.last_updated_on,',
'            ( select floor(avg(ss.pass_fail_pct))',
'                  from eba_stds_standard_statuses ss',
'                  where ss.application_id = na.id',
'                      and ss.standard_id = nf.id',
'                      and ss.test_id = nvl(:P5_TEST_ID,ss.test_id) ) status',
'        from eba_stds_standards nf,',
'            eba_stds_standard_type_ref nftr,',
'            eba_stds_applications na,',
'            eba_stds_types nt,',
'            apex_applications aa',
'        where nf.id = :P5_ID',
'            and nftr.type_id = na.type_id',
'            and nt.id = na.type_id ',
'            and nf.id = nftr.standard_id',
'            and aa.application_id = na.apex_app_id',
'            and nt.id = nvl(:P5_APPLICATION_TYPE,nt.id)',
'    )',
'where ( :P5_COMPLETION is null',
'        or (:P5_COMPLETION = ''I'' and status = 100 )',
'        or (:P5_COMPLETION = ''O'' and status < 100 )',
'    )',
'order by apex_app_id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P5_TEST_ID,P5_COMPLETION,P5_APPLICATION_TYPE'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4363714884514402902)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No relevant applications found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
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
,p_required_patch=>wwv_flow_api.id(2948030080990331716)
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4362616226771153147)
,p_query_column_id=>1
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>1
,p_column_heading=>'Application ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4362620312500205359)
,p_query_column_id=>2
,p_column_alias=>'APEX_APP_ID'
,p_column_display_sequence=>2
,p_column_heading=>'Apex App Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4362616321477153147)
,p_query_column_id=>3
,p_column_alias=>'APPLICATION_NAME'
,p_column_display_sequence=>3
,p_column_heading=>'Application'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,34:P34_ID:#APPLICATION_ID#'
,p_column_linktext=>'#APPLICATION_NAME#'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4362616421780153147)
,p_query_column_id=>4
,p_column_alias=>'APPLICATION_TYPE'
,p_column_display_sequence=>4
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4362616532784153147)
,p_query_column_id=>5
,p_column_alias=>'LAST_UPDATED_ON'
,p_column_display_sequence=>5
,p_column_heading=>'Last Updated'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4362613227487085549)
,p_query_column_id=>6
,p_column_alias=>'STATUS'
,p_column_display_sequence=>6
,p_column_heading=>'Status'
,p_column_format=>'PCT_GRAPH:#E2ECF8:#5284C1:'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_stds_standard_tests st',
'where st.standard_id = :P5_ID'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(3743114089919634980)
,p_query_column_id=>7
,p_column_alias=>'LINK_COL2'
,p_column_display_sequence=>7
,p_column_heading=>'<span class="visuallyhidden">Actions</span>'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP:P20_ID,P20_APPLICATION_ID:&P5_ID.,#APPLICATION_ID#:'
,p_column_linktext=>'View'
,p_column_link_attr=>'class="t-Button t-Button--warning t-Button--stretch"'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4512111203317025285)
,p_plug_name=>'Filter Options'
,p_parent_plug_id=>wwv_flow_api.id(4196556337135563680)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4363694721269402863)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_required_patch=>wwv_flow_api.id(2948030080990331716)
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4351492024277324446)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363694721269402863)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4351492619068324447)
,p_plug_name=>'Automated Tests'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363707767176402879)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'V_EBA_STDS_STANDARD_TESTS'
,p_query_where=>'standard_id = :P5_ID'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Automated Tests'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(2940841699482025093)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_detail_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="Edit Test Link">'
,p_owner=>'HAYHUDSO'
,p_internal_uid=>2903401783808113715
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940841732890025094)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940841892338025095)
,p_db_column_name=>'DISPLAY_SEQUENCE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Display Sequence'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940841994715025096)
,p_db_column_name=>'NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940842071590025097)
,p_db_column_name=>'QUERY_VIEW'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Query View'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940842248792025099)
,p_db_column_name=>'FAILURE_HELP_TEXT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Help Text'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940842337524025100)
,p_db_column_name=>'TEST_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Test Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940842458678025101)
,p_db_column_name=>'AVG_DURATION'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Avg Duration'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2940842525674025102)
,p_db_column_name=>'STANDARD_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Cross-Application Report'
,p_column_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RR,19:P19_TEST_ID,P19_TEST_NAME:#ID#,#NAME#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2942935718456726946)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'29054959'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:FAILURE_HELP_TEXT:QUERY_VIEW:TEST_TYPE:AVG_DURATION:STANDARD_ID'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4351493229677324448)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363694589162402861)
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
 p_id=>wwv_flow_api.id(4351494017530324454)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4363694589162402861)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'PAGE_5_ABOUT'
,p_attribute_12=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4351494228128324455)
,p_name=>'Standard'
,p_template=>wwv_flow_api.id(4363694589162402861)
,p_display_sequence=>20
,p_region_css_classes=>'flex_standards'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select std.id,',
'    std.name standard,',
'    std.description,',
'    std.primary_developer,',
'    std.date_started,',
'    std.created,',
'    std.created_by,',
'    t.types,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_01'',std.standards_flex_01) standards_flex_01,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_02'',std.standards_flex_02) standards_flex_02,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_03'',std.standards_flex_03) standards_flex_03,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_04'',std.standards_flex_04) standards_flex_04,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_05'',std.standards_flex_05) standards_flex_05,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_06'',std.standards_flex_06) standards_flex_06,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_07'',std.standards_flex_07) standards_flex_07,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_08'',std.standards_flex_08) standards_flex_08,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N01'',std.standards_flex_n01) standards_flex_n01,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N02'',std.standards_flex_n02) standards_flex_n02,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N03'',std.standards_flex_n03) standards_flex_n03,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N04'',std.standards_flex_n04) standards_flex_n04,',
'    std.standards_flex_d01,',
'    std.standards_flex_d02,',
'    std.standards_flex_d03,',
'    std.standards_flex_d04,',
'    std.standards_flex_clob',
'from eba_stds_standards std,',
'    ( select fr.standard_id,',
'          listagg( tp.name, '','' ) within group ( order by lower(tp.name) ) types',
'      from eba_stds_standard_type_ref fr,',
'          eba_stds_types tp',
'      where tp.id = fr.type_id',
'      group by fr.standard_id ) t',
'where t.standard_id(+) = std.id',
'    and std.id = :P5_ID'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4363716801703402905)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
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
 p_id=>wwv_flow_api.id(4351494515566324455)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>2
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4351498127447336492)
,p_query_column_id=>2
,p_column_alias=>'STANDARD'
,p_column_display_sequence=>4
,p_column_heading=>'Standard'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4351498214767336492)
,p_query_column_id=>3
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>5
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4351498413459336493)
,p_query_column_id=>4
,p_column_alias=>'PRIMARY_DEVELOPER'
,p_column_display_sequence=>6
,p_column_heading=>'Primary Developer'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4351498603677336493)
,p_query_column_id=>5
,p_column_alias=>'DATE_STARTED'
,p_column_display_sequence=>7
,p_column_heading=>'Started'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4351494907811324455)
,p_query_column_id=>6
,p_column_alias=>'CREATED'
,p_column_display_sequence=>1
,p_column_heading=>'Created'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4351495011583324455)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>3
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4351498825245336493)
,p_query_column_id=>8
,p_column_alias=>'TYPES'
,p_column_display_sequence=>8
,p_column_heading=>'Types'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204688400029432191)
,p_query_column_id=>9
,p_column_alias=>'STANDARDS_FLEX_01'
,p_column_display_sequence=>9
,p_column_heading=>'Standards flex 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204688437400432192)
,p_query_column_id=>10
,p_column_alias=>'STANDARDS_FLEX_02'
,p_column_display_sequence=>10
,p_column_heading=>'Standards flex 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204688595151432193)
,p_query_column_id=>11
,p_column_alias=>'STANDARDS_FLEX_03'
,p_column_display_sequence=>11
,p_column_heading=>'Standards flex 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204688618929432194)
,p_query_column_id=>12
,p_column_alias=>'STANDARDS_FLEX_04'
,p_column_display_sequence=>12
,p_column_heading=>'Standards flex 04'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204688802444432195)
,p_query_column_id=>13
,p_column_alias=>'STANDARDS_FLEX_05'
,p_column_display_sequence=>13
,p_column_heading=>'Standards flex 05'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204688861106432196)
,p_query_column_id=>14
,p_column_alias=>'STANDARDS_FLEX_06'
,p_column_display_sequence=>14
,p_column_heading=>'Standards flex 06'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204688933769432197)
,p_query_column_id=>15
,p_column_alias=>'STANDARDS_FLEX_07'
,p_column_display_sequence=>15
,p_column_heading=>'Standards flex 07'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689022137432198)
,p_query_column_id=>16
,p_column_alias=>'STANDARDS_FLEX_08'
,p_column_display_sequence=>16
,p_column_heading=>'Standards flex 08'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689135322432199)
,p_query_column_id=>17
,p_column_alias=>'STANDARDS_FLEX_N01'
,p_column_display_sequence=>17
,p_column_heading=>'Standards flex n01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689291665432200)
,p_query_column_id=>18
,p_column_alias=>'STANDARDS_FLEX_N02'
,p_column_display_sequence=>18
,p_column_heading=>'Standards flex n02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689388805432201)
,p_query_column_id=>19
,p_column_alias=>'STANDARDS_FLEX_N03'
,p_column_display_sequence=>19
,p_column_heading=>'Standards flex n03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689502064432202)
,p_query_column_id=>20
,p_column_alias=>'STANDARDS_FLEX_N04'
,p_column_display_sequence=>20
,p_column_heading=>'Standards flex n04'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689532338432203)
,p_query_column_id=>21
,p_column_alias=>'STANDARDS_FLEX_D01'
,p_column_display_sequence=>21
,p_column_heading=>'Standards flex d01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689606408432204)
,p_query_column_id=>22
,p_column_alias=>'STANDARDS_FLEX_D02'
,p_column_display_sequence=>22
,p_column_heading=>'Standards flex d02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689730889432205)
,p_query_column_id=>23
,p_column_alias=>'STANDARDS_FLEX_D03'
,p_column_display_sequence=>23
,p_column_heading=>'Standards flex d03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689823861432206)
,p_query_column_id=>24
,p_column_alias=>'STANDARDS_FLEX_D04'
,p_column_display_sequence=>24
,p_column_heading=>'Standards flex d04'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4204689959404432207)
,p_query_column_id=>25
,p_column_alias=>'STANDARDS_FLEX_CLOB'
,p_column_display_sequence=>25
,p_column_heading=>'Standards flex clob'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4351496720109324464)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363710734113402889)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(8774575671518206136)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(4363726108926402940)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4370028930490923942)
,p_plug_name=>'Started'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4363708274009402884)
,p_plug_display_sequence=>140
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select date_started, ''Standard Started'' lbl',
'from eba_stds_standards',
'where id = :P5_ID'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.MINICALENDAR'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'DATE_STARTED'
,p_attribute_02=>'LBL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3660415843005518418)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4351492024277324446)
,p_button_name=>'Export'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Export'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:700:&SESSION.::&DEBUG.:RP:P700_STANDARD_ID:&P5_ID.'
,p_button_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4368528534232958931)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(4351492024277324446)
,p_button_name=>'FORCE_TEST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Run All Tests'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4351492207315324447)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4351496720109324464)
,p_button_name=>'EDIT_STANDARD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Edit Standard'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11:P11_ID:&P5_ID.'
,p_security_scheme=>wwv_flow_api.id(7570271229805629701)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4445805609925474326)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4351496720109324464)
,p_button_name=>'CREATE_TEST_TOP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Test'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_STANDARD_ID:&P5_ID.'
,p_security_scheme=>wwv_flow_api.id(7570271229805629701)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4352738626383379659)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4351492619068324447)
,p_button_name=>'CREATE_TEST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_api.id(4363725256240402933)
,p_button_image_alt=>'Create Test'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:14:P14_STANDARD_ID:&P5_ID.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_api.id(7570271229805629701)
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4984404601763608706)
,p_branch_name=>'Reload Current Page'
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4368528534232958931)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4351493423602324448)
,p_name=>'P5_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4351493229677324448)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4362620032772195920)
,p_name=>'P5_APPLICATION_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4351493229677324448)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4445806588359484333)
,p_name=>'P5_STANDARD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4351493229677324448)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4512110797991016255)
,p_name=>'P5_TEST_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4512111203317025285)
,p_prompt=>'Show Only'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from eba_stds_standard_tests',
'where standard_id = :P5_ID',
'order by display_sequence, name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Tests -'
,p_cHeight=>1
,p_tag_css_classes=>'filter_input'
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4512122699242334747)
,p_name=>'P5_COMPLETION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4512111203317025285)
,p_prompt=>'Application Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Non-Passing;O,Passing;I'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Applications -'
,p_cHeight=>1
,p_tag_css_classes=>'filter_input'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4512126790972429824)
,p_name=>'P5_APPLICATION_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4512111203317025285)
,p_prompt=>'Application Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select at.name d, at.id r',
'from eba_stds_types at,',
'    eba_stds_standard_type_ref tr',
'where tr.standard_id = :P5_ID',
'    and at.id = tr.type_id',
'order by upper(at.name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Types -'
,p_cHeight=>1
,p_tag_css_classes=>'filter_input'
,p_begin_on_new_line=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in ( select count(*) cnt',
'                from eba_stds_types at,',
'                    eba_stds_standard_type_ref tr',
'                where tr.standard_id = :P5_ID',
'                    and at.id = tr.type_id',
'                ) loop',
'        if c1.cnt > 1 then',
'            return true;',
'        end if;',
'    end loop;',
'    return false;',
'end;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4445806812716488138)
,p_computation_sequence=>10
,p_computation_item=>'P5_STANDARD'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.name',
'from eba_stds_standards s',
'where s.id = :P5_ID'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4511118812853764896)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_PAGE_ID'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4368529022589965052)
,p_name=>'Re-test All Applications'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4368528534232958931)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4368529311318965055)
,p_event_id=>wwv_flow_api.id(4368529022589965052)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_stds_standard_statuses',
'where standard_id = :P5_ID;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4368529535429968290)
,p_event_id=>wwv_flow_api.id(4368529022589965052)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'FORCE_TEST'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4512112311890046699)
,p_name=>'Apply Filter'
,p_event_sequence=>40
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.filter_input'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4512112591416046703)
,p_event_id=>wwv_flow_api.id(4512112311890046699)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4362612611327085541)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5122102970120997799)
,p_name=>'Reset Test ID'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_stds_standard_tests',
'where standard_id = :P5_ID',
'    and id = :P5_TEST_ID'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5122103104501997800)
,p_event_id=>wwv_flow_api.id(5122102970120997799)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P5_TEST_ID'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2953233344944825085)
,p_name=>'refresh on dialog close'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(2951124567604903618)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2953233421976825086)
,p_event_id=>wwv_flow_api.id(2953233344944825085)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(2951124567604903618)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4984404652198608707)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>'null;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4368528534232958931)
,p_process_success_message=>'All tests re-ran successfully.'
);
wwv_flow_api.component_end;
end;
/
