prompt --application/pages/page_00021
begin
--   Manifest
--     PAGE: 00021
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
 p_id=>21
,p_user_interface_id=>wwv_flow_api.id(5556384169945677648)
,p_name=>'Automated Testing Job Status'
,p_alias=>'AUTOMATED-TESTING-JOB-STATUS'
,p_page_mode=>'MODAL'
,p_step_title=>'Automated Testing Job Status'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_protection_level=>'C'
,p_help_text=>'<p>Tests are automatically run while a user navigates the application. Tests are only run if the test or the targeted application(s) is updated. However, if many applications are updated prior to a user accessing this application, they may encounter '
||'a significant delay on first access. To avoid this issue, it is recommended to run the automated testing job, which checks for any updated applications and/or tests on a regular basis and runs the tests as appropriate.</p>'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4550843624020919079)
,p_plug_name=>'Automated Testing Job Status'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(4401350503813944938)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LOG_ID,',
'       LOG_DATE,',
'       OWNER,',
'       JOB_NAME,',
'       status,',
'       ERROR#,',
'       REQ_START_DATE,',
'       ACTUAL_START_DATE,',
'       RUN_DURATION,',
'       INSTANCE_ID,',
'       SESSION_ID,',
'       SLAVE_PID,',
'       CPU_USED,',
'       CREDENTIAL_OWNER,',
'       CREDENTIAL_NAME,',
'       DESTINATION_OWNER,',
'       DESTINATION,',
'       ADDITIONAL_INFO',
'  FROM USER_SCHEDULER_JOB_RUN_DETAILS',
' WHERE JOB_NAME in (''EBA_STDS_TEST_UPD_JOB'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(4550843847083919081)
,p_name=>'Email Job Status'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'LOG_ID'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_show_flashback=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#ws/small_page.gif" alt="">'
,p_detail_link_attr=>'alt="Single Row View" title="Single Row View"'
,p_icon_view_columns_per_row=>1
,p_owner=>'SBKENNED'
,p_internal_uid=>935713024736681000
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550843946988919085)
,p_db_column_name=>'LOG_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Log ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844052724919087)
,p_db_column_name=>'LOG_DATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Log Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844150861919087)
,p_db_column_name=>'OWNER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844248848919088)
,p_db_column_name=>'JOB_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Job Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844344999919088)
,p_db_column_name=>'STATUS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844423100919088)
,p_db_column_name=>'ERROR#'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Error Number'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844529182919088)
,p_db_column_name=>'REQ_START_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Requested Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844645114919088)
,p_db_column_name=>'ACTUAL_START_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Actual Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844755002919088)
,p_db_column_name=>'RUN_DURATION'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Run Duration'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844850909919088)
,p_db_column_name=>'INSTANCE_ID'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Instance ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550844939650919088)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Session ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550845038481919091)
,p_db_column_name=>'SLAVE_PID'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Slave PID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550845146787919091)
,p_db_column_name=>'CPU_USED'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'CPU Used'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550845254328919091)
,p_db_column_name=>'CREDENTIAL_OWNER'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Credential Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550845331520919091)
,p_db_column_name=>'CREDENTIAL_NAME'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Credential Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550845430395919092)
,p_db_column_name=>'DESTINATION_OWNER'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Destination Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550845526922919092)
,p_db_column_name=>'DESTINATION'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Destination'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4550845631956919092)
,p_db_column_name=>'ADDITIONAL_INFO'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Additional Information'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4550845726759919092)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9357150'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'LOG_ID:LOG_DATE:JOB_NAME:STATUS:ERROR#:REQ_START_DATE:ACTUAL_START_DATE:RUN_DURATION'
,p_sort_column_1=>'LOG_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4475897055781859662)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4550843624020919079)
,p_button_name=>'Reset'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4401367992877944992)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.component_end;
end;
/
