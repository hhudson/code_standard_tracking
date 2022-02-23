prompt --application/shared_components/navigation/lists/automated_testing_job
begin
--   Manifest
--     LIST: Automated Testing Job
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(2000563735588054201)
,p_name=>'Automated Testing Job'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2000563943686054204)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Enable Automated Testing Job'
,p_list_item_link_target=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-play-circle-o'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'P4_JOB_STATUS'
,p_list_item_disp_condition2=>'SCHEDULED'
,p_list_text_01=>'The automated testing job runs once a day to ensure that all applications are tested when they are modified, preventing unnecessary delays when users access this application.'
,p_list_text_02=>'switchIcon'
,p_security_scheme=>wwv_flow_api.id(5057645067995553528)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2000565733472068300)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Disable Automated Testing Job'
,p_list_item_link_target=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-stop'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_list_item_disp_condition=>'P4_JOB_STATUS'
,p_list_item_disp_condition2=>'SCHEDULED'
,p_list_text_01=>'The automated testing job runs once a day to ensure that all applications are tested when they are modified, preventing unnecessary delays when users access this application.'
,p_list_text_02=>'switchIcon'
,p_security_scheme=>wwv_flow_api.id(5057645067995553528)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(2000579440329384164)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Automated Testing Job Status'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-question'
,p_list_text_01=>'The automated testing job should run regularly. Use this report to review the status of the job.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.component_end;
end;
/
