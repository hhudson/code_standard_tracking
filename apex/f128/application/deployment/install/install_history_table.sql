prompt --application/deployment/install/install_history_table
begin
--   Manifest
--     INSTALL: INSTALL-History Table
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
 p_id=>wwv_flow_api.id(4734657663832124952)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'History Table'
,p_sequence=>120
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_stds_history (',
'    id                 number       not null',
'                       constraint eba_stds_history_pk ',
'                       primary key,',
'    component_id       number,',
'    component_rowkey   varchar2(30),',
'    table_name         varchar2(60) not null,',
'    column_name        varchar2(60) not null,',
'    old_value          varchar2(4000),',
'    new_value          varchar2(4000),',
'    action_date        timestamp with local time zone  not null,',
'    action_by          varchar2(255)                   not null,',
'    --',
'    row_version_number number  not null )',
'/',
'',
'create index eba_stds_history_i1 on eba_stds_history (component_id);',
'',
'create or replace trigger eba_stds_history_biu',
'    before insert or update on eba_stds_history',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.action_date := localtimestamp;',
'        :new.action_by  := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := :new.row_version_number + 1;',
'    end if;',
'end;',
'/',
'alter trigger eba_stds_history_biu enable;',
''))
);
wwv_flow_api.component_end;
end;
/
