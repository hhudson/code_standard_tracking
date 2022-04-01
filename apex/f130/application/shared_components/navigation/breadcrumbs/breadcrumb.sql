prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU:  Breadcrumb
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(8850087331635351449)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(3012615893410145548)
,p_parent_id=>wwv_flow_api.id(4427008572886469777)
,p_short_name=>'Full Report : &P15_TEST_NAME.'
,p_long_name=>'Full Report : &P15_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4060268643118058532)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Application Appearance'
,p_link=>'f?p=&APP_ID.:37:&SESSION.'
,p_page_id=>37
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4426414687819666812)
,p_short_name=>'Applications'
,p_link=>'f?p=&FLOW_ID.:6:&SESSION.'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4426418979191674731)
,p_parent_id=>wwv_flow_api.id(4426414687819666812)
,p_short_name=>'Add Applications'
,p_link=>'f?p=&APP_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4426429877541748031)
,p_parent_id=>wwv_flow_api.id(4426414687819666812)
,p_short_name=>'&P34_APPLICATION.'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4426449786525937655)
,p_parent_id=>wwv_flow_api.id(4426429877541748031)
,p_short_name=>'Application'
,p_link=>'f?p=&APP_ID.:17:&SESSION.'
,p_page_id=>17
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4426571771446121583)
,p_short_name=>'Standards'
,p_link=>'f?p=&APP_ID.:3:&SESSION.'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4427008572886469777)
,p_parent_id=>wwv_flow_api.id(4426571771446121583)
,p_short_name=>'&P5_STANDARD.'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4427016378124505061)
,p_parent_id=>wwv_flow_api.id(4427008572886469777)
,p_short_name=>'Standard'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4428247194686511584)
,p_parent_id=>wwv_flow_api.id(4427008572886469777)
,p_short_name=>'Automated Test'
,p_link=>'f?p=&APP_ID.:14:&SESSION.'
,p_page_id=>14
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4428273272503929547)
,p_parent_id=>wwv_flow_api.id(4426414687819666812)
,p_short_name=>'Grid Edit'
,p_link=>'f?p=&APP_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4443690470212536444)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Application Types'
,p_link=>'f?p=&APP_ID.:23:&SESSION.'
,p_page_id=>23
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4443691177748536453)
,p_parent_id=>wwv_flow_api.id(4443690470212536444)
,p_short_name=>'Application Type'
,p_link=>'f?p=&APP_ID.:24:&SESSION.'
,p_page_id=>24
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4443799495655594506)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Application Statuses'
,p_link=>'f?p=&APP_ID.:25:&SESSION.'
,p_page_id=>25
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4443800178183594507)
,p_parent_id=>wwv_flow_api.id(4443799495655594506)
,p_short_name=>'Application Status'
,p_link=>'f?p=&APP_ID.:29:&SESSION.'
,p_page_id=>29
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4514025035181954033)
,p_parent_id=>wwv_flow_api.id(5461562089746071360)
,p_short_name=>'Preferences'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4522634255385045053)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Manage Sample Standard'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4586623362479569566)
,p_parent_id=>wwv_flow_api.id(4427008572886469777)
,p_short_name=>'Test Results : &P19_TEST_NAME.'
,p_link=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(4588715256413522359)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Automated Testing Job Status'
,p_link=>'f?p=&APP_ID.:21:&SESSION.'
,p_page_id=>21
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5129096092842093228)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Build Options'
,p_link=>'f?p=&APP_ID.:9:&SESSION.'
,p_page_id=>9
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5132997292543715942)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Username Format'
,p_link=>'f?p=&APP_ID.:13:&SESSION.'
,p_page_id=>13
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5134508268591429970)
,p_parent_id=>wwv_flow_api.id(7949370636517749483)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::'
,p_page_id=>53
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5134509279759438461)
,p_parent_id=>wwv_flow_api.id(7949370636517749483)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:::'
,p_page_id=>54
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5461562089746071360)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5767349804420162582)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Page Security'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(5780762004629073935)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Rename Application'
,p_link=>'f?p=&FLOW_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7393803189305164179)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Notifications'
,p_link=>'f?p=&FLOW_ID.:30:&SESSION.'
,p_page_id=>30
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7393897300907176511)
,p_parent_id=>wwv_flow_api.id(7393803189305164179)
,p_short_name=>'Notification'
,p_link=>'f?p=&FLOW_ID.:31:&SESSION.'
,p_page_id=>31
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7657971212951230345)
,p_parent_id=>wwv_flow_api.id(4514025035181954033)
,p_short_name=>'Time Zone'
,p_link=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:::'
,p_page_id=>45
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7676768910990804673)
,p_short_name=>'Help'
,p_link=>'f?p=&FLOW_ID.:39:&SESSION.'
,p_page_id=>39
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7757924208706418014)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Application Error Log'
,p_link=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:::'
,p_page_id=>175
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7787928916006283719)
,p_parent_id=>wwv_flow_api.id(8868651026941188023)
,p_short_name=>'Activity Calendar'
,p_link=>'f?p=&FLOW_ID.:42:&SESSION.'
,p_page_id=>42
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7949370636517749483)
,p_parent_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Access Control List'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(7949370918914749484)
,p_parent_id=>wwv_flow_api.id(7949370636517749483)
,p_short_name=>'User Access Control'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8868651026941188023)
,p_parent_id=>0
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8868652851726193634)
,p_short_name=>'Administration'
,p_link=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8869871121760844485)
,p_parent_id=>wwv_flow_api.id(8868651026941188023)
,p_short_name=>'Top Users'
,p_link=>'f?p=&FLOW_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(8869919632954858194)
,p_parent_id=>wwv_flow_api.id(8868651026941188023)
,p_short_name=>'Page Views'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_api.component_end;
end;
/
