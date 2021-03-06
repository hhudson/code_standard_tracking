prompt --application/pages/page_00037
begin
--   Manifest
--     PAGE: 00037
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(5594253093425280902)
,p_name=>'Application Appearance'
,p_alias=>'APPLICATION-APPEARANCE'
,p_page_mode=>'MODAL'
,p_step_title=>'Application Appearance'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7645782398149775003)
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    The appearance of your application is determined by the chosen Default Theme Style. The Default Theme Style affects <strong>all</strong> users of the application.',
'</p>',
'<p>',
'    Additionally, choose whether to enable end users to change their Theme Style.',
'</p>',
'<p>',
'    <i>&#40;If an end user changes Theme Styles, the change only applies to their individual account; end users cannot change the application appearance for other end users.&#41;</i>',
'</p>',
'<h3>',
'    Default Theme Style',
'</h3>',
'<p>',
'    Choose the Default Theme Style for all users of the application from a list of appearance options called Theme Styles. Each Theme Style applies a different look and color scheme to your application.',
'</p>',
'<p>',
'    End users can change their Theme Style setting if you enable <q>Allow End Users to choose Theme Style.</q>',
'</p>',
'<h3>',
'    Allow End Users to choose Theme Style',
'</h3>',
'<p>',
'    Enable end users to customize their choice of Theme Style for the application.',
'</p>',
'<p>',
'    Select this check box to populate the Customize link at the bottom of every non-modal page in the application for all end users.',
'</p>',
'<p>',
'    Clicking the Customize link opens the Customize dialog. In the Customize dialog, end users choose from the list of Theme Styles to select their preferred application appearance.',
'</p>'))
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5872004114170344117)
,p_plug_name=>'Configure Appearance'
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Form--large'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439204376214548171)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>The appearance of your application is defined by the Theme Style.</p>'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4060266532434058518)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5872004114170344117)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4060266924055058519)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5872004114170344117)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4060269644726058540)
,p_branch_name=>'Go To Page settings'
,p_branch_action=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4060266532434058518)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4060267359428058519)
,p_name=>'P37_DESKTOP_THEME_STYLE_ID'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5872004114170344117)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Default Theme Style'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.theme_style_id',
'from apex_application_theme_styles s, apex_application_themes t',
'where s.application_id = t.application_id',
'and s.theme_number = t.theme_number',
'and s.application_id = :app_id',
'and t.ui_type_name   = ''DESKTOP''',
'and s.is_current = ''Yes'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.name d,',
'       s.theme_style_id r',
'from apex_application_theme_styles s, apex_application_themes t',
'where s.application_id = t.application_id',
'and s.theme_number = t.theme_number',
'and s.application_id = :app_id',
'and t.ui_type_name   = ''DESKTOP''',
'and t.is_current = ''Yes''',
'order by 1'))
,p_cHeight=>1
,p_grid_label_column_span=>3
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_application_theme_styles s, apex_application_themes t',
'where s.application_id = t.application_id',
'and s.theme_number = t.theme_number',
'and s.application_id = :app_id',
'and t.ui_type_name   = ''DESKTOP'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4439236719731548242)
,p_item_css_classes=>'margin-top-lg'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_inline_help_text=>'The default Theme Style applies to all users.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4060267670110058524)
,p_name=>'P37_END_USER_STYLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5872004114170344117)
,p_use_cache_before_default=>'NO'
,p_prompt=>'End User Theme Preference'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ui.theme_style_by_user_pref',
'  from apex_application_themes t, apex_appl_user_interfaces ui',
' where ui.application_id = t.application_id',
'   and ui.theme_number   = t.theme_number',
'   and t.application_id  = :app_id ',
'   and t.ui_type_name    = ''DESKTOP''',
'   and t.is_current      = ''Yes'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Allow End Users to choose Theme Style;Yes'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(4439236622482548240)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_inline_help_text=>'If checked, end users may choose their own Theme Style using the Customize link.'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3119264405739150697)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4060266532434058518)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3119264542843150698)
,p_event_id=>wwv_flow_api.id(3119264405739150697)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4060269065059058538)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Theme Style'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P37_DESKTOP_THEME_STYLE_ID is not null then',
'    for c1 in (select theme_number',
'               from apex_application_themes',
'               where application_id = :app_id',
'               and ui_type_name   = ''DESKTOP''',
'               and is_current = ''Yes'')',
'    loop',
'        apex_theme.set_current_style (',
'            p_theme_number   => c1.theme_number,',
'            p_id => :P37_DESKTOP_THEME_STYLE_ID',
'            );',
'    end loop;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4060266924055058519)
,p_process_success_message=>'Application appearance settings updated successfully.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4060268794730058538)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enable / Disable End User Style'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_enabled boolean := case when :P37_END_USER_STYLE = ''Yes'' then true else false end;',
'begin',
'  for c1 in (',
'    select ui.theme_number',
'      from apex_application_themes t, apex_appl_user_interfaces ui',
'     where ui.application_id = t.application_id ',
'       and ui.theme_number   = t.theme_number ',
'       and t.application_id  = :app_id ',
'       and t.ui_type_name    = ''DESKTOP''',
'       and t.is_current      = ''Yes''',
'  ) loop',
'    if l_enabled then ',
'      apex_theme.enable_user_style ( p_application_id => :APP_ID, p_theme_number => c1.theme_number );',
'    else',
'      apex_theme.disable_user_style ( p_application_id => :APP_ID, p_theme_number => c1.theme_number );',
'      apex_theme.clear_all_users_style(:APP_ID);',
'    end if; ',
'  end loop;',
'end; '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4060266924055058519)
);
wwv_flow_api.component_end;
end;
/
