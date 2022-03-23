prompt --application/shared_components/logic/application_processes/set_time_zone
begin
--   Manifest
--     APPLICATION PROCESS: set time zone
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(7620104183739686756)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set time zone'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  c integer := 0;',
'begin',
'for c1 in (',
'   select timezone_preference',
'   from   eba_stds_tz_pref',
'   where  username = upper(:APP_USER)) loop',
'   --',
'   if c1.timezone_preference is not null then',
'       c := c + 1;',
'       APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => c1.timezone_preference ); ',
'   end if;',
'   exit;',
'end loop;',
'if c = 0 then',
'    if apex_util.get_session_time_zone is null then',
'        APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => ''US/Pacific''); ',
'    end if;',
'end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Unable to set time zone'
);
wwv_flow_api.component_end;
end;
/
