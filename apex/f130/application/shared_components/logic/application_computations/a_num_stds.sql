prompt --application/shared_components/logic/application_computations/a_num_stds
begin
--   Manifest
--     APPLICATION COMPUTATION: A_NUM_STDS
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.2'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>3010675395498185750
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(5157063028278605519)
,p_computation_sequence=>10
,p_computation_item=>'A_NUM_STDS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(count(*),''999G990'') s',
'from eba_stds_standards std'))
);
wwv_flow_api.component_end;
end;
/
