prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(5518741433308135589)
,p_name=>'Applications'
,p_alias=>'APPLICATIONS'
,p_step_title=>'Applications'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(5691839444821030151)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function checkallf01() {',
'  if ($("#checkall").attr("checked")) { ',
'    $("input[name=f01]").prop("checked", true);',
'  } else { ',
'    $("input[name=f01]").prop("checked", false);',
'  }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'<p>Identify the applications to be tested for compliance.</p>'
,p_last_updated_by=>'ALLAN'
,p_last_upd_yyyymmddhh24miss=>'20200210141454'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4350458917375373138)
,p_plug_name=>'Applications'
,p_region_css_classes=>'FLEX_APPLICATIONS'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_api.id(4363707767176402879)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select na.row_key,',
'    na.id,',
'    na.apex_app_id,',
'    a.application_id||''. ''||a.application_name app_name,',
'    nvl(nas.name,''Unknown'') status,',
'    nvl(nt.name,''Unknown'') type,',
'    na.prefix,',
'    a.owner schema,',
'    a.version,',
'    a.pages,',
'    na.last_advisor_date,',
'    na.last_security_date,',
'    na.tags,',
'    na.created,',
'    na.created_by,',
'    na.updated,',
'    na.updated_by,',
'    apex_item.checkbox(1,na.id) cb,',
'    a.last_updated_on apex_app_last_updated,',
'    (   select avg(ss.pass_fail_pct)',
'        from eba_stds_standard_statuses ss',
'        where ss.application_id = na.id ) completion,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_01'',applications_flex_01) applications_flex_01,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_02'',applications_flex_02) applications_flex_02,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_03'',applications_flex_03) applications_flex_03,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_04'',applications_flex_04) applications_flex_04,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_05'',applications_flex_05) applications_flex_05,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_06'',applications_flex_06) applications_flex_06,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_07'',applications_flex_07) applications_flex_07,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_08'',applications_flex_08) applications_flex_08,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N01'',applications_flex_n01) applications_flex_n01,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N02'',applications_flex_n02) applications_flex_n02,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N03'',applications_flex_n03) applications_flex_n03,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N04'',applications_flex_n04) applications_flex_n04,',
'    applications_flex_d01,',
'    applications_flex_d02,',
'    applications_flex_d03,',
'    applications_flex_d04,',
'    applications_flex_clob',
'from eba_stds_applications na,',
'    eba_stds_app_statuses nas,',
'    eba_stds_types nt,',
'    apex_applications a',
'where na.status_id = nas.id(+)',
'    and na.type_id = nt.id(+)',
'    and a.application_id = na.apex_app_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(4350459113829373143)
,p_name=>'Applications'
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
,p_owner=>'MIKE'
,p_internal_uid=>772971010427539709
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459234444373149)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Row Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459324169373151)
,p_db_column_name=>'APEX_APP_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'APEX App ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459416688373152)
,p_db_column_name=>'APP_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Application'
,p_column_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,34:P34_ID:#ID#'
,p_column_linktext=>'#APP_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459515909373152)
,p_db_column_name=>'TAGS'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459616826373152)
,p_db_column_name=>'CREATED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459704939373152)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459807729373152)
,p_db_column_name=>'UPDATED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350459916972373153)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350460128467373153)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350460320269373153)
,p_db_column_name=>'CB'
,p_display_order=>12
,p_column_identifier=>'L'
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
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350460618092373153)
,p_db_column_name=>'APEX_APP_LAST_UPDATED'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'App Last Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350900321170509698)
,p_db_column_name=>'STATUS'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'App Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350900432392509699)
,p_db_column_name=>'TYPE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'App Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350900515281509699)
,p_db_column_name=>'PREFIX'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Prefix'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350900621779509699)
,p_db_column_name=>'SCHEMA'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Schema'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4350900829366509699)
,p_db_column_name=>'LAST_ADVISOR_DATE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Last Advisor Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4362139414404536269)
,p_db_column_name=>'COMPLETION'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Standard Completion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'PCT_GRAPH:#E2ECF8:#5284C1:'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4445230791504979627)
,p_db_column_name=>'LAST_SECURITY_DATE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Last Security Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4514120608926498462)
,p_db_column_name=>'VERSION'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Version'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057261501751910306)
,p_db_column_name=>'PAGES'
,p_display_order=>35
,p_column_identifier=>'Z'
,p_column_label=>'Pages'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057261598633910307)
,p_db_column_name=>'APPLICATIONS_FLEX_01'
,p_display_order=>45
,p_column_identifier=>'AA'
,p_column_label=>'Applications flex 01'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057261610085910308)
,p_db_column_name=>'APPLICATIONS_FLEX_02'
,p_display_order=>55
,p_column_identifier=>'AB'
,p_column_label=>'Applications flex 02'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057261797001910309)
,p_db_column_name=>'APPLICATIONS_FLEX_03'
,p_display_order=>65
,p_column_identifier=>'AC'
,p_column_label=>'Applications flex 03'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057261858412910310)
,p_db_column_name=>'APPLICATIONS_FLEX_04'
,p_display_order=>75
,p_column_identifier=>'AD'
,p_column_label=>'Applications flex 04'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057261945819910311)
,p_db_column_name=>'APPLICATIONS_FLEX_05'
,p_display_order=>85
,p_column_identifier=>'AE'
,p_column_label=>'Applications flex 05'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262022067910312)
,p_db_column_name=>'APPLICATIONS_FLEX_06'
,p_display_order=>95
,p_column_identifier=>'AF'
,p_column_label=>'Applications flex 06'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262118006910313)
,p_db_column_name=>'APPLICATIONS_FLEX_07'
,p_display_order=>105
,p_column_identifier=>'AG'
,p_column_label=>'Applications flex 07'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262303849910314)
,p_db_column_name=>'APPLICATIONS_FLEX_08'
,p_display_order=>115
,p_column_identifier=>'AH'
,p_column_label=>'Applications flex 08'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262314925910315)
,p_db_column_name=>'APPLICATIONS_FLEX_N01'
,p_display_order=>125
,p_column_identifier=>'AI'
,p_column_label=>'Applications flex n01'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262504677910316)
,p_db_column_name=>'APPLICATIONS_FLEX_N02'
,p_display_order=>135
,p_column_identifier=>'AJ'
,p_column_label=>'Applications flex n02'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262508591910317)
,p_db_column_name=>'APPLICATIONS_FLEX_N03'
,p_display_order=>145
,p_column_identifier=>'AK'
,p_column_label=>'Applications flex n03'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262604767910318)
,p_db_column_name=>'APPLICATIONS_FLEX_N04'
,p_display_order=>155
,p_column_identifier=>'AL'
,p_column_label=>'Applications flex n04'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262751239910319)
,p_db_column_name=>'APPLICATIONS_FLEX_D01'
,p_display_order=>165
,p_column_identifier=>'AM'
,p_column_label=>'Applications flex d01'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262837127910320)
,p_db_column_name=>'APPLICATIONS_FLEX_D02'
,p_display_order=>175
,p_column_identifier=>'AN'
,p_column_label=>'Applications flex d02'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057262997854910321)
,p_db_column_name=>'APPLICATIONS_FLEX_D03'
,p_display_order=>185
,p_column_identifier=>'AO'
,p_column_label=>'Applications flex d03'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057263014225910322)
,p_db_column_name=>'APPLICATIONS_FLEX_D04'
,p_display_order=>195
,p_column_identifier=>'AP'
,p_column_label=>'Applications flex d04'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(4057263136063910323)
,p_db_column_name=>'APPLICATIONS_FLEX_CLOB'
,p_display_order=>205
,p_column_identifier=>'AQ'
,p_column_label=>'Applications flex clob'
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
,p_display_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATIONS_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(4350461016586373157)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7729730'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CB:APP_NAME:VERSION:STATUS:TYPE:LAST_ADVISOR_DATE:LAST_SECURITY_DATE:COMPLETION:PAGES:APPLICATIONS_FLEX_01:APPLICATIONS_FLEX_02:APPLICATIONS_FLEX_03:APPLICATIONS_FLEX_04:APPLICATIONS_FLEX_05:APPLICATIONS_FLEX_06:APPLICATIONS_FLEX_07:APPLICATIONS_FLEX'
||'_08:APPLICATIONS_FLEX_N01:APPLICATIONS_FLEX_N02:APPLICATIONS_FLEX_N03:APPLICATIONS_FLEX_N04:APPLICATIONS_FLEX_D01:APPLICATIONS_FLEX_D02:APPLICATIONS_FLEX_D03:APPLICATIONS_FLEX_D04:APPLICATIONS_FLEX_CLOB'
,p_sort_column_1=>'APP_NAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'APEX_APP_ID'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4350462216596373167)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363694589162402861)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>'<p>Identify the applications to be tested for compliance.</p>'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4350902716783521499)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350461804364373161)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4350902716783521499)
,p_button_name=>'ADD_APPLICATION'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(4363725332841402937)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Applications'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP,28::'
,p_icon_css_classes=>'fa-chevron-right'
,p_security_scheme=>wwv_flow_api.id(7570271229805629701)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350461430123373161)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4350458917375373138)
,p_button_name=>'GET_COUNTS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Get Counts'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350461228843373159)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4350458917375373138)
,p_button_name=>'GRID_EDIT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Grid Edit'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:RP,16::'
,p_security_scheme=>wwv_flow_api.id(7570271229805629701)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350461623216373161)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(4350458917375373138)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725256240402933)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4350462726153373171)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'6'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4511119706764775549)
,p_computation_sequence=>30
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_PAGE_ID'
);
wwv_flow_api.component_end;
end;
/
