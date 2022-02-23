prompt --application/deployment/install/install_tags_tables
begin
--   Manifest
--     INSTALL: INSTALL-Tags Tables
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
 p_id=>wwv_flow_api.id(4735372466760362361)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Tags Tables'
,p_sequence=>80
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_stds_tags (',
'    id                      number        not null',
'                            constraint eba_stds_tags_pk',
'                            primary key,',
'    tag                     varchar2(255) not null,',
'    content_id              number,',
'    content_type            varchar2(30)',
'                            constraint eba_stds_tags_ck1 check',
'                            (content_type in (''APPLICATION'')),',
'    --',
'    created                 timestamp with local time zone  not null,',
'    created_by              varchar2(255)                   not null,',
'    updated                 timestamp with local time zone  not null,',
'    updated_by              varchar2(255)                   not null )',
'/',
'',
'create or replace trigger eba_stds_tags_biu',
'    before insert or update on eba_stds_tags',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(v(''APP_USER''),USER);',
'    end if;',
'',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(v(''APP_USER''),USER);',
'end;',
'/',
'alter trigger eba_stds_tags_biu enable;',
'',
'    ',
'create table eba_stds_tags_type_sum (',
'    tag                             varchar2(255),',
'    content_type                    varchar2(30),',
'    tag_count                       number,',
'    --',
'    constraint eba_stds_tags_type_sum_pk primary key (tag,content_type) )',
'/',
'',
'    ',
'create table eba_stds_tags_sum (',
'    tag                             varchar2(255)',
'                                    constraint eba_stds_tags_sum_pk ',
'                                    primary key,',
'    tag_count                       number )',
'/'))
);
wwv_flow_api.component_end;
end;
/
