prompt --application/pages/page_00036
begin
--   Manifest
--     PAGE: 00036
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
 p_id=>36
,p_user_interface_id=>wwv_flow_api.id(5518741433308135589)
,p_name=>'Preferences'
,p_alias=>'PREFERENCES'
,p_step_title=>'Preferences'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_upd_yyyymmddhh24miss=>'20200116130021'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4438253183801317591)
,p_plug_name=>'Preferences'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363708274009402884)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_list_id=>wwv_flow_api.id(7582478635082623779)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(4363721319281402914)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4438253253063317592)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(4363710734113402889)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(8774575671518206136)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(4363726108926402940)
);
wwv_flow_api.component_end;
end;
/
