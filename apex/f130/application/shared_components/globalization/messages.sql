prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7703872898496225808)
,p_name=>'1_DAY_LEFT'
,p_message_text=>'1 day left'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7715008912473394421)
,p_name=>'ABOUT_THIS_APPLICATION'
,p_message_text=>'About this Application'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5134512773711666837)
,p_name=>'ABOUT_TO_CREATE'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5134512995911671826)
,p_name=>'ABOUT_TO_CREATE_WITH_INVALIDS'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list. Note that %2 string(s) were invalid usernames.'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7645799899890851285)
,p_name=>'ACCESS_CONTROL_INFO'
,p_message_text=>'When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. This application supports the following 3 access levels; Reader, Contributor and Administrator. Readers have '
||'read-only access and can also view reports. Contributors can additionally create, edit, delete content.  Administrators, in addition to Contributor''s capability, can also perform application administration, including configuration of access control, '
||'managing application look-up data.'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7645800107508853478)
,p_name=>'ACL_CONFIGURATION_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><b>Enabling Access Control</b> means that access to the application and its features are controlled by the current <b>Access Control List</b>, as defined by the application administrator. This application has 3 access levels available that can be '
||'granted to a user; Administrator, Contributor and Reader. Please see the Manage Access Control List page for further details on what each level provides.</p>',
'<p>In addition, if you don''t want to have to define every ''Reader'' or ''Contributor'' of your application, you can select <b>Reader</b> or <b>Contributor</b> access for any authenticated User from the <b>Access Control Scope</b> configuration option. T'
||'his opens read-only or read-write access to any user who can authenticate into your application.</p>',
'<br />',
'<p><b>Disabling Access Control</b> means that access to the application and all of its features including Administration are open to any user who can authenticate to the application.</p>',
'<br />',
'<p>Note: Irrespective of whether Access Control is enabled or disabled, a user still has to authenticate successfully into the application.</p>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518171253766892181)
,p_name=>'ACL_DISABLED'
,p_message_text=>'<p>All users are currently <strong>Administrators</strong>. Please enable Access Control to restrict user access to this application.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518171057432890411)
,p_name=>'ACL_ENABLED'
,p_message_text=>'<p>Only users defined in the Access Control List have access to this application.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518170861314888622)
,p_name=>'ACL_PUBLIC_CONTRIBUTE'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> and <strong>Contributor</strong> access.</p><p>Administrators are restricted by the Access Control List.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518170664765887051)
,p_name=>'ACL_PUBLIC_READONLY'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> access.</p><p>Contributors and Administrators are restricted by the Access Control List.</p>'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7715008197235390024)
,p_name=>'ADDITIONAL_INFORMATION'
,p_message_text=>'Additional Information'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7322393403673273465)
,p_name=>'ADMINISTRATION'
,p_message_text=>'Administration'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5135288976698297680)
,p_name=>'ALREADY_IN_ACL'
,p_message_text=>'User is already in Access Control List'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518170467784885632)
,p_name=>'ANY_AUTHENTICATED_USER'
,p_message_text=>'Any Authenticated User'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518615653097064190)
,p_name=>'AUTHENTICATION_REQUIRED_PAGES'
,p_message_text=>'Login Required Pages'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5135704689718131934)
,p_name=>'BAU_EMAIL_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste email addresses separated by commas, semicolons, or new lines. Note that if you copy and paste email addresses from email messages, extraneous text will be filtered out.  All email users provided will be added as the selected '
||'role.  Existing or duplicate email addresses will be ignored.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5135704879797136508)
,p_name=>'BAU_STRING_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste usernames separated by commas, semicolons, or whitespace. All usernames provided will be added as the selected role.  Existing or duplicate usernames will be ignored.'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7704670206609739071)
,p_name=>'DAYS_AGO'
,p_message_text=>'%0 days ago'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7703872693301224284)
,p_name=>'DAYS_LEFT'
,p_message_text=>'%0 days left'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7703873215811230762)
,p_name=>'DAYS_OVERDUE'
,p_message_text=>'%0 days overdue'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5135289498468302802)
,p_name=>'DUPLICATE_USER'
,p_message_text=>'Duplicate user in list'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7715008608317393218)
,p_name=>'GETTING_STARTED'
,p_message_text=>'Getting Started'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7322389300210272532)
,p_name=>'HELP'
,p_message_text=>'Help'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5176017086410752849)
,p_name=>'HELP_ABOUT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="aboutApp">',
'<h2>About this Application</h2>',
'<p>This application is designed to assist teams in developing applications which conform to a standard set of best practices.</p>',
'<p>Developers can create tests against the Oracle Application Express (APEX) Data Dictionary for compliance, and group them into Standards; the tests are then run automatically against the registered applications.</p>',
'</div>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5176017891358765771)
,p_name=>'HELP_FEATURES'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Features</h2><ul>',
'<li>Track and manage APEX application best practices</li>',
'<li>Automatically evaluate applications for compliance</li>',
'<li>Flexible Access Control (reader, contributor, administrator model)</li>',
'<li>Timezone Support</li>',
'</div>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5176017281234755237)
,p_name=>'HELP_GETTING_STARTED'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Getting Started</h2>',
'<p>1. Register Applications</p>',
'<ul>',
'<li>Click the Applications tab</li>',
'<li>Click the Add Applications button</li>',
'<li>Select all of the application(s) to be tracked</li>',
'<li>Click the Add Applications button</li>',
'</ul>',
'<p>2. Create Standards</p>',
'<ul>',
'<li>Click the Standards tab</li>',
'<li>Click the Create Standard button</li>',
'<li>Add the Standard details</li>',
'<li>Click the Create button</li>',
'</ul>',
'<p>3. Create Tests</p>',
'<ul>',
'<li>Click the Standards tab</li>',
'<li>Click on a Standard''s name to view its details</li>',
'<li>Click the Add Test button</li>',
'<li>Enter the test details. Reference the APEX Application ID in the Check SQL field using the App Bind Variable.</li>',
'<li>Click the Create button</li>',
'</ul> ',
'</ul>',
'</div>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5180549280252026062)
,p_name=>'HELP_SIDEBAR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1 class="appNameHeader">',
'    <img src="%0f_spacer.gif" class="appIcon %1" alt="" />',
'    %2',
'</h1>',
'<ul class="vapList">',
'    <li>',
'        <span class="vLabel">App Version</span>',
'        <span class="vValue">%3</span>',
'    </li>',
'    <li>',
'        <span class="vLabel">Pages</span>',
'        <span class="vValue">%4</span>',
'    </li>',
'    <li>',
'        <span class="vLabel">Vendor</span>',
'        <span class="vValue">%5 </span>',
'    </li>',
'</ul>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5176017694809764183)
,p_name=>'HELP_SUPPORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Additional Information</h2>',
'<p>If you have questions, ask them on the <a href="%0" target="_blank">%1</a>.',
'</p>',
'</div>'))
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7322381096747271493)
,p_name=>'LOGIN'
,p_message_text=>'Login'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7322385198825272094)
,p_name=>'LOGOUT'
,p_message_text=>'Logout'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5135291271726315214)
,p_name=>'MISSING_AT_SIGN'
,p_message_text=>'Missing @ sign'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5135291798024318195)
,p_name=>'MISSING_DOT'
,p_message_text=>'Missing dot'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7662643908677355450)
,p_name=>'MOBILE'
,p_message_text=>'Mobile'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5701065504793868984)
,p_name=>'N_DAY'
,p_message_text=>'%0 day'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5701065701989870285)
,p_name=>'N_DAYS'
,p_message_text=>'%0 days'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5701065111263866003)
,p_name=>'N_HOUR'
,p_message_text=>'%0 hour'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5701065308459867321)
,p_name=>'N_HOURS'
,p_message_text=>'%0 hours'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5701064915145864178)
,p_name=>'N_MINUTES'
,p_message_text=>'%0 minutes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5701065898108872105)
,p_name=>'N_WEEK'
,p_message_text=>'%0 week'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5701066094441873761)
,p_name=>'N_WEEKS'
,p_message_text=>'%0 weeks'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518615257841061974)
,p_name=>'PAGES_WITH_CUSTOM_AUTH'
,p_message_text=>'Authorization Protected'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4443815369086412407)
,p_name=>'PAGE_34_ABOUT'
,p_message_text=>'This page shows the details of a specific application--its type, status, and the percentage of automated tests it passes for each relevant standard.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4443808574645938836)
,p_name=>'PAGE_5_ABOUT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this page to define a standard and the automated tests which help indicate whether or not the standard has been implemented in each relevant application.</p>',
'<p>Once a standard has at least one automated test, the status column of the applications section indicates the percentage of the automated test(s) each associated application passes.</p>'))
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4518615455684062989)
,p_name=>'PUBLIC_PAGES'
,p_message_text=>'Public Pages'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7715008400698391016)
,p_name=>'STANDARDS'
,p_message_text=>'Standards'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7703872286029222209)
,p_name=>'TODAY'
,p_message_text=>'Today'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5135290584234309332)
,p_name=>'USERNAME_TOO_LONG'
,p_message_text=>'Username too long'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(94314707105441993)
,p_name=>'VIEW_MEETS_CRITERIA'
,p_message_text=>'View looks good!'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(94316241610469648)
,p_name=>'VIEW_MUST_HAVE_APP_ID'
,p_message_text=>'The 3rd field in the view must be APPLICATION_ID.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(94315930776469648)
,p_name=>'VIEW_MUST_HAVE_PASS_FAIL'
,p_message_text=>'The 1st field in the view must be PASS_FAIL.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(94316550165469648)
,p_name=>'VIEW_MUST_HAVE_REF_CODE'
,p_message_text=>'The 2nd field in the view must be REFERENCE_CODE.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(94315725848469647)
,p_name=>'VIEW_NOT_IN_SCHEMA'
,p_message_text=>'View not accessible in current schema.'
);
wwv_flow_api.component_end;
end;
/
