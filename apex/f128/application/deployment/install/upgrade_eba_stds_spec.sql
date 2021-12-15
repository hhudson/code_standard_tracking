prompt --application/deployment/install/upgrade_eba_stds_spec
begin
--   Manifest
--     INSTALL: UPGRADE-eba_stds spec
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.6'
,p_default_workspace_id=>9690978936188613
,p_default_application_id=>128
,p_default_id_offset=>422538065343964275
,p_default_owner=>'ILA'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(2000417528644200604)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'eba_stds spec'
,p_sequence=>80
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package eba_stds is',
'    -------------------------------------------------------------------------',
'    -- Generates a unique Identifier',
'    -------------------------------------------------------------------------',
'    function gen_id return number;',
'',
'    -------------------------------------------------------------------------',
'    -- Handle the process of registering the scheduled job.',
'    -------------------------------------------------------------------------',
'    procedure register_job;',
'',
'end eba_stds;',
''))
);
wwv_flow_api.create_install_object(
 p_id=>wwv_flow_api.id(2084884049489629495)
,p_script_id=>wwv_flow_api.id(2000417528644200604)
,p_object_owner=>'#OWNER#'
,p_object_type=>'PACKAGE'
,p_object_name=>'EBA_STDS'
,p_last_updated_on=>to_date('20141219062051','YYYYMMDDHH24MISS')
,p_created_on=>to_date('20141219062051','YYYYMMDDHH24MISS')
);
wwv_flow_api.component_end;
end;
/
