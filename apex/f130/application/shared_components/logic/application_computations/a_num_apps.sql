prompt --application/shared_components/logic/application_computations/a_num_apps
begin
--   Manifest
--     APPLICATION COMPUTATION: A_NUM_APPS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(5078602814065531110)
,p_computation_sequence=>30
,p_computation_item=>'A_NUM_APPS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(count(*),''999G999G990'') a',
'from eba_stds_applications na,',
'    eba_stds_app_statuses nas,',
'    eba_stds_types nt,',
'    apex_applications a',
'where na.status_id = nas.id(+)',
'    and na.type_id = nt.id(+)',
'    and a.application_id = na.apex_app_id'))
);
wwv_flow_api.component_end;
end;
/
