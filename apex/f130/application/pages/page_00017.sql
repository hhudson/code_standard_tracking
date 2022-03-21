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
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(5518741433308135589)
,p_name=>'Application'
,p_alias=>'APPLICATION'
,p_page_mode=>'MODAL'
,p_step_title=>'Application'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_api.id(4363691278238402856)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(7570271229805629701)
,p_dialog_height=>'600'
,p_dialog_width=>'720'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4179261260504523505)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_api.id(4363694721269402863)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4238395731748093497)
,p_plug_name=>'Custom Attributes'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(4363705025657402876)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4350936128223792334)
,p_plug_name=>'Packaged Application Details'
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4350937917094792342)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363710734113402889)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(8774575671518206136)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(4363726108926402940)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350936327938792336)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(4179261260504523505)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Cancel'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350936514800792338)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(4179261260504523505)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_image_alt=>'Delete'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P17_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350936907941792338)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(4179261260504523505)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Application'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P17_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4350936717491792338)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(4179261260504523505)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_api.id(4363725938792402939)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P17_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5111315149072323510)
,p_branch_name=>'On Delete'
,p_branch_action=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(4350936514800792338)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(4350938915369792343)
,p_branch_name=>'Go To Page 34'
,p_branch_action=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238395673009093496)
,p_name=>'P17_FLEX_01'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238395882825093498)
,p_name=>'P17_FLEX_02'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238395966918093499)
,p_name=>'P17_FLEX_03'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396083810093500)
,p_name=>'P17_FLEX_04'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396110277093501)
,p_name=>'P17_FLEX_05'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396265196093502)
,p_name=>'P17_FLEX_06'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396360477093503)
,p_name=>'P17_FLEX_07'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396492158093504)
,p_name=>'P17_FLEX_08'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396588662093505)
,p_name=>'P17_FLEX_N01'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396697296093506)
,p_name=>'P17_FLEX_N02'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396758098093507)
,p_name=>'P17_FLEX_N03'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396811026093508)
,p_name=>'P17_FLEX_N04'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238396967627093509)
,p_name=>'P17_FLEX_D01'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238397071435093510)
,p_name=>'P17_FLEX_D02'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238397168446093511)
,p_name=>'P17_FLEX_D03'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238397284691093512)
,p_name=>'P17_FLEX_D04'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4238397339085093513)
,p_name=>'P17_FLEX_CLOB'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(4238395731748093497)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4350937106745792338)
,p_name=>'P17_APEX_APP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4350937329805792339)
,p_name=>'P17_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4350937519747792339)
,p_name=>'P17_TAGS'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4350944210989833498)
,p_name=>'P17_STATUS'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
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
,p_field_template=>wwv_flow_api.id(4363725186793402931)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4350944832327838793)
,p_name=>'P17_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
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
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'B'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4350945414211847171)
,p_name=>'P17_PREFIX'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Object Prefix'
,p_post_element_text=>'<div class="infoTextRegion"><p>If left blank, the Object Prefix is automatically detected based off of the Object Names defined in the application''s Supporting Objects.</p></div>'
,p_source=>'PREFIX'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(4363725059614402929)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'B'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4350945634902852783)
,p_name=>'P17_LAST_ADVISOR_DATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Advisor Run'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_source=>'LAST_ADVISOR_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(4363725059614402929)
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
 p_id=>wwv_flow_api.id(4350946028864855542)
,p_name=>'P17_LAST_SECURITY_DATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Security Check'
,p_format_mask=>'&APP_DATE_TIME_FORMAT.'
,p_source=>'LAST_SECURITY_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(4363725059614402929)
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
 p_id=>wwv_flow_api.id(4514089191515640458)
,p_name=>'P17_TODAY'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(4350936128223792334)
,p_use_cache_before_default=>'NO'
,p_source=>'to_char(localtimestamp,:APP_DATE_TIME_FORMAT)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'B'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3135300512547196812)
,p_name=>'Cancel Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4350936327938792336)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3135300639383196813)
,p_event_id=>wwv_flow_api.id(3135300512547196812)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4350938203844792342)
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
 p_id=>wwv_flow_api.id(4350938431900792343)
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
 p_id=>wwv_flow_api.id(4350938621453792343)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(4350936514800792338)
);
wwv_flow_api.component_end;
end;
/
