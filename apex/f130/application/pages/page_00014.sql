prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2953977059365452042
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(5537554757292547194)
,p_name=>'Automated Test'
,p_alias=>'AUTOMATED-TEST'
,p_page_mode=>'MODAL'
,p_step_title=>'Automated Test'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(4382504602222814461)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7589084553790041306)
,p_protection_level=>'C'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20220323143342'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3902933574345755616)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4382508045253814468)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4371545233713777851)
,p_plug_name=>'Automated Test'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_api.id(4382521597993814489)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4457066646818729198)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4382507913146814466)
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
 p_id=>wwv_flow_api.id(4404866681339324288)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(3902933574345755616)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4382539262776814544)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4371545629582777851)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(3902933574345755616)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4382539262776814544)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4371545538679777851)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(3902933574345755616)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4382539262776814544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4371545444580777851)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(3902933574345755616)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4382539262776814544)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P14_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4371546438987777854)
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2954125880178994926)
,p_name=>'P14_QUERY_VIEW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_use_cache_before_default=>'NO'
,p_prompt=>'View that evaluates the test'
,p_source=>'QUERY_VIEW'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'STANDARD TRACKER VIEWS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select view_name d, view_name r',
'from user_views',
'--where view_name in (select table_name',
'--                    from all_tab_cols',
'--                    where column_name = ''REFERENCE_CODE'')',
'order by view_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Not Applicable'
,p_field_template=>wwv_flow_api.id(3220566064800355756)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    You are required to create view database objects to define your test within your standard. ',
'</p>',
'<p>',
'    <h2>View Requirements :</h2>',
'    <ul class="u-success-text">',
'        <li>The 1st field in the view must be PASS_FAIL.</li>',
'        <li>The 2nd field in the view must be REFERENCE_CODE.</li>',
'        <li>The 3rd field in the view must be APPLICATION_ID.</li>',
'    </ul>',
'    <h3>REFERENCE_CODE requirements</h3>',
'    The refrence_code field should be a colon-delimited list of IDs to populate the link between the report and the offending item. As a consequence, the "Link To" field (above) determines the requirements. If you are merely linking to an application'
||', the reference_code should simply equal the application_id. If you are linking to a page_item, the reference_code will need to include the application_id, followed by the application_item_id. Please consult the sample views (eg, ''v_ast_apex_app_item'
||'_naming'') to investigate further. ',
'</p>',
'<p>',
'<i>Note: the original version of this application allowed you to store your queries in a table. I prefer using views because it makes it easier to version-control tests and query their meta-data.</i>',
'</p>',
''))
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2959656568427436714)
,p_name=>'P14_FEEDBACK'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_prompt=>'Help Text'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(4382538383598814534)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_05=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4371546659418777858)
,p_name=>'P14_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4371546844092777872)
,p_name=>'P14_STANDARD_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_use_cache_before_default=>'NO'
,p_source=>'STANDARD_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4371547040446777873)
,p_name=>'P14_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_placeholder=>'All Page Items must have Help Text'
,p_source=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>64
,p_field_template=>wwv_flow_api.id(4382538510777814536)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_help_text=>'Give your test a descriptive and unique name. E.g. ''All Page Items must have Help Text''.'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4371547234036777874)
,p_name=>'P14_CHECK_SQL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_prompt=>'Check SQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(4382538383598814534)
,p_item_template_options=>'#DEFAULT#'
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
,p_attribute_05=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4371547646891777874)
,p_name=>'P14_FAILURE_HELP_TEXT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Help Text'
,p_source=>'FAILURE_HELP_TEXT'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_api.id(4382538383598814534)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4371564430895919087)
,p_name=>'P14_STANDARD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
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
,p_field_template=>wwv_flow_api.id(4382538383598814534)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4381422448457474692)
,p_name=>'P14_DISPLAY_SEQUENCE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
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
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4529935022290304781)
,p_name=>'P14_TEST_TYPE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_use_cache_before_default=>'NO'
,p_item_default=>'FAIL_REPORT'
,p_prompt=>'Type'
,p_source=>'TEST_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'TEST TYPES'
,p_lov=>'.'||wwv_flow_api.id(4529867240018108136)||'.'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(4382538510777814536)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_help_text=>'''Report'' types will make a report available to detail full pass/fail detail. ''Pass/fail'' describes a test that is evaluated at the application level.'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4530004034345979719)
,p_name=>'P14_TEST_LINK_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4371545233713777851)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Link to'
,p_source=>'LINK_TYPE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'TEST LINK TYPES'
,p_lov=>'.'||wwv_flow_api.id(4530001709921971074)||'.'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(4382538383598814534)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'B'
,p_help_text=>'If you pick a ''Report'' type, you must clarify the nature of the detail you are evaluating. Eg, if you pick ''Page Item'', you are specifying that your test is evaluating pass/fails at the Page Item level. The report, in consequence, will link to the Pa'
||'ge Item in question.'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2959656112776436709)
,p_validation_name=>'fix your view'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_pass boolean;',
'begin',
'',
'eba_stds_parser.validate_view( p_view_name => :P14_QUERY_VIEW,',
'                               x_view_sql  => :P14_CHECK_SQL,',
'                               x_feedback  => :P14_FEEDBACK,',
'                               x_pass      => l_pass);',
'return l_pass;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Please correct your view before proceeding.'
,p_associated_item=>wwv_flow_api.id(2954125880178994926)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4530004625982985105)
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
 p_id=>wwv_flow_api.id(4530004914565985111)
,p_event_id=>wwv_flow_api.id(4530004625982985105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_TEST_LINK_TYPE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4530005135731985111)
,p_event_id=>wwv_flow_api.id(4530004625982985105)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_TEST_LINK_TYPE'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3154113690169608415)
,p_name=>'Cancel Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4404866681339324288)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3154113798316608416)
,p_event_id=>wwv_flow_api.id(3154113690169608415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2956570555368402703)
,p_name=>'check view'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P14_QUERY_VIEW'
,p_condition_element=>'P14_QUERY_VIEW'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2956570697980402704)
,p_event_id=>wwv_flow_api.id(2956570555368402703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.debug.info(''Checking View'');'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2959656514200436713)
,p_event_id=>wwv_flow_api.id(2956570555368402703)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_FEEDBACK'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2956570791764402705)
,p_event_id=>wwv_flow_api.id(2956570555368402703)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'l_pass boolean;',
'begin',
'',
'eba_stds_parser.validate_view( p_view_name => :P14_QUERY_VIEW,',
'                               x_view_sql  => :P14_CHECK_SQL,',
'                               x_feedback  => :P14_FEEDBACK,',
'                               x_pass      => l_pass);',
'end;'))
,p_attribute_02=>'P14_QUERY_VIEW'
,p_attribute_03=>'P14_FEEDBACK,P14_CHECK_SQL'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2959656354363436712)
,p_event_id=>wwv_flow_api.id(2956570555368402703)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_CHECK_SQL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2959656234659436710)
,p_event_id=>wwv_flow_api.id(2956570555368402703)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_CHECK_SQL'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2959656267046436711)
,p_event_id=>wwv_flow_api.id(2956570555368402703)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P14_FEEDBACK'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4371548030776777875)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_STDS_STANDARD_TESTS'
,p_attribute_02=>'EBA_STDS_STANDARD_TESTS'
,p_attribute_03=>'P14_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4371548244120777876)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_STDS_STANDARD_TESTS'
,p_attribute_02=>'EBA_STDS_STANDARD_TESTS'
,p_attribute_03=>'P14_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4389183144772370857)
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
 p_id=>wwv_flow_api.id(4371548452591777876)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4371545629582777851)
);
wwv_flow_api.component_end;
end;
/
