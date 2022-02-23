prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU:  Breadcrumb
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(6261950001481129974)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1472131312963837057)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Application Appearance'
,p_link=>'f?p=&APP_ID.:37:&SESSION.'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1838277357665445337)
,p_short_name=>'Applications'
,p_link=>'f?p=&FLOW_ID.:6:&SESSION.'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1838281649037453256)
,p_parent_id=>wwv_flow_api.id(1838277357665445337)
,p_short_name=>'Add Applications'
,p_link=>'f?p=&APP_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1838292547387526556)
,p_parent_id=>wwv_flow_api.id(1838277357665445337)
,p_short_name=>'&P34_APPLICATION.'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1838312456371716180)
,p_parent_id=>wwv_flow_api.id(1838292547387526556)
,p_short_name=>'Application'
,p_link=>'f?p=&APP_ID.:17:&SESSION.'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1838434441291900108)
,p_short_name=>'Standards'
,p_link=>'f?p=&APP_ID.:3:&SESSION.'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1838871242732248302)
,p_parent_id=>wwv_flow_api.id(1838434441291900108)
,p_short_name=>'&P5_STANDARD.'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1838879047970283586)
,p_parent_id=>wwv_flow_api.id(1838871242732248302)
,p_short_name=>'Standard'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1840109864532290109)
,p_parent_id=>wwv_flow_api.id(1838871242732248302)
,p_short_name=>'Automated Test'
,p_link=>'f?p=&APP_ID.:14:&SESSION.'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1840135942349708072)
,p_parent_id=>wwv_flow_api.id(1838277357665445337)
,p_short_name=>'Grid Edit'
,p_link=>'f?p=&APP_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1855553140058314969)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Application Types'
,p_link=>'f?p=&APP_ID.:23:&SESSION.'
,p_page_id=>23
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1855553847594314978)
,p_parent_id=>wwv_flow_api.id(1855553140058314969)
,p_short_name=>'Application Type'
,p_link=>'f?p=&APP_ID.:24:&SESSION.'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1855662165501373031)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Application Statuses'
,p_link=>'f?p=&APP_ID.:25:&SESSION.'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1855662848029373032)
,p_parent_id=>wwv_flow_api.id(1855662165501373031)
,p_short_name=>'Application Status'
,p_link=>'f?p=&APP_ID.:29:&SESSION.'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1925887705027732558)
,p_parent_id=>wwv_flow_api.id(2873424759591849885)
,p_short_name=>'Preferences'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1934496925230823578)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Manage Sample Standard'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1998486032325348091)
,p_parent_id=>wwv_flow_api.id(1838871242732248302)
,p_short_name=>'Test Results'
,p_link=>'f?p=&APP_ID.:19:&SESSION.'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2000577926259300884)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Automated Testing Job Status'
,p_link=>'f?p=&APP_ID.:21:&SESSION.'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2540958762687871753)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Build Options'
,p_link=>'f?p=&APP_ID.:9:&SESSION.'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2544859962389494467)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Username Format'
,p_link=>'f?p=&APP_ID.:13:&SESSION.'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2546370938437208495)
,p_parent_id=>wwv_flow_api.id(5361233306363528008)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::'
,p_page_id=>53
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2546371949605216986)
,p_parent_id=>wwv_flow_api.id(5361233306363528008)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:::'
,p_page_id=>54
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2873424759591849885)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(3179212474265941107)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Page Security'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(3192624674474852460)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Rename Application'
,p_link=>'f?p=&FLOW_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4805665859150942704)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Notifications'
,p_link=>'f?p=&FLOW_ID.:30:&SESSION.'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4805759970752955036)
,p_parent_id=>wwv_flow_api.id(4805665859150942704)
,p_short_name=>'Notification'
,p_link=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_page_id=>31
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5069833882797008870)
,p_parent_id=>wwv_flow_api.id(1925887705027732558)
,p_short_name=>'Time Zone'
,p_link=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:::'
,p_page_id=>45
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5088631580836583198)
,p_short_name=>'Help'
,p_link=>'f?p=&FLOW_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5169786878552196539)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Application Error Log'
,p_link=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:::'
,p_page_id=>175
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5199791585852062244)
,p_parent_id=>wwv_flow_api.id(6280513696786966548)
,p_short_name=>'Activity Calendar'
,p_link=>'f?p=&FLOW_ID.:42:&SESSION.'
,p_page_id=>42
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5361233306363528008)
,p_parent_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Access Control List'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5361233588760528009)
,p_parent_id=>wwv_flow_api.id(5361233306363528008)
,p_short_name=>'User Access Control'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6280513696786966548)
,p_parent_id=>0
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6280515521571972159)
,p_short_name=>'Administration'
,p_link=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6281733791606623010)
,p_parent_id=>wwv_flow_api.id(6280513696786966548)
,p_short_name=>'Top Users'
,p_link=>'f?p=&FLOW_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(6281782302800636719)
,p_parent_id=>wwv_flow_api.id(6280513696786966548)
,p_short_name=>'Page Views'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.component_end;
end;
/
