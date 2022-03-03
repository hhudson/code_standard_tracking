prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(3006115763271059427)
,p_name=>'Automated Test'
,p_page_mode=>'MODAL'
,p_step_title=>'Automated Test'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(1851065608201326694)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(5057645559768553539)
,p_protection_level=>'C'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20220303204423'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1371494580324267849)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(1851069051232326701)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1840106239692290084)
,p_plug_name=>'Automated Test'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(1851082603972326722)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'TABLE'
,p_query_table=>'EBA_STDS_STANDARD_TESTS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1925627652797241431)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1851068919125326699)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Automated tests are SQL queries which test specific parts of applications for compliance. "Pass/Fail" tests should return a single value (Y or N) to indicate whether an application meets the requirements of the test or not. "Report" tests should r'
||'eturn a Y or an N in the first column for each record; the second column should be used for the ID column of the component being linked to; all other columns will be displayed in the report.</p>',
'<p>The application ID will be used in the place of the Application Bind Variable parameter.</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1873427687317836521)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1371494580324267849)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1851100268755326777)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1840106635561290084)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(1371494580324267849)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(1851100268755326777)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1840106544658290084)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(1371494580324267849)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(1851100268755326777)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1840106450559290084)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(1371494580324267849)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(1851100268755326777)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1840107444966290087)
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1840107665397290091)
,p_name=>'P14_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1840107850071290105)
,p_name=>'P14_STANDARD_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_source=>'STANDARD_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1840108046425290106)
,p_name=>'P14_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>64
,p_field_template=>wwv_flow_api.id(1851099516756326769)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1840108240015290107)
,p_name=>'P14_CHECK_SQL'
,p_source_data_type=>'CLOB'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_prompt=>'Check SQL'
,p_source=>'CHECK_SQL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'PLUGIN_COM.APEXBYG.BLOGSPOT.CODEMIRROR'
,p_field_template=>wwv_flow_api.id(1851099516756326769)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select case when [test] then ''Y'' else ''N'' end pass_fail,',
'    item_id,',
'    page_id||''. ''||page_name page,',
'    region,',
'    item_name,',
'    ....',
'from [data dictionary]',
'where application_id = :APP_ID',
'    and ...',
'</pre>'))
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1840108434872290107)
,p_name=>'P14_APP_BIND_VARIABLE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_item_default=>':APP_ID'
,p_prompt=>'Application Bind Variable'
,p_source=>'APP_BIND_VARIABLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>wwv_flow_api.id(1851099516756326769)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1840108652870290107)
,p_name=>'P14_FAILURE_HELP_TEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Help Text'
,p_source=>'FAILURE_HELP_TEXT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_field_template=>wwv_flow_api.id(1851099389577326767)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1840125436874431320)
,p_name=>'P14_STANDARD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Standard'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name',
'from eba_stds_standards',
'where id = :P14_STANDARD_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'STANDARDS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name d, id r',
'from eba_stds_standards'))
,p_field_template=>wwv_flow_api.id(1851099389577326767)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1849983454435986925)
,p_name=>'P14_DISPLAY_SEQUENCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_seq number;',
'begin',
'    select max(display_sequence) into l_seq',
'    from eba_stds_standard_tests',
'    where standard_id = :P14_STANDARD_ID;',
'',
'    return 10 + nvl(l_seq,0);',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source=>'DISPLAY_SEQUENCE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998496028268817014)
,p_name=>'P14_TEST_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_item_default=>'FAIL_REPORT'
,p_prompt=>'Type'
,p_source=>'TEST_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TEST TYPES'
,p_lov=>'.'||wwv_flow_api.id(1998428245996620369)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1851099516756326769)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(1998565040324491952)
,p_name=>'P14_TEST_LINK_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_item_source_plug_id=>wwv_flow_api.id(1840106239692290084)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Link to'
,p_source=>'LINK_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TEST LINK TYPES'
,p_lov=>'.'||wwv_flow_api.id(1998562715900483307)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- No Link -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1851099389577326767)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(1933212521888059771)
,p_computation_sequence=>10
,p_computation_item=>'P14_APP_BIND_VARIABLE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return '':''||:P14_APP_BIND_VARIABLE;'
,p_compute_when=>':P14_APP_BIND_VARIABLE not like '':%'''
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1933211941525035537)
,p_validation_name=>'P14_CHECK_SQL valid SQL'
,p_validation_sequence=>10
,p_validation=>'return eba_stds_parser.is_valid_query( :P14_CHECK_SQL );'
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_api.id(1840108240015290107)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(1933212120606045188)
,p_validation_name=>'P14_APP_BIND_VARIABLE in Query'
,p_validation_sequence=>20
,p_validation=>'instr(:P14_CHECK_SQL, :P14_APP_BIND_VARIABLE) > 0'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'#LABEL# must be used in the validation query.'
,p_associated_item=>wwv_flow_api.id(1840108434872290107)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1998565631961497338)
,p_name=>'Show/Hide Link Type'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_TEST_TYPE'
,p_condition_element=>'P14_TEST_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'FAIL_REPORT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1998565920544497344)
,p_event_id=>wwv_flow_api.id(1998565631961497338)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_TEST_LINK_TYPE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1998566141710497344)
,p_event_id=>wwv_flow_api.id(1998565631961497338)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_TEST_LINK_TYPE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(622674696148120648)
,p_name=>'Cancel Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1873427687317836521)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(622674804295120649)
,p_event_id=>wwv_flow_api.id(622674696148120648)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1840109036755290108)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_region_id=>wwv_flow_api.id(1840106239692290084)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Fetch Row from EBA_STDS_STANDARD_TESTS'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1840109250099290109)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(1840106239692290084)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process Row of EBA_STDS_STANDARD_TESTS'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1857744150750883090)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Force Re-testing of Standard'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_stds_standard_statuses',
'where standard_id = :P14_STANDARD_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1840109458570290109)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(1840106635561290084)
);
wwv_flow_api.component_end;
end;
/
