prompt --application/pages/page_00017
begin
--   Manifest
--     PAGE: 00017
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
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(5556384169945677648)
,p_name=>'Application'
,p_alias=>'APPLICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Application'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(4401334014875944915)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7607913966443171760)
,p_dialog_height=>'600'
,p_dialog_width=>'720'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4216903997142065564)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4401337457906944922)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4276038468385635556)
,p_plug_name=>'Custom Attributes'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(4401347762294944935)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4388578864861334393)
,p_plug_name=>'Packaged Application Details'
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4388580653732334401)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4401353470750944948)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(8812218408155748195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(4401368845563944999)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4388579064576334395)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4216903997142065564)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4401368675429944998)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4388579251438334397)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4216903997142065564)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4401368675429944998)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P17_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4388579644579334397)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4216903997142065564)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4401368675429944998)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Application'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P17_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4388579454129334397)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4216903997142065564)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4401368675429944998)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P17_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5148957885709865569)
,p_branch_name=>'On Delete'
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4388579251438334397)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4388581652007334402)
,p_branch_name=>'Go To Page 34'
,p_branch_action=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276038409646635555)
,p_name=>'P17_FLEX_01'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 01'
,p_source=>'APPLICATIONS_FLEX_01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276038619462635557)
,p_name=>'P17_FLEX_02'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 02'
,p_source=>'APPLICATIONS_FLEX_02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276038703555635558)
,p_name=>'P17_FLEX_03'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 03'
,p_source=>'APPLICATIONS_FLEX_03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276038820447635559)
,p_name=>'P17_FLEX_04'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 04'
,p_source=>'APPLICATIONS_FLEX_04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276038846914635560)
,p_name=>'P17_FLEX_05'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 05'
,p_source=>'APPLICATIONS_FLEX_05'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_05'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039001833635561)
,p_name=>'P17_FLEX_06'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 06'
,p_source=>'APPLICATIONS_FLEX_06'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_06'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039097114635562)
,p_name=>'P17_FLEX_07'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 07'
,p_source=>'APPLICATIONS_FLEX_07'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_07'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039228795635563)
,p_name=>'P17_FLEX_08'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 08'
,p_source=>'APPLICATIONS_FLEX_08'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_08'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039325299635564)
,p_name=>'P17_FLEX_N01'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex N01'
,p_source=>'APPLICATIONS_FLEX_N01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_N01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039433933635565)
,p_name=>'P17_FLEX_N02'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex N02'
,p_source=>'APPLICATIONS_FLEX_N02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_N02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039494735635566)
,p_name=>'P17_FLEX_N03'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 03'
,p_source=>'APPLICATIONS_FLEX_N03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_N03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039547663635567)
,p_name=>'P17_FLEX_N04'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex 04'
,p_source=>'APPLICATIONS_FLEX_N04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_N04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039704264635568)
,p_name=>'P17_FLEX_D01'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex D01'
,p_source=>'APPLICATIONS_FLEX_D01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_D01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039808072635569)
,p_name=>'P17_FLEX_D02'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex D02'
,p_source=>'APPLICATIONS_FLEX_D02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_D02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276039905083635570)
,p_name=>'P17_FLEX_D03'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex D03'
,p_source=>'APPLICATIONS_FLEX_D03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_D03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276040021328635571)
,p_name=>'P17_FLEX_D04'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex D04'
,p_source=>'APPLICATIONS_FLEX_D04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_D04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4276040075722635572)
,p_name=>'P17_FLEX_CLOB'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(4276038468385635556)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Flex CLOB'
,p_source=>'APPLICATIONS_FLEX_CLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_stds_flex_registry',
' where flexible_table = ''EBA_STDS_APPLICATIONS''',
'   and active_yn = ''Y''',
'   and flexible_column = ''APPLICATIONS_FLEX_CLOB'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388579843383334397)
,p_name=>'P17_APEX_APP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'APEX Application'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.application_id||''. ''||a.application_name',
'from apex_applications a,',
'    eba_stds_applications na',
'where a.application_id = na.apex_app_id',
'    and na.id = :P17_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388580066443334398)
,p_name=>'P17_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388580256385334398)
,p_name=>'P17_TAGS'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388586947627375557)
,p_name=>'P17_STATUS'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source=>'STATUS_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as display_value, ID as return_value ',
'  from EBA_STDS_APP_STATUSES',
' order by display_sequence, lower(name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Status -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(4401367923430944990)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388587568965380852)
,p_name=>'P17_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Type'
,p_source=>'TYPE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NAME as display_value, ID as return_value ',
'  from EBA_STDS_TYPES',
' order by display_sequence, lower(name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Status -'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388588150849389230)
,p_name=>'P17_PREFIX'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Object Prefix'
,p_post_element_text=>'<div class="infoTextRegion"><p>If left blank, the Object Prefix is automatically detected based off of the Object Names defined in the application''s Supporting Objects.</p></div>'
,p_source=>'PREFIX'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388588371540394842)
,p_name=>'P17_LAST_ADVISOR_DATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Advisor Run'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_source=>'LAST_ADVISOR_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'Today'
,p_quick_pick_value_01=>'&P17_TODAY.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4388588765502397601)
,p_name=>'P17_LAST_SECURITY_DATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Security Check'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_source=>'LAST_SECURITY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(4401367796251944988)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'Today'
,p_quick_pick_value_01=>'&P17_TODAY.'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4551731928153182517)
,p_name=>'P17_TODAY'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(4388578864861334393)
,p_use_cache_before_default=>'NO'
,p_source=>'to_char(localtimestamp,:APP_DATE_TIME_FORMAT)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3172943249184738871)
,p_name=>'Cancel Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4388579064576334395)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3172943376020738872)
,p_event_id=>wwv_flow_api.id(3172943249184738871)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4388580940482334401)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_STDS_APPLICATIONS'
,p_attribute_02=>'EBA_STDS_APPLICATIONS'
,p_attribute_03=>'P17_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4388581168538334402)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_STDS_APPLICATIONS'
,p_attribute_02=>'EBA_STDS_APPLICATIONS'
,p_attribute_03=>'P17_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_attribute_12=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4388581358091334402)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4388579251438334397)
);
wwv_flow_api.component_end;
end;
/
