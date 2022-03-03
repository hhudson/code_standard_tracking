prompt --application/deployment/install/install_filter_search_spec
begin
--   Manifest
--     INSTALL: INSTALL-Filter Search Spec
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(2537994746283059416)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Filter Search Spec'
,p_sequence=>60
,p_script_type=>'INSTALL'
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084882070174629355)
,p_script_id=>wwv_flow_api.id(2537994746283059416)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_STDS_FILTER_FW'
,p_last_updated_on=>to_date('20141219062050','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062050','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
