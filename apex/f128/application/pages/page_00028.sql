prompt --application/pages/page_00028
begin
--   Manifest
--     PAGE: 00028
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>28
,p_user_interface_id=>wwv_flow_api.id(3006115763271059427)
,p_name=>'Add Applications'
,p_step_title=>'Add Applications'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function checkallf01() {',
'  if ($("#checkall").is('':checked'')) { ',
'    $("input[name=f01]").prop("checked", true);',
'  } else { ',
'    $("input[name=f01]").prop("checked", false);',
'  }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(5057645559768553539)
,p_protection_level=>'C'
,p_help_text=>'<p>To track standards for application(s) check the application and click the <b>Add Applications</b> button.</p>'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20211215182640'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1838279959098453252)
,p_plug_name=>'Add Applications'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(1851082097139326717)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_item.checkbox(1,app.application_id) cb,',
'    app.application_id,',
'    app.application_name,',
'    app.last_updated_on,',
'    app.last_updated_by',
'from apex_applications app,',
'    apex_workspaces wrk',
'where app.application_id not in (select apex_app_id from eba_stds_applications)',
'    and app.workspace = wrk.workspace',
'    and wrk.workspace_id = :WORKSPACE_ID',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(1838280158147453253)
,p_name=>'Add Applications'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'MIKE'
,p_internal_uid=>773417724782695981
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1838280240492453254)
,p_db_column_name=>'APPLICATION_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'App ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1838280361874453254)
,p_db_column_name=>'APPLICATION_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Application'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1838280542987453254)
,p_db_column_name=>'CB'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'<input type="checkbox" onclick="checkallf01();" id="checkall" />'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1838282834933471430)
,p_db_column_name=>'LAST_UPDATED_ON'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Last Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(1838282946447471430)
,p_db_column_name=>'LAST_UPDATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Last Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(1838280650814453254)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7734183'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'CB:APPLICATION_ID:APPLICATION_NAME:LAST_UPDATED_ON:LAST_UPDATED_BY'
,p_sort_column_1=>'APPLICATION_ID'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(1838281439017453256)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1851085064076326727)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(6261950001481129974)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(1851100438889326778)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2604438720791448050)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1851068919125326699)
,p_plug_display_sequence=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>To track standards for application(s) check the application and click the <b>Add Applications</b> button.</p>'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1838280842366453254)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1838281439017453256)
,p_button_name=>'ADD_APPLICATIONS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1851100268755326777)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Applications'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1838281063015453255)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(1838279959098453252)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1851099586203326771)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:28,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(1838282050942453259)
,p_branch_name=>'back to applications'
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(2609476970277921634)
,p_validation_name=>'Must select application'
,p_validation_sequence=>10
,p_validation=>'wwv_flow.g_f01.count >= 1'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Please check an application to add.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(1838281739833453258)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'add applications'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    f number;',
'begin',
'    for i in 1..wwv_flow.g_f01.count loop',
'        f := wwv_flow.g_f01(i);',
'        insert into eba_stds_applications(apex_app_id) values (f);',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Application(s) added'
);
wwv_flow_api.component_end;
end;
/
