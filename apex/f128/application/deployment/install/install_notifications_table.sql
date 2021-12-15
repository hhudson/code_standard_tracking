prompt --application/deployment/install/install_notifications_table
begin
--   Manifest
--     INSTALL: INSTALL-Notifications Table
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
 p_id=>wwv_flow_api.id(2528683958027629167)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Notifications Table'
,p_sequence=>130
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_stds_notifications (',
'    id                       number        not null',
'                             constraint eba_stds_notif_pk ',
'                             primary key,',
'    notification_name        varchar2(255) not null',
'                             constraint eba_stds_notif_uk ',
'                             unique,',
'    notification_description varchar2(4000),',
'    notification_type        varchar2(30)  not null',
'                             constraint eba_stds_notif_tp_cc ',
'                             check (notification_type in (''RED'',''YELLOW'')),',
'    display_sequence         number,',
'    display_from             timestamp with local time zone,',
'    display_until            timestamp with local time zone,',
'    --',
'    row_version_number       number                          not null,',
'    created                  timestamp with local time zone  not null,',
'    created_by               varchar2(255)                   not null,',
'    updated                  timestamp with local time zone  not null,',
'    updated_by               varchar2(255)                   not null',
');',
'/',
'',
'create or replace trigger eba_stds_notif_biu',
'    before insert or update on eba_stds_notifications',
'    for each row',
'begin',
'    if inserting and :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created_by := nvl(v(''app_user''),user);',
'        :new.created    := localtimestamp;',
'        :new.row_version_number := 1;',
'    end if;',
'    if updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    if :new.notification_type is null then',
'        :new.notification_type := ''manual'';',
'    end if;',
'    if :new.display_sequence is null then',
'        :new.display_sequence := 10;',
'    end if;',
'    :new.updated_by := nvl(v(''app_user''),user);',
'    :new.updated    := localtimestamp;',
'end;',
'/',
'alter trigger eba_stds_notif_biu enable;',
''))
);
wwv_flow_api.component_end;
end;
/
