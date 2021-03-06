prompt --application/pages/page_00054
begin
--   Manifest
--     PAGE: 00054
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
 p_id=>54
,p_user_interface_id=>wwv_flow_api.id(5594253093425280902)
,p_name=>'Add Multiple Users'
,p_alias=>'ADD-MULTIPLE-USERS2'
,p_page_mode=>'MODAL'
,p_step_title=>'Add Multiple Users'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(5767351611172177240)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.uReportList {',
'    margin: 0;',
'    list-style: none;',
'}',
'.uReportList li {',
'    margin: 0 0 4px 0;',
'}',
'.check_icon {',
'    display: inline-block;',
'    width: 16px;',
'    height: 16px;',
'    line-height: 16px;',
'    background: #69B86B;',
'    color: #FFF;',
'    text-align: center;',
'    border-radius: 4px;',
'    font-size: 15px;',
'    border: 1px solid green;',
'    text-shadow: 0 -1px 0 rgba(0,0,0,.15);',
'    vertical-align: top;',
'    margin-right: 4px;',
'}',
'.valid_user {',
'    display: inline-block;',
'    padding: 4px 8px 4px 4px;',
'    border: 1px solid #D0D0D0;',
'    border-radius: 3px;',
'    line-height: 20px;',
'    background-color: #F8F8F8;',
'    color: #404040;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7645782398149775003)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'CELARA'
,p_last_upd_yyyymmddhh24miss=>'20200128120320'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5131681596826691063)
,p_plug_name=>'Bulk Load Users - Step 2'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(4439219934126548197)
,p_plug_display_sequence=>80
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5132073297256745971)
,p_plug_name=>'Users to be added'
,p_parent_plug_id=>wwv_flow_api.id(5131681596826691063)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-expanded:t-Region--noBorder:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4439216685774548189)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(c001) username',
'  from apex_collections',
' where collection_name = ''EBA_STDS_BULK_USER_VALID''',
'order by 1'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'ADVANCED_FORMATTING'
,p_attribute_05=>'<span class="fa fa-check-circle u-success-text" aria-hidden="true"></span> <span style="line-height:36px;">&USERNAME.</span>'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5132074173145748520)
,p_name=>'Exceptions'
,p_parent_plug_id=>wwv_flow_api.id(5131681596826691063)
,p_template=>wwv_flow_api.id(4439216685774548189)
,p_display_sequence=>100
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001 username, c002 reason',
'  from apex_collections',
' where collection_name = ''EBA_STDS_BULK_USER_INVALID''',
'order by 1'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4439226544631548215)
,p_query_num_rows=>10000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No invalid new users found'
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
 p_id=>wwv_flow_api.id(5132074373485748525)
,p_query_column_id=>1
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>1
,p_column_heading=>'Username'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5133163590877051498)
,p_query_column_id=>2
,p_column_alias=>'REASON'
,p_column_display_sequence=>2
,p_column_heading=>'Why Invalid'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5134459769788292438)
,p_plug_name=>'Hidden Items'
,p_plug_display_sequence=>10
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5134460591605298800)
,p_plug_name=>'No Valid Users Exist - Page Info'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>70
,p_plug_source=>'<p>The username list on the previous page found no valid usernames and &P54_INVALID_COUNT. invalid ones. Please go back and verify the username list you provided.</p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from apex_collections',
' where collection_name = ''EBA_STDS_BULK_USER_VALID'''))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5134508973521438460)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439206381386548176)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5180952079992877093)
,p_plug_name=>'Valid Count'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>20
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :P54_VALID_COUNT valid_count, :P54_ROLE role',
'from dual'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_collections',
'where collection_name = ''EBA_STDS_BULK_USER_VALID''',
'    and :P54_INVALID_COUNT = 0'))
,p_attribute_01=>'ABOUT_TO_CREATE'
,p_attribute_02=>'VALID_COUNT'
,p_attribute_03=>'ROLE'
,p_attribute_12=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5180953990604952062)
,p_plug_name=>'Invalid Users'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>30
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :P54_VALID_COUNT valid_count,',
'    :P54_ROLE role,',
'    :P54_INVALID_COUNT invalid_count',
'from dual'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from apex_collections',
'where collection_name = ''EBA_STDS_BULK_USER_VALID''',
'    and :P54_INVALID_COUNT > 0'))
,p_attribute_01=>'ABOUT_TO_CREATE_WITH_INVALIDS'
,p_attribute_02=>'VALID_COUNT'
,p_attribute_03=>'ROLE'
,p_attribute_04=>'INVALID_COUNT'
,p_attribute_12=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5131682371582691065)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(5134508973521438460)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439236916357548246)
,p_button_image_alt=>'Previous'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'javascript:history.back();'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5131682195627691065)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5134508973521438460)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'Cancel'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_security_scheme=>wwv_flow_api.id(7645782398149775003)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5131682275610691065)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(5134508973521438460)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Users'
,p_button_position=>'NEXT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from apex_collections',
' where collection_name = ''EBA_STDS_BULK_USER_VALID'''))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5134458584565248771)
,p_name=>'P54_ROLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5134459769788292438)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P53_ROLE = 3 then',
'    return ''Administrator'';',
'elsif :P53_ROLE = 2 then',
'    return ''Contributor'';',
'elsif :P53_ROLE = 1 then',
'    return ''Reader'';',
'end if;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5134491788955945710)
,p_name=>'P54_VALID_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(5134459769788292438)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'  from apex_collections',
' where collection_name = ''EBA_STDS_BULK_USER_VALID'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5134491983780948091)
,p_name=>'P54_INVALID_COUNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5134459769788292438)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'  from apex_collections',
' where collection_name = ''EBA_STDS_BULK_USER_INVALID'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3119265664612150709)
,p_name=>'CNX'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5131682195627691065)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3119265665180150710)
,p_event_id=>wwv_flow_api.id(3119265664612150709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(5132884779769896891)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Users to ACL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c in',
'(',
'    select',
'        c001      as username,',
'        :P53_ROLE as access_level_id',
'    from',
'        apex_collections',
'    where',
'        collection_name = ''EBA_STDS_BULK_USER_VALID''',
')',
'loop',
'    insert into eba_stds_users',
'    (username, access_level_id)',
'    values',
'    (c.username, c.access_level_id);',
'end loop;',
'',
'---------------------',
'-- delete collections',
'--',
'wwv_flow_collection.DELETE_COLLECTION(''EBA_STDS_BULK_USER_INVALID'');',
'wwv_flow_collection.DELETE_COLLECTION(''EBA_STDS_BULK_USER_VALID'');',
'wwv_flow_collection.DELETE_COLLECTION(''EBA_STDS_BULK_USER_CREATE'');'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5131682275610691065)
,p_process_success_message=>'User(s) added.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3119265776775150711)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'CLOSE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
