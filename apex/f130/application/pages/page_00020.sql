prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(5500009558737435667)
,p_name=>'Test Status'
,p_alias=>'TEST-STATUS'
,p_page_mode=>'MODAL'
,p_step_title=>'Test Status'
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
,p_step_template=>wwv_flow_api.id(4344949270451702923)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'HAYHUDSO'
,p_last_upd_yyyymmddhh24miss=>'20220318183042'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2934501070330125159)
,p_plug_name=>'{buttons}'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4344962846698702941)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3769168617563890506)
,p_plug_name=>'Test Status'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(4344975892605702957)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_plug_source=>'return eba_stds_parser.test_status_sql;'
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P20_ID,P20_APPLICATION_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_output_show_link=>'Y'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Test Status'
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
 p_id=>wwv_flow_api.id(2922113316480325206)
,p_max_row_count=>'1000000'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_owner=>'HAYHUDSO'
,p_internal_uid=>2903405275377113750
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932388835296203657)
,p_db_column_name=>'TEST_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Test Name'
,p_column_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RR,19:P19_TEST_ID,P19_TEST_NAME,P19_APPLICATION_ID:#TEST_ID#,#TEST_NAME#,#APPLICATION_ID#'
,p_column_linktext=>'#TEST_NAME#'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932388848134203658)
,p_db_column_name=>'PASS_FAIL_PCT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Pass Fail %'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_format_mask=>'PCT_GRAPH:#E01631:#378063:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932389640153203665)
,p_db_column_name=>'VALIDATION_JAVASCRIPT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'&nbsp'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button type="button" class="t-Button t-Button--icon t-Button--#VALIDATION_STYLE# t-Button--iconLeft #VALIDATION_SHOW_HIDE#" onclick="#VALIDATION_JAVASCRIPT#">',
'    #VALIDATION_BUTTON_MESSAGE#',
'</button>'))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932389055846203660)
,p_db_column_name=>'TEST_ID'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'Test Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932389486304203664)
,p_db_column_name=>'VALIDATION_BUTTON_MESSAGE'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Validation Button Message'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932389037071203659)
,p_db_column_name=>'MESSAGE'
,p_display_order=>120
,p_column_identifier=>'C'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932389236591203661)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>130
,p_column_identifier=>'E'
,p_column_label=>'Application Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932389758326203667)
,p_db_column_name=>'VALIDATION_SHOW_HIDE'
,p_display_order=>160
,p_column_identifier=>'K'
,p_column_label=>'Validation Show Hide'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(2932389879147203668)
,p_db_column_name=>'VALIDATION_STYLE'
,p_display_order=>170
,p_column_identifier=>'L'
,p_column_label=>'Validation Style'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(2932400434321209758)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'29136924'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TEST_NAME:PASS_FAIL_PCT:MESSAGE:TEST_ID:APPLICATION_ID:VALIDATION_BUTTON_MESSAGE:VALIDATION_JAVASCRIPT:VALIDATION_SHOW_HIDE:VALIDATION_STYLE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3769174483484890546)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4344962714591702939)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2934501181370125160)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(2934501070330125159)
,p_button_name=>'Done'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4344994064221703017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Done'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(3769179612874890563)
,p_branch_name=>'Return to Standards Report'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3116566092518496864)
,p_name=>'P20_VALIDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(3769174483484890546)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3769174711052890547)
,p_name=>'P20_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3769174483484890546)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3769174900500890548)
,p_name=>'P20_APPLICATION_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3769174483484890546)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3116909896211143830)
,p_name=>'Set Valid'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_VALIDATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_security_scheme=>wwv_flow_api.id(7551539355234929779)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3116910318826143847)
,p_event_id=>wwv_flow_api.id(3116909896211143830)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_stds_parser.assert_exception (',
'                p_result_identifier => :P20_VALIDATE',
'                );'))
,p_attribute_02=>'P20_VALIDATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3116910760165143850)
,p_event_id=>wwv_flow_api.id(3116909896211143830)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(3769168617563890506)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2934501327785125161)
,p_name=>'close dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2934501181370125160)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2934501416665125162)
,p_event_id=>wwv_flow_api.id(2934501327785125161)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3769176846285890555)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Standard'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_stds_standards',
'where id = :P20_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Standard deleted.'
,p_security_scheme=>wwv_flow_api.id(7551539355234929779)
);
wwv_flow_api.component_end;
end;
/
