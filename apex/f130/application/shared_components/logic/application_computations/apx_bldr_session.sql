prompt --application/shared_components/logic/application_computations/apx_bldr_session
begin
--   Manifest
--     APPLICATION COMPUTATION: APX_BLDR_SESSION
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
 p_id=>wwv_flow_api.id(4589495078499089581)
,p_computation_sequence=>10
,p_computation_item=>'APX_BLDR_SESSION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>':APP_BUILDER_SESSION'
,p_required_patch=>wwv_flow_api.id(4587914972033536419)
);
wwv_flow_api.component_end;
end;
/
