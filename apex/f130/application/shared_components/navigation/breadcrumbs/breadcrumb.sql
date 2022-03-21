prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU:  Breadcrumb
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(8774575671518206136)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2937104233293000235)
,p_parent_id=>wwv_flow_api.id(4351496912769324464)
,p_short_name=>'Full Report : &P15_TEST_NAME.'
,p_long_name=>'Full Report : &P15_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(3984756983000913219)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Application Appearance'
,p_link=>'f?p=&APP_ID.:37:&SESSION.'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4350903027702521499)
,p_short_name=>'Applications'
,p_link=>'f?p=&FLOW_ID.:6:&SESSION.'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4350907319074529418)
,p_parent_id=>wwv_flow_api.id(4350903027702521499)
,p_short_name=>'Add Applications'
,p_link=>'f?p=&APP_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4350918217424602718)
,p_parent_id=>wwv_flow_api.id(4350903027702521499)
,p_short_name=>'&P34_APPLICATION.'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4350938126408792342)
,p_parent_id=>wwv_flow_api.id(4350918217424602718)
,p_short_name=>'Application'
,p_link=>'f?p=&APP_ID.:17:&SESSION.'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4351060111328976270)
,p_short_name=>'Standards'
,p_link=>'f?p=&APP_ID.:3:&SESSION.'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4351496912769324464)
,p_parent_id=>wwv_flow_api.id(4351060111328976270)
,p_short_name=>'&P5_STANDARD.'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4351504718007359748)
,p_parent_id=>wwv_flow_api.id(4351496912769324464)
,p_short_name=>'Standard'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4352735534569366271)
,p_parent_id=>wwv_flow_api.id(4351496912769324464)
,p_short_name=>'Automated Test'
,p_link=>'f?p=&APP_ID.:14:&SESSION.'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4352761612386784234)
,p_parent_id=>wwv_flow_api.id(4350903027702521499)
,p_short_name=>'Grid Edit'
,p_link=>'f?p=&APP_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4368178810095391131)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Application Types'
,p_link=>'f?p=&APP_ID.:23:&SESSION.'
,p_page_id=>23
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4368179517631391140)
,p_parent_id=>wwv_flow_api.id(4368178810095391131)
,p_short_name=>'Application Type'
,p_link=>'f?p=&APP_ID.:24:&SESSION.'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4368287835538449193)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Application Statuses'
,p_link=>'f?p=&APP_ID.:25:&SESSION.'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4368288518066449194)
,p_parent_id=>wwv_flow_api.id(4368287835538449193)
,p_short_name=>'Application Status'
,p_link=>'f?p=&APP_ID.:29:&SESSION.'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4438513375064808720)
,p_parent_id=>wwv_flow_api.id(5386050429628926047)
,p_short_name=>'Preferences'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4447122595267899740)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Manage Sample Standard'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4511111702362424253)
,p_parent_id=>wwv_flow_api.id(4351496912769324464)
,p_short_name=>'Test Results : &P19_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4513203596296377046)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Automated Testing Job Status'
,p_link=>'f?p=&APP_ID.:21:&SESSION.'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5053584432724947915)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Build Options'
,p_link=>'f?p=&APP_ID.:9:&SESSION.'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5057485632426570629)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Username Format'
,p_link=>'f?p=&APP_ID.:13:&SESSION.'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5058996608474284657)
,p_parent_id=>wwv_flow_api.id(7873858976400604170)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::'
,p_page_id=>53
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5058997619642293148)
,p_parent_id=>wwv_flow_api.id(7873858976400604170)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:::'
,p_page_id=>54
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5386050429628926047)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5691838144303017269)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Page Security'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5705250344511928622)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Rename Application'
,p_link=>'f?p=&FLOW_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7318291529188018866)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Notifications'
,p_link=>'f?p=&FLOW_ID.:30:&SESSION.'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7318385640790031198)
,p_parent_id=>wwv_flow_api.id(7318291529188018866)
,p_short_name=>'Notification'
,p_link=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_page_id=>31
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7582459552834085032)
,p_parent_id=>wwv_flow_api.id(4438513375064808720)
,p_short_name=>'Time Zone'
,p_link=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:::'
,p_page_id=>45
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7601257250873659360)
,p_short_name=>'Help'
,p_link=>'f?p=&FLOW_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7682412548589272701)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Application Error Log'
,p_link=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:::'
,p_page_id=>175
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7712417255889138406)
,p_parent_id=>wwv_flow_api.id(8793139366824042710)
,p_short_name=>'Activity Calendar'
,p_link=>'f?p=&FLOW_ID.:42:&SESSION.'
,p_page_id=>42
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7873858976400604170)
,p_parent_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Access Control List'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7873859258797604171)
,p_parent_id=>wwv_flow_api.id(7873858976400604170)
,p_short_name=>'User Access Control'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8793139366824042710)
,p_parent_id=>0
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8793141191609048321)
,p_short_name=>'Administration'
,p_link=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8794359461643699172)
,p_parent_id=>wwv_flow_api.id(8793139366824042710)
,p_short_name=>'Top Users'
,p_link=>'f?p=&FLOW_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8794407972837712881)
,p_parent_id=>wwv_flow_api.id(8793139366824042710)
,p_short_name=>'Page Views'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.component_end;
end;
/
