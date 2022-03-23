prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(5556384169945677648)
,p_name=>'Rename Application'
,p_alias=>'RENAME-APPLICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Rename Application'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(7608000885778102269)
,p_step_template=>wwv_flow_api.id(4401334014875944915)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7607913474670171749)
,p_dialog_height=>'350'
,p_dialog_width=>'500'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4475896729113859658)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4401337457906944922)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5735345965011585318)
,p_plug_name=>'Rename Application'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Region--noBorder:t-Region--removeHeader'
,p_plug_template=>wwv_flow_api.id(4401351010646944943)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5735346590076602013)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4475896729113859658)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4401368675429944998)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5735346778432608042)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4475896729113859658)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4401368675429944998)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5735350787877627600)
,p_branch_action=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5735346778432608042)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3158253624650074080)
,p_name=>'P8_APPLICATION_SUBTITLE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5735345965011585318)
,p_prompt=>'Application subtitle'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select preference_value',
'from eba_stds_preferences',
'where preference_name = ''APPLICATION_SUBTITLE''',
'union all',
'select ''Track and manage APEX application best practices''',
'from dual',
'where not exists ( select null',
'                   from eba_stds_preferences',
'                   where preference_name = ''APPLICATION_SUBTITLE'')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(3239395477453486210)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5735346489627596324)
,p_name=>'P8_APPLICATION_TITLE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5735345965011585318)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&APP_NAME.'
,p_prompt=>'Application Name'
,p_source=>'&APPLICATION_TITLE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_field_template=>wwv_flow_api.id(3239395477453486210)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3172944506446738883)
,p_name=>'Cancel Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5735346590076602013)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3172944617799738884)
,p_event_id=>wwv_flow_api.id(3172944506446738883)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5735350368998624241)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Application Title'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':APPLICATION_TITLE := :P8_APPLICATION_TITLE;',
'',
'merge into eba_stds_preferences dst',
'using ( select ''APPLICATION_TITLE'' preference_name, :P8_APPLICATION_TITLE preference_value from dual ) src',
'on ( dst.preference_name = src.preference_name )',
'when matched then',
'    update set dst.preference_value = src.preference_value',
'when not matched then',
'    insert ( preference_name, preference_value )',
'    values ( src.preference_name, src.preference_value );',
'',
'merge into eba_stds_preferences dst',
'using ( select ''APPLICATION_SUBTITLE'' preference_name, :P8_APPLICATION_SUBTITLE preference_value from dual ) src',
'on ( dst.preference_name = src.preference_name )',
'when matched then',
'    update set dst.preference_value = src.preference_value',
'when not matched then',
'    insert ( preference_name, preference_value )',
'    values ( src.preference_name, src.preference_value );',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5735346778432608042)
,p_process_success_message=>'Application renamed.'
);
wwv_flow_api.component_end;
end;
/
