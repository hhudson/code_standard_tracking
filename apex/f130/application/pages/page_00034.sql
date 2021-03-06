prompt --application/pages/page_00034
begin
--   Manifest
--     PAGE: 00034
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
 p_id=>34
,p_user_interface_id=>wwv_flow_api.id(5594253093425280902)
,p_name=>'&P34_APPLICATION.'
,p_alias=>'SELECTED-APPLICATION'
,p_step_title=>'&P34_APPLICATION.'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#AVG_DURATION {white-space: nowrap;}',
'.check_sql {',
'white-space: pre;',
'font-family: monospace;',
'font-size: 10px;',
'line-height: 14px;',
'}',
'section.uModalRegion.ui-dialog-content {',
'    padding: 0;',
'}',
'section.uModalRegion.ui-dialog-content>div.uRegionContent {',
'    padding: 0 !important;',
'}'))
,p_step_template=>wwv_flow_api.id(4439189277549548155)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'HAYDEN'
,p_last_upd_yyyymmddhh24miss=>'20220321205527'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4426423569100748011)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4439206381386548176)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4426425972008748020)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_07'
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
 p_id=>wwv_flow_api.id(4426427370885748026)
,p_plug_name=>'Application Tags'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439219934126548197)
,p_plug_display_sequence=>40
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag, (select TAG_COUNT from eba_stds_tags_sum s where s.tag = t.tag) tag_count',
'  from EBA_STDS_TAGS t',
' where CONTENT_ID = :P34_ID',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TAG_CLOUD'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'No tags found.'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'from EBA_STDS_TAGS t',
'where CONTENT_ID = :P34_ID'))
,p_attribute_01=>'f?p=&APP_ID.:6:&APP_SESSION.:::6,RIR:IRC_TAGS:#TAG#'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4426427573191748027)
,p_plug_name=>'About This Page'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>10
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.TRANSLATED_MESSAGE'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'PAGE_34_ABOUT'
,p_attribute_12=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4426427774983748027)
,p_name=>'Application'
,p_template=>wwv_flow_api.id(4439206249279548174)
,p_display_sequence=>20
,p_region_css_classes=>'flex_applications'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select na.row_key,',
'    na.id,',
'    na.apex_app_id,',
'    a.application_id||''. ''||a.application_name app_name,',
'    a.version,',
'    nvl(nas.name,''Unknown'') status,',
'    nvl(nt.name,''Unknown'') type,',
'    na.prefix,',
'    (   select a.owner',
'        from apex_applications a',
'        where a.application_id = na.apex_app_id ) schema,',
'    na.last_advisor_date,',
'    na.last_security_date,',
'    na.tags,',
'    na.created,',
'    na.created_by,',
'    na.updated,',
'    na.updated_by,',
'    a.last_updated_on apex_app_last_updated,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_01'',na.applications_flex_01) applications_flex_01,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_02'',na.applications_flex_02) applications_flex_02,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_03'',na.applications_flex_03) applications_flex_03,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_04'',na.applications_flex_04) applications_flex_04,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_05'',na.applications_flex_05) applications_flex_05,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_06'',na.applications_flex_06) applications_flex_06,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_07'',na.applications_flex_07) applications_flex_07,',
'    eba_stds_flex_fw.fetch_v(''APPLICATIONS_FLEX_08'',na.applications_flex_08) applications_flex_08,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N01'',na.applications_flex_n01) applications_flex_n01,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N02'',na.applications_flex_n02) applications_flex_n02,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N03'',na.applications_flex_n03) applications_flex_n03,',
'    eba_stds_flex_fw.fetch_n(''APPLICATIONS_FLEX_N04'',na.applications_flex_n04) applications_flex_n04,',
'    na.applications_flex_d01,',
'    na.applications_flex_d02,',
'    na.applications_flex_d03,',
'    na.applications_flex_d04,',
'    na.applications_flex_clob',
'from eba_stds_applications na,',
'    eba_stds_app_statuses nas,',
'    eba_stds_types nt,',
'    apex_applications a',
'where na.apex_app_id = :P34_APEX_APP_ID',
'    and nas.id(+) = na.status_id',
'    and nt.id(+) = na.type_id',
'    and a.application_id(+) = na.apex_app_id',
'order by 1'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P34_APEX_APP_ID'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4439228461820548218)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'no data found'
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
 p_id=>wwv_flow_api.id(4426427996029748029)
