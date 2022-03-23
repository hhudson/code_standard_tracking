prompt --application/shared_components/logic/application_computations/apx_bldr_session
begin
--   Manifest
--     APPLICATION COMPUTATION: APX_BLDR_SESSION
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2972806472018582496
,p_default_owner=>'ILA'
);
wwv_flow_api.create_flow_computation(
 p_id=>wwv_flow_api.id(4551626155019486327)
,p_computation_sequence=>10
,p_computation_item=>'APX_BLDR_SESSION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>':APP_BUILDER_SESSION'
,p_required_patch=>wwv_flow_api.id(4550046048553933165)
);
wwv_flow_api.component_end;
end;
/
