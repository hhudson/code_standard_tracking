prompt --application/deployment/install/install_sequences
begin
--   Manifest
--     INSTALL: INSTALL-Sequences
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
 p_id=>wwv_flow_api.id(4735720367163466551)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Sequences'
,p_sequence=>70
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create sequence eba_stds_seq  minvalue 1000 maxvalue 999999999999999999999999999 increment by 1 start with 1000 cache 20 noorder  nocycle;',
'    ',
''))
);
wwv_flow_api.component_end;
end;
/