,p_query_column_id=>1
,p_column_alias=>'ROW_KEY'
,p_column_display_sequence=>2
,p_column_heading=>'Row Key'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426428072941748029)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426428168503748029)
,p_query_column_id=>3
,p_column_alias=>'APEX_APP_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Apex App ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426428273590748029)
,p_query_column_id=>4
,p_column_alias=>'APP_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'Application'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4589634865795660539)
,p_query_column_id=>5
,p_column_alias=>'VERSION'
,p_column_display_sequence=>5
,p_column_heading=>'Version'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426434074274794933)
,p_query_column_id=>6
,p_column_alias=>'STATUS'
,p_column_display_sequence=>7
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426434180780794934)
,p_query_column_id=>7
,p_column_alias=>'TYPE'
,p_column_display_sequence=>8
,p_column_heading=>'Type'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426434287802794934)
,p_query_column_id=>8
,p_column_alias=>'PREFIX'
,p_column_display_sequence=>9
,p_column_heading=>'Prefix'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426434395655794934)
,p_query_column_id=>9
,p_column_alias=>'SCHEMA'
,p_column_display_sequence=>10
,p_column_heading=>'Schema'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764570958462902)
,p_query_column_id=>10
,p_column_alias=>'LAST_ADVISOR_DATE'
,p_column_display_sequence=>11
,p_column_heading=>'Last advisor date'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764697751462903)
,p_query_column_id=>11
,p_column_alias=>'LAST_SECURITY_DATE'
,p_column_display_sequence=>12
,p_column_heading=>'Last security date'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764150605462897)
,p_query_column_id=>12
,p_column_alias=>'TAGS'
,p_column_display_sequence=>17
,p_column_heading=>'Tags'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764245548462898)
,p_query_column_id=>13
,p_column_alias=>'CREATED'
,p_column_display_sequence=>13
,p_column_heading=>'Created'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764301816462899)
,p_query_column_id=>14
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>14
,p_column_heading=>'Created by'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764455259462900)
,p_query_column_id=>15
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>15
,p_column_heading=>'Updated'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764468085462901)
,p_query_column_id=>16
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>16
,p_column_heading=>'Updated by'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426429375148748029)
,p_query_column_id=>17
,p_column_alias=>'APEX_APP_LAST_UPDATED'
,p_column_display_sequence=>6
,p_column_heading=>'APEX App Last Updated'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461568535955058031)
,p_query_column_id=>18
,p_column_alias=>'APPLICATIONS_FLEX_01'
,p_column_display_sequence=>18
,p_column_heading=>'Applications flex 01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461568660539058032)
,p_query_column_id=>19
,p_column_alias=>'APPLICATIONS_FLEX_02'
,p_column_display_sequence=>19
,p_column_heading=>'Applications flex 02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461568724260058033)
,p_query_column_id=>20
,p_column_alias=>'APPLICATIONS_FLEX_03'
,p_column_display_sequence=>20
,p_column_heading=>'Applications flex 03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461568768808058034)
,p_query_column_id=>21
,p_column_alias=>'APPLICATIONS_FLEX_04'
,p_column_display_sequence=>21
,p_column_heading=>'Applications flex 04'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461568870057058035)
,p_query_column_id=>22
,p_column_alias=>'APPLICATIONS_FLEX_05'
,p_column_display_sequence=>22
,p_column_heading=>'Applications flex 05'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461568971659058036)
,p_query_column_id=>23
,p_column_alias=>'APPLICATIONS_FLEX_06'
,p_column_display_sequence=>23
,p_column_heading=>'Applications flex 06'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461569108711058037)
,p_query_column_id=>24
,p_column_alias=>'APPLICATIONS_FLEX_07'
,p_column_display_sequence=>24
,p_column_heading=>'Applications flex 07'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461569263730058038)
,p_query_column_id=>25
,p_column_alias=>'APPLICATIONS_FLEX_08'
,p_column_display_sequence=>25
,p_column_heading=>'Applications flex 08'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461569307794058039)
,p_query_column_id=>26
,p_column_alias=>'APPLICATIONS_FLEX_N01'
,p_column_display_sequence=>26
,p_column_heading=>'Applications flex n01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461569370947058040)
,p_query_column_id=>27
,p_column_alias=>'APPLICATIONS_FLEX_N02'
,p_column_display_sequence=>27
,p_column_heading=>'Applications flex n02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461569478820058041)
,p_query_column_id=>28
,p_column_alias=>'APPLICATIONS_FLEX_N03'
,p_column_display_sequence=>28
,p_column_heading=>'Applications flex n03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513763608583462892)
,p_query_column_id=>29
,p_column_alias=>'APPLICATIONS_FLEX_N04'
,p_column_display_sequence=>29
,p_column_heading=>'Applications flex n04'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513763667286462893)
,p_query_column_id=>30
,p_column_alias=>'APPLICATIONS_FLEX_D01'
,p_column_display_sequence=>30
,p_column_heading=>'Applications flex d01'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513763824133462894)
,p_query_column_id=>31
,p_column_alias=>'APPLICATIONS_FLEX_D02'
,p_column_display_sequence=>31
,p_column_heading=>'Applications flex d02'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513763893406462895)
,p_query_column_id=>32
,p_column_alias=>'APPLICATIONS_FLEX_D03'
,p_column_display_sequence=>32
,p_column_heading=>'Applications flex d03'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4513764058441462896)
,p_query_column_id=>33
,p_column_alias=>'APPLICATIONS_FLEX_D04'
,p_column_display_sequence=>33
,p_column_heading=>'Applications flex d04'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4461566146707058007)
,p_query_column_id=>34
,p_column_alias=>'APPLICATIONS_FLEX_CLOB'
,p_column_display_sequence=>34
,p_column_heading=>'Applications flex clob'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select null from eba_stds_flex_registry where flexible_table = ''EBA_STDS_APPLICATIONS'' and flexible_column = ''APPLICATION_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4426429675221748031)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439222394230548202)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(8850087331635351449)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(4439237769043548253)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4445538976818060393)
,p_plug_name=>'Last Updated'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(4439219934126548197)
,p_plug_display_sequence=>80
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_updated_on, ''Last Updated'' lbl',
'from apex_applications',
'where application_id = :P34_APEX_APP_ID'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.MINICALENDAR'
,p_attribute_01=>'LAST_UPDATED_ON'
,p_attribute_02=>'LBL'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5133987943739637101)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4439206249279548174)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5427755814034463905)
,p_plug_name=>'Standards'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(4439219934126548197)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(4426424773420748013)
,p_name=>'Standards'
,p_parent_plug_id=>wwv_flow_api.id(5427755814034463905)
,p_template=>wwv_flow_api.id(4439219934126548197)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select standard_id, standard, lead, date_started, status, link_col',
'from (',
'    select nf.id standard_id,',
'        nf.name standard,',
'        primary_developer lead,',
'        date_started,',
'        ( select floor(avg(ss.pass_fail_pct))',
'          from eba_stds_standard_statuses ss',
'          where ss.application_id = na.id',
'              and ss.standard_id = nf.id ) status,',
'        null link_col',
'    from eba_stds_standards nf,',
'        eba_stds_standard_type_ref nftr,',
'        eba_stds_applications na',
'    where na.apex_app_id = :P34_APEX_APP_ID',
'        and nftr.type_id = na.type_id',
'        and nf.id = nftr.standard_id',
'    )',
'where ( :P34_COMPLETION is null',
'        or ( :P34_COMPLETION = ''O'' and status < 100 )',
'        or ( :P34_COMPLETION = ''I'' and status >= 100 )',
'    )',
'order by lower(standard)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P34_APEX_APP_ID,P34_COMPLETION'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_api.id(4439226544631548215)
,p_query_num_rows=>200
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No standards found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
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
 p_id=>wwv_flow_api.id(4437666468463973082)
