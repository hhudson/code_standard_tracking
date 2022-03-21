prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
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
 p_id=>31
,p_user_interface_id=>wwv_flow_api.id(5500009558737435667)
,p_name=>'Notification'
,p_alias=>'NOTIFICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Notification'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(7551626274569860288)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7551538863461929768)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7299650877354331258)
,p_plug_name=>'Notification'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4344962714591702939)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(7383009454532923886)
,p_name=>'Existing Notifications'
,p_parent_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_template=>wwv_flow_api.id(4344973151086702954)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    notification_name,',
'    notification_type,',
'    display_sequence,',
'    display_from,',
'    display_until,',
'    created',
'from',
'    eba_stds_notifications',
'order by',
'    updated'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4344983009943702980)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
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
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7383009756454923887)
,p_query_column_id=>1
,p_column_alias=>'NOTIFICATION_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Notification'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7383009872342923888)
,p_query_column_id=>2
,p_column_alias=>'NOTIFICATION_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7383009967814923888)
,p_query_column_id=>3
,p_column_alias=>'DISPLAY_SEQUENCE'
,p_column_display_sequence=>3
,p_column_heading=>'Display Sequence'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7383010069721923889)
,p_query_column_id=>4
,p_column_alias=>'DISPLAY_FROM'
,p_column_display_sequence=>4
,p_column_heading=>'Display From'
,p_use_as_row_header=>'N'
,p_column_format=>'&APP_DATE_TIME_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7383010172854923889)
,p_query_column_id=>5
,p_column_alias=>'DISPLAY_UNTIL'
,p_column_display_sequence=>5
,p_column_heading=>'Display Until'
,p_use_as_row_header=>'N'
,p_column_format=>'&APP_DATE_TIME_FORMAT.'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(7383010276933923889)
,p_query_column_id=>6
,p_column_alias=>'CREATED'
,p_column_display_sequence=>6
,p_column_heading=>'Created'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7299653473613331275)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4344962846698702941)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7299651280892331261)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7299653473613331275)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4344994064221703017)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7299651461996331261)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7299653473613331275)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(4344994064221703017)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P31_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7299651664978331261)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7299653473613331275)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4344994064221703017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P31_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7299651071836331259)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(7299653473613331275)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4344994064221703017)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Notification'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P31_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299651862639331261)
,p_name=>'P31_DISPLAY_SEQUENCE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display Sequence'
,p_source=>'DISPLAY_SEQUENCE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>8
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(3183021159883244229)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299652080889331269)
,p_name=>'P31_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299652250823331270)
,p_name=>'P31_NOTIFICATION_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notification Name'
,p_source=>'NOTIFICATION_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(3183020866245244229)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299652451810331270)
,p_name=>'P31_NOTIFICATION_DESCRIPTION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Notification Description'
,p_source=>'NOTIFICATION_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(3183021159883244229)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299652657528331270)
,p_name=>'P31_NOTIFICATION_TYPE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_use_cache_before_default=>'NO'
,p_item_default=>'YELLOW'
,p_prompt=>'Notification Type'
,p_source=>'NOTIFICATION_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NOTIFICATION TYPE'
,p_lov=>'.'||wwv_flow_api.id(7299655063887331282)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(3183020866245244229)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299653069628331270)
,p_name=>'P31_DISPLAY_FROM'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display From'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_source=>'DISPLAY_FROM'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(3183021159883244229)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7299653257362331275)
,p_name=>'P31_DISPLAY_UNTIL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(7299650877354331258)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Display Until'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_source=>'DISPLAY_UNTIL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(3183021159883244229)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7299653977443331277)
,p_validation_name=>'P31_DISPLAY_FROM must be timestamp'
,p_validation_sequence=>10
,p_validation=>'P31_DISPLAY_FROM'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(7299653069628331270)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7299654173500331279)
,p_validation_name=>'P31_DISPLAY_UNTIL must be timestamp'
,p_validation_sequence=>20
,p_validation=>'P31_DISPLAY_UNTIL'
,p_validation_type=>'ITEM_IS_TIMESTAMP'
,p_error_message=>'#LABEL# must be a valid timestamp.'
,p_associated_item=>wwv_flow_api.id(7299653257362331275)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(4427300633109659133)
,p_validation_name=>'P31_DISPLAY_UNTIL after FROM'
,p_validation_sequence=>30
,p_validation=>'to_date(:P31_DISPLAY_UNTIL,:APP_DATE_TIME_FORMAT) > to_date(:P31_DISPLAY_FROM,:APP_DATE_TIME_FORMAT)'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'End date must be after the start date.'
,p_associated_item=>wwv_flow_api.id(7299653257362331275)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3025020703186305460)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7299651280892331261)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3025020809575305461)
,p_event_id=>wwv_flow_api.id(3025020703186305460)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7299654278490331279)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_STDS_NOTIFICATIONS'
,p_attribute_02=>'EBA_STDS_NOTIFICATIONS'
,p_attribute_03=>'P31_ID'
,p_attribute_04=>'ID'
,p_attribute_07=>'ROW_VERSION_NUMBER'
,p_attribute_11=>'I:U:D'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7299654480135331280)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_STDS_NOTIFICATIONS'
,p_attribute_02=>'EBA_STDS_NOTIFICATIONS'
,p_attribute_03=>'P31_ID'
,p_attribute_04=>'ID'
,p_attribute_07=>'ROW_VERSION_NUMBER'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_api.id(7551539355234929779)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7299654656248331280)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(7299651461996331261)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3025020369202305457)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
