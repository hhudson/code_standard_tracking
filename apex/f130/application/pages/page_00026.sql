prompt --application/pages/page_00026
begin
--   Manifest
--     PAGE: 00026
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
 p_id=>26
,p_user_interface_id=>wwv_flow_api.id(5594253093425280902)
,p_name=>'Access Control List'
,p_alias=>'MANAGE_ACL'
,p_page_mode=>'MODAL'
,p_step_title=>'Access Control List'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_api.id(5767351611172177240)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_api.id(7645782398149775003)
,p_protection_level=>'C'
,p_help_text=>'When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. This application supports the following 3 access levels; Reader, Contributor and Administrator. Readers have '
||'read-only access and can also view reports. Contributors can additionally create, edit, delete content. Administrators, in addition to Contributor''s capability, can also perform application administration, including configuration of access control, m'
||'anaging application look-up data.'
,p_last_updated_by=>'CELARA'
,p_last_upd_yyyymmddhh24miss=>'20200128120333'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7949369136220749475)
,p_plug_name=>'Users'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_api.id(4439219427293548192)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'       username,',
'       access_level_id,',
'       case when account_locked = ''Y'' then ''Yes'' else ''No'' end account_locked,',
'       created_by,',
'       created',
'  from eba_stds_users',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(7949369330692749475)
,p_name=>'Administrative Access Control List'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::P27_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'MIKE'
,p_internal_uid=>2833446445244297046
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7949369420026749480)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7949369611529749480)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7645798714041826956)
,p_db_column_name=>'USERNAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7645798816638826960)
,p_db_column_name=>'ACCESS_LEVEL_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Access Level'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(7645801290888945247)
,p_rpt_show_filter_lov=>'1'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7645798885949826960)
,p_db_column_name=>'ACCOUNT_LOCKED'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Account Locked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5120861969808754558)
,p_db_column_name=>'CREATED'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7949371031946749665)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'59839'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'USERNAME:ACCESS_LEVEL_ID:CREATED'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'USERNAME'
,p_sort_direction_2=>'ASC'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5795718805190355640)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(7949369136220749475)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439236916357548246)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5131545891738677160)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(7949369136220749475)
,p_button_name=>'BULK_LOAD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_image_alt=>'Add Multiple Users'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:53::'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(7949370128622749483)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(7949369136220749475)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(4439237598909548252)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:27::'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3119265168909150705)
,p_name=>'Refresh on Add'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(7949370128622749483)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3119265349228150706)
,p_event_id=>wwv_flow_api.id(3119265168909150705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7949369136220749475)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3119265438749150707)
,p_name=>'Refresh on Edit'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(7949369136220749475)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3119265492862150708)
,p_event_id=>wwv_flow_api.id(3119265438749150707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7949369136220749475)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3119266071995150714)
,p_name=>'Refresh on Bulk Add'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5131545891738677160)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3119266221021150715)
,p_event_id=>wwv_flow_api.id(3119266071995150714)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(7949369136220749475)
);
wwv_flow_api.component_end;
end;
/