,p_query_column_id=>1
,p_column_alias=>'STANDARD_ID'
,p_column_display_sequence=>5
,p_column_heading=>'Standard Id'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426444385809926337)
,p_query_column_id=>2
,p_column_alias=>'STANDARD'
,p_column_display_sequence=>1
,p_column_heading=>'Standard'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:#STANDARD_ID#'
,p_column_linktext=>'#STANDARD#'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426444486061926338)
,p_query_column_id=>3
,p_column_alias=>'LEAD'
,p_column_display_sequence=>2
,p_column_heading=>'Lead'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426444566161926338)
,p_query_column_id=>4
,p_column_alias=>'DATE_STARTED'
,p_column_display_sequence=>3
,p_column_heading=>'Date Started'
,p_use_as_row_header=>'N'
,p_column_format=>'Since'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4426444685492926338)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_column_format=>'PCT_GRAPH:#E2ECF8:#5284C1:'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(4587633478577440802)
,p_query_column_id=>6
,p_column_alias=>'LINK_COL'
,p_column_display_sequence=>6
,p_column_heading=>'<span class="visuallyhidden">Actions</span>'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_APPLICATION_ID,P20_ID:&P34_ID.,#STANDARD_ID#:'
,p_column_linktext=>'View Details'
,p_column_link_attr=>'class="t-Button t-Button--warning t-Button--stretch"'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5427755667871463904)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_api.id(5427755814034463905)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4439206381386548176)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5461916467301282344)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(4426423569100748011)
,p_button_name=>'FORCE_TEST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'Run All Tests'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4426423964147748012)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4426429675221748031)
,p_button_name=>'EDIT_DETAILS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Details'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17:P17_ID:&P34_ID.'
,p_security_scheme=>wwv_flow_api.id(7645782889922775014)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4589636247147678409)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4426423569100748011)
,p_button_name=>'EDIT_APPLICATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'Edit Application'
,p_button_position=>'NEXT'
,p_button_condition=>'APX_BLDR_SESSION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_required_patch=>wwv_flow_api.id(4587914972033536419)
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4589489158146950040)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(4426423569100748011)
,p_button_name=>'RUN_ADVISOR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'APEX Advisor'
,p_button_position=>'NEXT'
,p_button_condition=>'APX_BLDR_SESSION'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_required_patch=>wwv_flow_api.id(4587914972033536419)
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4426426164993748020)
,p_name=>'P34_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(4426425972008748020)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4426433769111782160)
,p_name=>'P34_APEX_APP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4426425972008748020)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_app_id',
'from eba_stds_applications',
'where id = :P34_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4437665372585940755)
,p_name=>'P34_STANDARD_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4426425972008748020)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4521321675828662468)
,p_name=>'P34_APPLICATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4426425972008748020)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5461904836212204433)
,p_name=>'P34_COMPLETION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5427755667871463904)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Non-Passing;O,Passing;I'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Standards -'
,p_cHeight=>1
,p_tag_css_classes=>'filter_input'
,p_field_template=>wwv_flow_api.id(4439236719731548242)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4521321860732669537)
,p_computation_sequence=>10
,p_computation_item=>'P34_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select na.id',
'from eba_stds_applications na',
'where na.apex_app_id = :P34_APEX_APP_ID'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(93108841278037546)
,p_computation_sequence=>20
,p_computation_item=>'P34_APPLICATION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_app_id||'' - ''||aa.application_name',
'from eba_stds_applications sa ',
'inner join apex_applications aa on sa.apex_app_id = aa.application_id',
'where apex_app_id = :P34_APEX_APP_ID'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4586631875192923228)
,p_computation_sequence=>30
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'APP_PAGE_ID'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4508356146038009693)
,p_name=>'edit app'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4589636247147678409)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4508356170847009694)
,p_event_id=>wwv_flow_api.id(4508356146038009693)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.openInNewWindow(''f?p=4000:1:&APX_BLDR_SESSION.::NO:RP:FB_FLOW_ID,F4000_P1_FLOW:'' +',
'    $v(''P34_APEX_APP_ID'') + '','' + $v(''P34_APEX_APP_ID''),',
'    ''APEX_BUILDER'',',
'    {altSuffix:''&APX_BLDR_SESSION.'',favorTabbedBrowsing: true});'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4508356333838009695)
,p_name=>'advisor'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4589489158146950040)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4508356416555009696)
,p_event_id=>wwv_flow_api.id(4508356333838009695)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.navigation.openInNewWindow(''f?p=4000:674:&APX_BLDR_SESSION.::NO:RP:FB_FLOW_ID,F4000_P1_FLOW:'' +',
'    $v(''P34_APEX_APP_ID'') + '','' + $v(''P34_APEX_APP_ID''),',
'    ''APEX_BUILDER'',',
'    {altSuffix:''&APX_BLDR_SESSION.'',favorTabbedBrowsing: true});'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5427755469632463902)
,p_name=>'Refresh Standards'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P34_COMPLETION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5427755635687463903)
,p_event_id=>wwv_flow_api.id(5427755469632463902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(4426424773420748013)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5461916666169287022)
,p_name=>'Re-test this application'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5461916467301282344)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5461917151670287025)
,p_event_id=>wwv_flow_api.id(5461916666169287022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_stds_standard_statuses',
'where application_id = :P34_ID;'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5461917579676287026)
,p_event_id=>wwv_flow_api.id(5461916666169287022)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'FORCE_TEST'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4437679895164381603)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Determine Application Prefix'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_names apex_application_global.vc_arr2;',
'    l_prefix varchar2(30) := '''';',
'begin',
'    for c1 in (',
'            select aso.required_names_available names',
'            from apex_application_supp_objects aso,',
'                eba_stds_applications na',
'            where aso.application_id = na.apex_app_id',
'                and na.apex_app_id = :P34_APEX_APP_ID ) loop',
'        l_names := apex_util.string_to_table( c1.names, '':'' );',
'    end loop;',
'    for z in 1..l_names.count loop',
'        if l_prefix is null then',
'            l_prefix := l_names(z);',
'        else',
'            for x in 1..length(l_prefix) loop',
'                if substr(l_prefix,1,x) = substr(l_names(z),1,x) then',
'                    null; -- keep going',
'                else',
'                    l_prefix := substr(l_prefix,1,x-1);',
'                    exit;',
'                end if;',
'            end loop;',
'        end if;',
'    end loop;',
'',
'    update eba_stds_applications',
'    set prefix = rtrim(l_prefix,''_'')',
'    where apex_app_id = :P34_APEX_APP_ID;',
'',
'    commit;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id',
'from eba_stds_applications',
'where id = :P34_ID',
'    and prefix is null'))
,p_process_when_type=>'EXISTS'
);
wwv_flow_api.component_end;
end;
/
