prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_api.id(3006115763271059427)
,p_name=>'Test Status'
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
,p_step_template=>wwv_flow_api.id(1851055474985326683)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(17282124412391192)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20220223141424'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(1275274822097514266)
,p_name=>'Test Status'
,p_template=>wwv_flow_api.id(1851082603972326722)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--removeHeader'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.name test_name,',
'    s.pass_fail_pct,',
'    case',
'        when s.pass_fail_pct is null then',
'            ''The query for this test is invalid.''',
'        when s.pass_fail_pct < 100 then',
'            t.failure_help_text',
'        else',
'            null',
'    end as message,',
'    t.id test_id,',
'    a.apex_app_id application_id,',
'    case',
'        when t.test_type != ''FAIL_REPORT'' then',
'            ''display: none;''',
'        else',
'            null',
'    end as report_link_class,',
'    case when t.test_type = ''PASS_FAIL'' then',
'        case when tv.false_positive_yn = ''Y'' then',
'            ''<a href="javascript:$s(''''P20_VALIDATE'''',''''-''||t.id||''.''||a.apex_app_id||'''''');" ''',
'                ||''class="t-Button t-Button--success t-Button--stretch">''',
'                ||''Marked as Valid</a>''',
'                ||''<div style="text-align:center">''||apex_util.get_since(tv.updated)',
'                ||'' by ''||apex_escape.html(tv.updated_by)||''</div>''',
'            when s.pass_fail_pct < 100',
'                and nvl(tv.false_positive_yn,''X'') <> ''Y'' then',
'                ''<a href="javascript:$s(''''P20_VALIDATE'''',''''+''||t.id||''.''||a.apex_app_id||'''''');" ''',
'                ||''class="t-Button t-Button--stretch">''',
'                ||''Mark as Valid</a>''',
'            else ''&nbsp;''',
'        end',
'        else',
'            ''<a href="''',
'                ||apex_util.prepare_url(''f?p=''||:APP_ID||'':19:''||:APP_SESSION',
'                    ||'':::19:P19_TEST_ID,P19_APPLICATION_ID:''||t.id||'',''||a.apex_app_id)',
'                ||''" class="t-Button t-Button--warning t-Button--stretch">View Report</a>''',
'    end as button_link',
'from eba_stds_standard_tests t,',
'    eba_stds_standard_statuses s,',
'    eba_stds_applications a,',
'    eba_stds_test_validations tv',
'where s.application_id = :P20_APPLICATION_ID',
'    and s.standard_id = :P20_ID',
'    and t.id = s.test_id',
'    and t.standard_id = s.standard_id',
'    and a.id = s.application_id',
'    and tv.test_id(+) = s.test_id',
'    and tv.application_id(+) = a.apex_app_id',
'    and tv.result_identifier(+) is null',
'order by t.display_sequence nulls last, lower(t.name)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P20_ID,P20_APPLICATION_ID'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(1851089214477326740)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_prn_output_show_link=>'Y'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1275275005837514271)
,p_query_column_id=>1
,p_column_alias=>'TEST_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Test Name'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1275275063310514276)
,p_query_column_id=>2
,p_column_alias=>'PASS_FAIL_PCT'
,p_column_display_sequence=>4
,p_column_heading=>'Completion'
,p_column_format=>'PCT_GRAPH::#5284C1:'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1275275177121514276)
,p_query_column_id=>3
,p_column_alias=>'MESSAGE'
,p_column_display_sequence=>2
,p_column_heading=>'Notes'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_lov_show_nulls=>'NO'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1275275332599514276)
,p_query_column_id=>4
,p_column_alias=>'TEST_ID'
,p_column_display_sequence=>6
,p_column_heading=>'Test ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1275275421955514276)
,p_query_column_id=>5
,p_column_alias=>'APPLICATION_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Application ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(1275275485307514279)
,p_query_column_id=>6
,p_column_alias=>'REPORT_LINK_CLASS'
,p_column_display_sequence=>5
,p_column_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:19:P19_TEST_ID,P19_APPLICATION_ID:#TEST_ID#,#APPLICATION_ID#'
,p_column_linktext=>'View'
,p_column_link_attr=>'class="t-Button t-Button--warning t-Button--stretch" style="#REPORT_LINK_CLASS#"'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(622672204069120623)
,p_query_column_id=>7
,p_column_alias=>'BUTTON_LINK'
,p_column_display_sequence=>7
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1275280688018514306)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1851068919125326699)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1275285817408514323)
,p_branch_name=>'Return to Standards Report'
,p_branch_action=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(622672297052120624)
,p_name=>'P20_VALIDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1275280688018514306)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1275280915586514307)
,p_name=>'P20_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1275280688018514306)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1275281105034514308)
,p_name=>'P20_APPLICATION_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1275280688018514306)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(623016100744767590)
,p_name=>'Set Valid'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P20_VALIDATE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_security_scheme=>wwv_flow_api.id(5057645559768553539)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(623016523359767607)
,p_event_id=>wwv_flow_api.id(623016100744767590)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_standard_id number;',
'    l_test_id     number;',
'    l_app_id      number;',
'begin',
'    l_standard_id := :P20_ID;',
'    l_test_id     := substr(:P20_VALIDATE,2,instr(:P20_VALIDATE,''.'')-2);',
'    l_app_id      := substr(:P20_VALIDATE,instr(:P20_VALIDATE,''.'')+1);',
'    ',
'    if substr(:P20_VALIDATE,1,1) = ''+'' then',
'        merge into eba_stds_test_validations dest',
'            using ( select l_test_id test_id,',
'                        l_app_id application_id',
'                    from dual ) src',
'            on ( dest.test_id = src.test_id',
'                and dest.application_id = src.application_id',
'                and dest.result_identifier is null',
'               )',
'        when matched then',
'            update set dest.false_positive_yn = ''Y''',
'        when not matched then',
'            insert ( test_id, application_id, result_identifier, false_positive_yn )',
'            values ( src.test_id, src.application_id, null, ''Y'' );',
'    else',
'        update eba_stds_test_validations tv',
'        set tv.false_positive_yn = ''N''',
'        where tv.test_id = l_test_id',
'            and tv.application_id = l_app_id',
'            and tv.result_identifier is null;',
'    end if;',
'',
'    delete from eba_stds_standard_statuses',
'    where standard_id = l_standard_id',
'        and test_id = l_test_id;',
'',
'    eba_stds_parser.update_standard_status();',
'end;'))
,p_attribute_02=>'P20_VALIDATE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(623016964698767610)
,p_event_id=>wwv_flow_api.id(623016100744767590)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(1275274822097514266)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1275283050819514315)
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
,p_security_scheme=>wwv_flow_api.id(5057645559768553539)
);
wwv_flow_api.component_end;
end;
/
