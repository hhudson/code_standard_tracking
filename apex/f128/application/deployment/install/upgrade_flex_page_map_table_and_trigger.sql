prompt --application/deployment/install/upgrade_flex_page_map_table_and_trigger
begin
--   Manifest
--     INSTALL: UPGRADE-Flex Page Map table and trigger
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
 p_id=>wwv_flow_api.id(1688829952837458474)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Flex Page Map table and trigger'
,p_sequence=>150
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_STDS_FLEX_PAGE_MAP'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_stds_flex_page_map (',
'    id                 number        primary key,',
'    flex_table         varchar2(128) not null,',
'    page_id            number        not null,',
'    region_id          number        not null,',
'    flex_column_prefix varchar2(30)  not null,',
'    region_type        varchar2(30)  not null,',
'    created_by         varchar2(255),',
'    created            timestamp with local time zone,',
'    updated_by         varchar2(255),',
'    updated            timestamp with local time zone',
');',
'',
'create or replace trigger eba_stds_flex_page_map_biu',
'    before insert or update on eba_stds_flex_page_map',
'    for each row',
'begin',
'    if inserting and :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.created := localtimestamp;',
'    end if;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'    :new.updated := localtimestamp;',
'end eba_stds_flex_page_map_biu;',
'/',
'show errors',
'',
'alter trigger eba_stds_flex_page_map_biu enable;',
''))
);
wwv_flow_api.component_end;
end;
/
