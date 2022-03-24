prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_user_interface_id=>wwv_flow_api.id(5575227898482645400)
,p_name=>'Manage Sample Standard'
,p_alias=>'MANAGE-SAMPLE-STANDARD'
,p_page_mode=>'MODAL'
,p_step_title=>'Manage Sample Standard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7626757203207139501)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4503609152089411922)
,p_plug_name=>'Manage Sample Standard'
,p_region_css_classes=>'t-Alert--accessibleHeading'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(4420179181271912669)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>This application ships with a sample Standard, which includes several automated tests. You can remove and recreate this sample Standard using this page. Note that removing or recreating the sample Standard will remove all automated tests associate'
||'d with it, even if they were added by the end user; they will not be recoverable. Removing or adding the sample Standard will not affect any standards created by end users.<p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4494740143753827407)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_api.id(4503609152089411922)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4420181186443912674)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4503715152922497313)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4494740143753827407)
,p_button_name=>'LOAD_SAMPLE_STANDARD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load Sample Standard'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'not eba_stds_data.is_sample_data_loaded()'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4503715457229499070)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4494740143753827407)
,p_button_name=>'REMOVE_SAMPLE_STANDARD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--primary'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_image_alt=>'Remove Sample Standard'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'eba_stds_data.is_sample_data_loaded()'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4503714565604491483)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(4494740143753827407)
,p_button_name=>'RESET_SAMPLE_STANDARD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset Sample Standard'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'eba_stds_data.is_sample_data_loaded()'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4503714173785484398)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4494740143753827407)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large'
,p_button_template_id=>wwv_flow_api.id(4420212403966912750)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4503716279429503918)
,p_branch_action=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3100238852449515191)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4503714173785484398)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3100238952006515192)
,p_event_id=>wwv_flow_api.id(3100238852449515191)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4503716758594508423)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Sample Standard'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_stds_data.load_sample_data();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4503715152922497313)
,p_process_success_message=>'Sample Standard created.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4503717169676511619)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Sample Standard'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_stds_data.remove_sample_data();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4503715457229499070)
,p_process_success_message=>'Sample Standard removed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4503717379372514440)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Sample Standard'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_stds_data.remove_sample_data();',
'    eba_stds_data.load_sample_data();',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4503714565604491483)
,p_process_success_message=>'Sample Standard reset.'
);
wwv_flow_api.component_end;
end;
/
