prompt --application/deployment/install/install_sample_data_package_spec
begin
--   Manifest
--     INSTALL: INSTALL-Sample Data Package spec
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
 p_id=>wwv_flow_api.id(1934385829410659283)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Sample Data Package spec'
,p_sequence=>240
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_stds_data is',
'    procedure load_initial_data;',
'    function is_initial_data_loaded return boolean;',
'',
'    procedure load_sample_data;',
'    procedure remove_sample_data;',
'    function is_sample_data_loaded return boolean;',
'end eba_stds_data;',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084881376541629316)
,p_script_id=>wwv_flow_api.id(1934385829410659283)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_STDS_DATA'
,p_last_updated_on=>to_date('20141219062050','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062050','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
