prompt --application/pages/page_00700
begin
--   Manifest
--     PAGE: 00700
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
 p_id=>700
,p_user_interface_id=>wwv_flow_api.id(5537554757292547194)
,p_name=>'Export'
,p_alias=>'EXPORT'
,p_step_title=>'Export'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(3139423885367943623)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(4382521597993814489)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3139423983654943624)
,p_name=>'P700_TEST_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(3139423885367943623)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3139424078274943625)
,p_name=>'P700_STANDARD_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(3139423885367943623)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3679229082757930022)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Export File'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    sys.htp.init;',
'    sys.owa_util.mime_header( ''application/octet-stream'', FALSE,''UTF-8'' );',
'--    sys.htp.p(''Content-length: '' || sys.dbms_lob.getlength( l_clob ));',
'    sys.htp.p(''Content-Disposition: inline; filename="APEX_Standards.sql"'' );',
'    sys.owa_util.http_header_close;',
'',
'    eba_stds_export.export( :P700_STANDARD_ID, :P700_TEST_ID );',
'',
'    apex_application.stop_apex_engine;',
'exception when others then',
'    sys.htp.prn(''error: ''||sqlerrm);',
'    apex_application.stop_apex_engine;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.component_end;
end;
/
