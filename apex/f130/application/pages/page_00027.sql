prompt --application/pages/page_00027
begin
--   Manifest
--     PAGE: 00027
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>27
,p_user_interface_id=>wwv_flow_api.id(5575227898482645400)
,p_name=>'User Access Control'
,p_alias=>'USER-ACCESS-CONTROL'
,p_page_mode=>'MODAL'
,p_step_title=>'User Access Control'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(5748326416229541738)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(4420177743412912667)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7626757203207139501)
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4494740194873827408)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4420181186443912674)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7930341025034113948)
,p_plug_name=>'User Details'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(4420194739183912695)
,p_plug_display_sequence=>10
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7930341628752113953)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4494740194873827408)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7930341430220113952)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4494740194873827408)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''show'' d',
'from dual',
'where :P27_ID is not null',
'    and not exists (',
'        select null',
'        from eba_stds_users',
'        where upper(username) = :APP_USER',
'            and id = :P27_ID)'))
,p_button_condition_type=>'EXISTS'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7930341344927113952)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4494740194873827408)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''show'' d',
'from dual',
'where :P27_ID is not null',
'    and not exists (',
'        select null',
'        from eba_stds_users',
'        where upper(username) = :APP_USER',
'            and id = :P27_ID)'))
,p_button_condition_type=>'EXISTS'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5112881202622457735)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4494740194873827408)
,p_button_name=>'CREATE_AGAIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_image_alt=>'Add and Add Another'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P27_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7930341237811113952)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(4494740194873827408)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P27_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5112881478831464229)
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5112881202622457735)
,p_branch_sequence=>5
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7626781318266456182)
,p_name=>'P27_ACCESS_LEVEL_ID'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(7930341025034113948)
,p_use_cache_before_default=>'NO'
,p_item_default=>'2'
,p_prompt=>'Access Level'
,p_source=>'ACCESS_LEVEL_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'ACCESS_LEVELS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select access_level d, id r',
'  from eba_stds_access_levels',
' order by 1'))
,p_field_template=>wwv_flow_api.id(3258239205990453962)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_help_text=>'There are three access levels (Administrator, Contributor, Reader).'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7626795197104497350)
,p_name=>'P27_ACCOUNT_LOCKED'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(7930341025034113948)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Account Locked'
,p_source=>'ACCOUNT_LOCKED'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_display_when=>'P27_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_api.id(3258239499628453962)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7930342437129113956)
,p_name=>'P27_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(7930341025034113948)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7930342617517113962)
,p_name=>'P27_USER_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(7930341025034113948)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Username'
,p_source=>'USERNAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(3258239205990453962)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(5119027485377612052)
,p_computation_sequence=>10
,p_computation_item=>'P27_USER_NAME'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'trim(:P27_USER_NAME)'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7632919118575528724)
,p_validation_name=>'cannot update yourself'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from eba_stds_users',
' where upper(username) = :APP_USER',
'   and id = :P27_ID'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'You cannot update your own record.'
,p_when_button_pressed=>wwv_flow_api.id(7930341344927113952)
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3191787415570706627)
,p_name=>'Cancel Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7930341628752113953)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3191787473158706628)
,p_event_id=>wwv_flow_api.id(3191787415570706627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7930342917921113964)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_STDS_USERS'
,p_attribute_02=>'EBA_STDS_USERS'
,p_attribute_03=>'P27_ID'
,p_attribute_04=>'ID'
,p_attribute_07=>'ROW_VERSION_NUMBER'
,p_attribute_11=>'I:U:D'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7930343133099113965)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_STDS_USERS'
,p_attribute_02=>'EBA_STDS_USERS'
,p_attribute_03=>'P27_ID'
,p_attribute_04=>'ID'
,p_attribute_07=>'ROW_VERSION_NUMBER'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_api.id(7626757694980139512)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(7930343346340113965)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_button_id=>wwv_flow_api.id(7930341430220113952)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3100239943285515202)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE_AGAIN'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.component_end;
end;
/
