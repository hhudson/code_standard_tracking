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
,p_default_id_offset=>2953977059365452042
,p_default_owner=>'ILA'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(8793388995502617741)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(2955917557277411840)
,p_parent_id=>wwv_flow_api.id(4370310236753736069)
,p_short_name=>'Full Report : &P15_TEST_NAME.'
,p_long_name=>'Full Report : &P15_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4003570306985324824)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Application Appearance'
,p_link=>'f?p=&APP_ID.:37:&SESSION.'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4369716351686933104)
,p_short_name=>'Applications'
,p_link=>'f?p=&FLOW_ID.:6:&SESSION.'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4369720643058941023)
,p_parent_id=>wwv_flow_api.id(4369716351686933104)
,p_short_name=>'Add Applications'
,p_link=>'f?p=&APP_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4369731541409014323)
,p_parent_id=>wwv_flow_api.id(4369716351686933104)
,p_short_name=>'&P34_APPLICATION.'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4369751450393203947)
,p_parent_id=>wwv_flow_api.id(4369731541409014323)
,p_short_name=>'Application'
,p_link=>'f?p=&APP_ID.:17:&SESSION.'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4369873435313387875)
,p_short_name=>'Standards'
,p_link=>'f?p=&APP_ID.:3:&SESSION.'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4370310236753736069)
,p_parent_id=>wwv_flow_api.id(4369873435313387875)
,p_short_name=>'&P5_STANDARD.'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4370318041991771353)
,p_parent_id=>wwv_flow_api.id(4370310236753736069)
,p_short_name=>'Standard'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4371548858553777876)
,p_parent_id=>wwv_flow_api.id(4370310236753736069)
,p_short_name=>'Automated Test'
,p_link=>'f?p=&APP_ID.:14:&SESSION.'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4371574936371195839)
,p_parent_id=>wwv_flow_api.id(4369716351686933104)
,p_short_name=>'Grid Edit'
,p_link=>'f?p=&APP_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4386992134079802736)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Application Types'
,p_link=>'f?p=&APP_ID.:23:&SESSION.'
,p_page_id=>23
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4386992841615802745)
,p_parent_id=>wwv_flow_api.id(4386992134079802736)
,p_short_name=>'Application Type'
,p_link=>'f?p=&APP_ID.:24:&SESSION.'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4387101159522860798)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Application Statuses'
,p_link=>'f?p=&APP_ID.:25:&SESSION.'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4387101842050860799)
,p_parent_id=>wwv_flow_api.id(4387101159522860798)
,p_short_name=>'Application Status'
,p_link=>'f?p=&APP_ID.:29:&SESSION.'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4457326699049220325)
,p_parent_id=>wwv_flow_api.id(5404863753613337652)
,p_short_name=>'Preferences'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4465935919252311345)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Manage Sample Standard'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4529925026346835858)
,p_parent_id=>wwv_flow_api.id(4370310236753736069)
,p_short_name=>'Test Results : &P19_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4532016920280788651)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Automated Testing Job Status'
,p_link=>'f?p=&APP_ID.:21:&SESSION.'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5072397756709359520)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Build Options'
,p_link=>'f?p=&APP_ID.:9:&SESSION.'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5076298956410982234)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Username Format'
,p_link=>'f?p=&APP_ID.:13:&SESSION.'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5077809932458696262)
,p_parent_id=>wwv_flow_api.id(7892672300385015775)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::'
,p_page_id=>53
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5077810943626704753)
,p_parent_id=>wwv_flow_api.id(7892672300385015775)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:::'
,p_page_id=>54
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5404863753613337652)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5710651468287428874)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Page Security'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5724063668496340227)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Rename Application'
,p_link=>'f?p=&FLOW_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7337104853172430471)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Notifications'
,p_link=>'f?p=&FLOW_ID.:30:&SESSION.'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7337198964774442803)
,p_parent_id=>wwv_flow_api.id(7337104853172430471)
,p_short_name=>'Notification'
,p_link=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_page_id=>31
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7601272876818496637)
,p_parent_id=>wwv_flow_api.id(4457326699049220325)
,p_short_name=>'Time Zone'
,p_link=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:::'
,p_page_id=>45
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7620070574858070965)
,p_short_name=>'Help'
,p_link=>'f?p=&FLOW_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7701225872573684306)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Application Error Log'
,p_link=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:::'
,p_page_id=>175
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7731230579873550011)
,p_parent_id=>wwv_flow_api.id(8811952690808454315)
,p_short_name=>'Activity Calendar'
,p_link=>'f?p=&FLOW_ID.:42:&SESSION.'
,p_page_id=>42
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7892672300385015775)
,p_parent_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Access Control List'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7892672582782015776)
,p_parent_id=>wwv_flow_api.id(7892672300385015775)
,p_short_name=>'User Access Control'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8811952690808454315)
,p_parent_id=>0
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8811954515593459926)
,p_short_name=>'Administration'
,p_link=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8813172785628110777)
,p_parent_id=>wwv_flow_api.id(8811952690808454315)
,p_short_name=>'Top Users'
,p_link=>'f?p=&FLOW_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8813221296822124486)
,p_parent_id=>wwv_flow_api.id(8811952690808454315)
,p_short_name=>'Page Views'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.component_end;
end;
/
