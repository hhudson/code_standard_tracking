prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(5518741433308135589)
,p_name=>'Standards'
,p_alias=>'STANDARDS'
,p_step_title=>'Standards'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'<p>This page provides an overview of the standards which have been defined and their implementation across all relevant applications.</p>'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20200210141440'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4351059910881976268)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363710734113402889)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(8774575671518206136)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(4363726108926402940)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4351060206122976272)
,p_plug_name=>'Standards'
,p_region_css_classes=>'FLEX_STANDARDS'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(4363707767176402879)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.id,',
'    std.name standard,',
'    std.description,',
'    std.primary_developer,',
'    std.date_started,',
'    std.created,',
'    std.created_by,',
'    x.tests,',
'    x.broken_tests,',
'    x.completion,',
'    x.types,',
'    x.avg_duration,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_01'',std.standards_flex_01) standards_flex_01,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_02'',std.standards_flex_02) standards_flex_02,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_03'',std.standards_flex_03) standards_flex_03,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_04'',std.standards_flex_04) standards_flex_04,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_05'',std.standards_flex_05) standards_flex_05,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_06'',std.standards_flex_06) standards_flex_06,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_07'',std.standards_flex_07) standards_flex_07,',
'    eba_stds_flex_fw.fetch_v(''STANDARDS_FLEX_08'',std.standards_flex_08) standards_flex_08,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N01'',std.standards_flex_n01) standards_flex_n01,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N02'',std.standards_flex_n02) standards_flex_n02,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N03'',std.standards_flex_n03) standards_flex_n03,',
'    eba_stds_flex_fw.fetch_n(''STANDARDS_FLEX_N04'',std.standards_flex_n04) standards_flex_n04,',
'    std.standards_flex_d01,',
'    std.standards_flex_d02,',
'    std.standards_flex_d03,',
'    std.standards_flex_d04,',
'    std.standards_flex_clob',
'from eba_stds_standards std,',
'    (   select std.id,',
'            count( distinct ss.test_id ) tests,',
'            sum( nvl2(ss.pass_fail_pct,0,1) ) broken_tests,',
'            avg(ss.pass_fail_pct) completion,',
'            (   select listagg( tp.name, '', '' )',
'                    within group ( order by lower(tp.name) )',
'                from eba_stds_standard_type_ref fr,',
'                    eba_stds_types tp',
'                where tp.id = fr.type_id',
'                    and fr.standard_id = std.id ) types,',
'            avg(test_duration) avg_duration',
'        from eba_stds_standards std,',
'            eba_stds_standard_tests t,',
'            eba_stds_standard_statuses ss',
'        where t.standard_id(+) = std.id',
'            and ss.standard_id(+) = t.standard_id',
'            and ss.test_id(+)     = t.id',
'        group by std.id, std.name, std.description, std.primary_developer, std.date_started, std.created, std.created_by',
'    ) x',
'where std.id = x.id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(4351060310457976272)
,p_name=>'Standards'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'DAVID.GALE'
,p_internal_uid=>773572207056142838
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351060504232976295)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351060612853976298)
,p_db_column_name=>'STANDARD'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Standard'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_ID:#ID#'
,p_column_linktext=>'#STANDARD#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351060718285976298)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351060905617976298)
,p_db_column_name=>'PRIMARY_DEVELOPER'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Primary Developer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351061111702976298)
,p_db_column_name=>'DATE_STARTED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Started'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351061316770976299)
,p_db_column_name=>'CREATED'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351061413213976299)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4351061509122976299)
,p_db_column_name=>'TYPES'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Types'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4352726929272314787)
,p_db_column_name=>'TESTS'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Tests'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4362138328256469029)
,p_db_column_name=>'BROKEN_TESTS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Broken Tests'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4362138410461469030)
,p_db_column_name=>'COMPLETION'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Completion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'PCT_GRAPH:E2ECF8:5284C1:150'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4394242592213305939)
,p_db_column_name=>'AVG_DURATION'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Avg. Test Time (ms)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057263242914910324)
,p_db_column_name=>'STANDARDS_FLEX_01'
,p_display_order=>25
,p_column_identifier=>'P'
,p_column_label=>'Standards flex 01'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057263336401910325)
,p_db_column_name=>'STANDARDS_FLEX_02'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Standards flex 02'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057263490018910326)
,p_db_column_name=>'STANDARDS_FLEX_03'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Standards flex 03'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057263549862910327)
,p_db_column_name=>'STANDARDS_FLEX_04'
,p_display_order=>55
,p_column_identifier=>'S'
,p_column_label=>'Standards flex 04'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057263697234910328)
,p_db_column_name=>'STANDARDS_FLEX_05'
,p_display_order=>65
,p_column_identifier=>'T'
,p_column_label=>'Standards flex 05'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687115096432179)
,p_db_column_name=>'STANDARDS_FLEX_06'
,p_display_order=>75
,p_column_identifier=>'U'
,p_column_label=>'Standards flex 06'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687271145432180)
,p_db_column_name=>'STANDARDS_FLEX_07'
,p_display_order=>85
,p_column_identifier=>'V'
,p_column_label=>'Standards flex 07'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687400720432181)
,p_db_column_name=>'STANDARDS_FLEX_08'
,p_display_order=>95
,p_column_identifier=>'W'
,p_column_label=>'Standards flex 08'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687500370432182)
,p_db_column_name=>'STANDARDS_FLEX_N01'
,p_display_order=>105
,p_column_identifier=>'X'
,p_column_label=>'Standards flex n01'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687598430432183)
,p_db_column_name=>'STANDARDS_FLEX_N02'
,p_display_order=>115
,p_column_identifier=>'Y'
,p_column_label=>'Standards flex n02'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687699742432184)
,p_db_column_name=>'STANDARDS_FLEX_N03'
,p_display_order=>125
,p_column_identifier=>'Z'
,p_column_label=>'Standards flex n03'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687722519432185)
,p_db_column_name=>'STANDARDS_FLEX_N04'
,p_display_order=>135
,p_column_identifier=>'AA'
,p_column_label=>'Standards flex n04'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687827375432186)
,p_db_column_name=>'STANDARDS_FLEX_D01'
,p_display_order=>145
,p_column_identifier=>'AB'
,p_column_label=>'Standards flex d01'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204687990314432187)
,p_db_column_name=>'STANDARDS_FLEX_D02'
,p_display_order=>155
,p_column_identifier=>'AC'
,p_column_label=>'Standards flex d02'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204688016346432188)
,p_db_column_name=>'STANDARDS_FLEX_D03'
,p_display_order=>165
,p_column_identifier=>'AD'
,p_column_label=>'Standards flex d03'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204688166570432189)
,p_db_column_name=>'STANDARDS_FLEX_D04'
,p_display_order=>175
,p_column_identifier=>'AE'
,p_column_label=>'Standards flex d04'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4204688230531432190)
,p_db_column_name=>'STANDARDS_FLEX_CLOB'
,p_display_order=>185
,p_column_identifier=>'AF'
,p_column_label=>'Standards flex clob'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_STANDARDS'' and flexible_column = ''STANDARDS_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4351061617651977448)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7735736'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'STANDARD:DESCRIPTION:TYPES:PRIMARY_DEVELOPER:DATE_STARTED:TESTS:BROKEN_TESTS:AVG_DURATION:COMPLETION::STANDARDS_FLEX_01:STANDARDS_FLEX_02:STANDARDS_FLEX_03:STANDARDS_FLEX_04:STANDARDS_FLEX_05:STANDARDS_FLEX_06:STANDARDS_FLEX_07:STANDARDS_FLEX_08:STAN'
||'DARDS_FLEX_N01:STANDARDS_FLEX_N02:STANDARDS_FLEX_N03:STANDARDS_FLEX_N04:STANDARDS_FLEX_D01:STANDARDS_FLEX_D02:STANDARDS_FLEX_D03:STANDARDS_FLEX_D04:STANDARDS_FLEX_CLOB'
,p_sort_column_1=>'STANDARD'
,p_sort_direction_1=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4366641629300275560)
,p_plug_name=>'About this page'
,p_region_name=>'about1'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363694589162402861)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>This page provides an overview of the standards which have been defined and their implementation across all relevant applications.</p>'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4351504925795367722)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4351059910881976268)
,p_button_name=>'CREATE_STANDARD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(4363725332841402937)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Standard'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP,11::'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_api.id(7570271229805629701)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4351516516811690872)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4351060206122976272)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725256240402933)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3660415906512518419)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4351060206122976272)
,p_button_name=>'Export'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Export All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:700:&SESSION.::&DEBUG.:RP:P5_ID::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4511119198799773303)
,p_computation_sequence=>20
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_PAGE_ID'
);
wwv_flow_api.component_end;
end;
/
