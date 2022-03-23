prompt --application/deployment/install/install_filter_search_body
begin
--   Manifest
--     INSTALL: INSTALL-Filter Search Body
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.7'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>130
,p_default_id_offset=>2935163735381040437
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(5050620627748138887)
,p_install_id=>wwv_flow_api.id(7091530035236640958)
,p_name=>'Filter Search Body'
,p_sequence=>200
,p_script_type=>'INSTALL'
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(4597506867889705459)
,p_script_id=>wwv_flow_api.id(5050620627748138887)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE BODY'
,p_object_name=>'EBA_STDS_FILTER_FW'
,p_last_updated_on=>to_date('20141219062049','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062049','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
