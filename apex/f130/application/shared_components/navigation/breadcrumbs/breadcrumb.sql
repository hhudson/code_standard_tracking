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
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(8831062136692715947)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2993590698467510046)
,p_parent_id=>wwv_flow_api.id(4407983377943834275)
,p_short_name=>'Full Report : &P15_TEST_NAME.'
,p_long_name=>'Full Report : &P15_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4041243448175423030)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Application Appearance'
,p_link=>'f?p=&APP_ID.:37:&SESSION.'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4407389492877031310)
,p_short_name=>'Applications'
,p_link=>'f?p=&FLOW_ID.:6:&SESSION.'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4407393784249039229)
,p_parent_id=>wwv_flow_api.id(4407389492877031310)
,p_short_name=>'Add Applications'
,p_link=>'f?p=&APP_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4407404682599112529)
,p_parent_id=>wwv_flow_api.id(4407389492877031310)
,p_short_name=>'&P34_APPLICATION.'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4407424591583302153)
,p_parent_id=>wwv_flow_api.id(4407404682599112529)
,p_short_name=>'Application'
,p_link=>'f?p=&APP_ID.:17:&SESSION.'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4407546576503486081)
,p_short_name=>'Standards'
,p_link=>'f?p=&APP_ID.:3:&SESSION.'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4407983377943834275)
,p_parent_id=>wwv_flow_api.id(4407546576503486081)
,p_short_name=>'&P5_STANDARD.'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4407991183181869559)
,p_parent_id=>wwv_flow_api.id(4407983377943834275)
,p_short_name=>'Standard'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4409221999743876082)
,p_parent_id=>wwv_flow_api.id(4407983377943834275)
,p_short_name=>'Automated Test'
,p_link=>'f?p=&APP_ID.:14:&SESSION.'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4409248077561294045)
,p_parent_id=>wwv_flow_api.id(4407389492877031310)
,p_short_name=>'Grid Edit'
,p_link=>'f?p=&APP_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4424665275269900942)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Application Types'
,p_link=>'f?p=&APP_ID.:23:&SESSION.'
,p_page_id=>23
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4424665982805900951)
,p_parent_id=>wwv_flow_api.id(4424665275269900942)
,p_short_name=>'Application Type'
,p_link=>'f?p=&APP_ID.:24:&SESSION.'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4424774300712959004)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Application Statuses'
,p_link=>'f?p=&APP_ID.:25:&SESSION.'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4424774983240959005)
,p_parent_id=>wwv_flow_api.id(4424774300712959004)
,p_short_name=>'Application Status'
,p_link=>'f?p=&APP_ID.:29:&SESSION.'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4494999840239318531)
,p_parent_id=>wwv_flow_api.id(5442536894803435858)
,p_short_name=>'Preferences'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4503609060442409551)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Manage Sample Standard'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4567598167536934064)
,p_parent_id=>wwv_flow_api.id(4407983377943834275)
,p_short_name=>'Test Results : &P19_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4569690061470886857)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Automated Testing Job Status'
,p_link=>'f?p=&APP_ID.:21:&SESSION.'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5110070897899457726)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Build Options'
,p_link=>'f?p=&APP_ID.:9:&SESSION.'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5113972097601080440)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Username Format'
,p_link=>'f?p=&APP_ID.:13:&SESSION.'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5115483073648794468)
,p_parent_id=>wwv_flow_api.id(7930345441575113981)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::'
,p_page_id=>53
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5115484084816802959)
,p_parent_id=>wwv_flow_api.id(7930345441575113981)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:::'
,p_page_id=>54
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5442536894803435858)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5748324609477527080)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Page Security'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5761736809686438433)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Rename Application'
,p_link=>'f?p=&FLOW_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7374777994362528677)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Notifications'
,p_link=>'f?p=&FLOW_ID.:30:&SESSION.'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7374872105964541009)
,p_parent_id=>wwv_flow_api.id(7374777994362528677)
,p_short_name=>'Notification'
,p_link=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_page_id=>31
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7638946018008594843)
,p_parent_id=>wwv_flow_api.id(4494999840239318531)
,p_short_name=>'Time Zone'
,p_link=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:::'
,p_page_id=>45
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7657743716048169171)
,p_short_name=>'Help'
,p_link=>'f?p=&FLOW_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7738899013763782512)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Application Error Log'
,p_link=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:::'
,p_page_id=>175
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7768903721063648217)
,p_parent_id=>wwv_flow_api.id(8849625831998552521)
,p_short_name=>'Activity Calendar'
,p_link=>'f?p=&FLOW_ID.:42:&SESSION.'
,p_page_id=>42
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7930345441575113981)
,p_parent_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Access Control List'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7930345723972113982)
,p_parent_id=>wwv_flow_api.id(7930345441575113981)
,p_short_name=>'User Access Control'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8849625831998552521)
,p_parent_id=>0
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8849627656783558132)
,p_short_name=>'Administration'
,p_link=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8850845926818208983)
,p_parent_id=>wwv_flow_api.id(8849625831998552521)
,p_short_name=>'Top Users'
,p_link=>'f?p=&FLOW_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8850894438012222692)
,p_parent_id=>wwv_flow_api.id(8849625831998552521)
,p_short_name=>'Page Views'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.component_end;
end;
/
