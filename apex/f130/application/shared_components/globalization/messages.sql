prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 130
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7684847703553590306)
,p_name=>'1_DAY_LEFT'
,p_message_text=>'1 day left'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7695983717530758919)
,p_name=>'ABOUT_THIS_APPLICATION'
,p_message_text=>'About this Application'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5115487578769031335)
,p_name=>'ABOUT_TO_CREATE'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5115487800969036324)
,p_name=>'ABOUT_TO_CREATE_WITH_INVALIDS'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list. Note that %2 string(s) were invalid usernames.'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7626774704948215783)
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
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7626774912566217976)
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
 p_id=>wwv_flow_api.id(4499146058824256679)
,p_name=>'ACL_DISABLED'
,p_message_text=>'<p>All users are currently <strong>Administrators</strong>. Please enable Access Control to restrict user access to this application.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4499145862490254909)
,p_name=>'ACL_ENABLED'
,p_message_text=>'<p>Only users defined in the Access Control List have access to this application.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4499145666372253120)
,p_name=>'ACL_PUBLIC_CONTRIBUTE'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> and <strong>Contributor</strong> access.</p><p>Administrators are restricted by the Access Control List.</p>'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4499145469823251549)
,p_name=>'ACL_PUBLIC_READONLY'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> access.</p><p>Contributors and Administrators are restricted by the Access Control List.</p>'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7695983002292754522)
,p_name=>'ADDITIONAL_INFORMATION'
,p_message_text=>'Additional Information'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7303368208730637963)
,p_name=>'ADMINISTRATION'
,p_message_text=>'Administration'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5116263781755662178)
,p_name=>'ALREADY_IN_ACL'
,p_message_text=>'User is already in Access Control List'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4499145272842250130)
,p_name=>'ANY_AUTHENTICATED_USER'
,p_message_text=>'Any Authenticated User'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4499590458154428688)
,p_name=>'AUTHENTICATION_REQUIRED_PAGES'
,p_message_text=>'Login Required Pages'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5116679494775496432)
,p_name=>'BAU_EMAIL_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste email addresses separated by commas, semicolons, or new lines. Note that if you copy and paste email addresses from email messages, extraneous text will be filtered out.  All email users provided will be added as the selected '
||'role.  Existing or duplicate email addresses will be ignored.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5116679684854501006)
,p_name=>'BAU_STRING_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste usernames separated by commas, semicolons, or whitespace. All usernames provided will be added as the selected role.  Existing or duplicate usernames will be ignored.'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7685645011667103569)
,p_name=>'DAYS_AGO'
,p_message_text=>'%0 days ago'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7684847498358588782)
,p_name=>'DAYS_LEFT'
,p_message_text=>'%0 days left'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7684848020868595260)
,p_name=>'DAYS_OVERDUE'
,p_message_text=>'%0 days overdue'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5116264303525667300)
,p_name=>'DUPLICATE_USER'
,p_message_text=>'Duplicate user in list'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7695983413374757716)
,p_name=>'GETTING_STARTED'
,p_message_text=>'Getting Started'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7303364105267637030)
,p_name=>'HELP'
,p_message_text=>'Help'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5156991891468117347)
,p_name=>'HELP_ABOUT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="aboutApp">',
'<h2>About this Application</h2>',
'<p>This application is designed to assist teams in developing applications which conform to a standard set of best practices.</p>',
'<p>Developers can create tests against the Oracle Application Express (APEX) Data Dictionary for compliance, and group them into Standards; the tests are then run automatically against the registered applications.</p>',
'</div>'))
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5156992696416130269)
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
 p_id=>wwv_flow_api.id(5156992086292119735)
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
 p_id=>wwv_flow_api.id(5161524085309390560)
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
 p_id=>wwv_flow_api.id(5156992499867128681)
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
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7303355901804635991)
,p_name=>'LOGIN'
,p_message_text=>'Login'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7303360003882636592)
,p_name=>'LOGOUT'
,p_message_text=>'Logout'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5116266076783679712)
,p_name=>'MISSING_AT_SIGN'
,p_message_text=>'Missing @ sign'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5116266603081682693)
,p_name=>'MISSING_DOT'
,p_message_text=>'Missing dot'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7643618713734719948)
,p_name=>'MOBILE'
,p_message_text=>'Mobile'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5682040309851233482)
,p_name=>'N_DAY'
,p_message_text=>'%0 day'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5682040507047234783)
,p_name=>'N_DAYS'
,p_message_text=>'%0 days'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5682039916321230501)
,p_name=>'N_HOUR'
,p_message_text=>'%0 hour'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5682040113517231819)
,p_name=>'N_HOURS'
,p_message_text=>'%0 hours'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5682039720203228676)
,p_name=>'N_MINUTES'
,p_message_text=>'%0 minutes'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5682040703166236603)
,p_name=>'N_WEEK'
,p_message_text=>'%0 week'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5682040899499238259)
,p_name=>'N_WEEKS'
,p_message_text=>'%0 weeks'
);
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4499590062898426472)
,p_name=>'PAGES_WITH_CUSTOM_AUTH'
,p_message_text=>'Authorization Protected'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4424790174143776905)
,p_name=>'PAGE_34_ABOUT'
,p_message_text=>'This page shows the details of a specific application--its type, status, and the percentage of automated tests it passes for each relevant standard.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4424783379703303334)
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
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(4499590260741427487)
,p_name=>'PUBLIC_PAGES'
,p_message_text=>'Public Pages'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7695983205755755514)
,p_name=>'STANDARDS'
,p_message_text=>'Standards'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(7684847091086586707)
,p_name=>'TODAY'
,p_message_text=>'Today'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(5116265389291673830)
,p_name=>'USERNAME_TOO_LONG'
,p_message_text=>'Username too long'
);
null;
wwv_flow_api.component_end;
end;
/
begin
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2991650200555550248
,p_default_owner=>'ILA'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(75289512162806491)
,p_name=>'VIEW_MEETS_CRITERIA'
,p_message_text=>'View looks good!'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(75291046667834146)
,p_name=>'VIEW_MUST_HAVE_APP_ID'
,p_message_text=>'The 3rd field in the view must be APPLICATION_ID.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(75290735833834146)
,p_name=>'VIEW_MUST_HAVE_PASS_FAIL'
,p_message_text=>'The 1st field in the view must be PASS_FAIL.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(75291355222834146)
,p_name=>'VIEW_MUST_HAVE_REF_CODE'
,p_message_text=>'The 2nd field in the view must be REFERENCE_CODE.'
);
wwv_flow_api.create_message(
 p_id=>wwv_flow_api.id(75290530905834145)
,p_name=>'VIEW_NOT_IN_SCHEMA'
,p_message_text=>'View not accessible in current schema.'
);
wwv_flow_api.component_end;
end;
/
