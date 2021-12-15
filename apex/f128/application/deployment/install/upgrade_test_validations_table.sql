prompt --application/deployment/install/upgrade_test_validations_table
begin
--   Manifest
--     INSTALL: UPGRADE-Test Validations table
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
 p_id=>wwv_flow_api.id(614465684719384820)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Test Validations table'
,p_sequence=>25
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_STDS_TEST_VALIDATIONS'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- First, we need to add a unique constraint so the foreign key constraint works.',
'alter table eba_stds_applications',
'    add constraint eba_stds_applications_uk unique (apex_app_id);',
'',
'create table eba_stds_test_validations (',
'    id number not null',
'        constraint eba_stds_test_validations_pk',
'        primary key,',
'    test_id number not null',
'        constraint eba_stds_test_val_tst_fk',
'        references eba_stds_standard_tests( id ) on delete cascade,',
'    application_id number not null',
'        constraint eba_stds_test_val_app_fk',
'        references eba_stds_applications( apex_app_id ) on delete cascade,',
'    result_identifier varchar2(4000),   -- Null for pass/fail tests',
'    false_positive_yn varchar2(1),',
'    --',
'    created           timestamp with local time zone  not null,',
'    created_by        varchar2(255) not null,',
'    updated           timestamp with local time zone  not null,',
'    updated_by        varchar2(255) not null,',
'    --',
'    constraint eba_stds_test_val_ck',
'        check( false_positive_yn in (''Y'',''N'') )',
');',
'create index eba_stds_test_validations_n1 on eba_stds_test_validations( test_id );',
'create index eba_stds_test_validations_n2 on eba_stds_test_validations( application_id );',
'create index eba_stds_test_validations_n3 on eba_stds_test_validations( test_id, application_id, result_identifier );',
'',
'create or replace trigger eba_stds_test_validations_biu',
'    before insert or update on eba_stds_test_validations',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := eba_stds.gen_id();',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/',
'show errors',
'',
'alter trigger eba_stds_test_validations_biu enable;'))
);
wwv_flow_api.component_end;
end;
/
