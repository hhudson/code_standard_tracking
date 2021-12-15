prompt --application/deployment/install/install_initial_data_load
begin
--   Manifest
--     INSTALL: INSTALL-Initial Data Load
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
 p_id=>wwv_flow_api.id(4791078279196888198)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Initial Data Load'
,p_sequence=>260
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    eba_stds_data.load_initial_data();',
'',
'   insert into eba_stds_applications( apex_app_id, type_id )',
'   select aa.application_id, 1 type_id',
'   from apex_applications aa, apex_workspaces wrk',
'   where not exists (',
'           select null',
'           from eba_stds_applications esa',
'           where esa.apex_app_id = aa.application_id )',
'       and aa.workspace = wrk.workspace',
'       and wrk.workspace_id = v(''WORKSPACE_ID'');',
'end;'))
);
wwv_flow_api.component_end;
end;
/
