prompt --application/deployment/install/install_application_tables
begin
--   Manifest
--     INSTALL: INSTALL-Application Tables
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
 p_id=>wwv_flow_api.id(4734637957598123153)
,p_install_id=>wwv_flow_api.id(4578904365199564796)
,p_name=>'Application Tables'
,p_sequence=>140
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_stds_types (',
'    id               number not null',
'                         constraint eba_stds_types_pk',
'                         primary key,',
'    display_sequence number not null,',
'    name             varchar2(32) not null,',
'    description      varchar2(2000)',
')',
'/',
'create unique index eba_stds_types_u1 on eba_stds_types(name);',
'',
'create table eba_stds_app_statuses (',
'    id               number not null',
'                         constraint eba_stds_app_statuses_pk',
'                         primary key,',
'    display_sequence number not null,',
'    name             varchar2(32) not null,',
'    description      varchar2(2000)',
')',
'/',
'create unique index eba_stds_app_statuses_u1 on eba_stds_app_statuses(name);',
'',
'create table eba_stds_applications (',
'    id                   number not null',
'                         constraint eba_stds_applications_pk',
'                         primary key,',
'    -- Framework Columns',
'    row_key              varchar2(30) not null,',
'    tags                 varchar2(4000),',
'    -- Custom Columns',
'    apex_app_id          number not null,',
'    status_id            number,',
'    type_id              number,',
'    prefix               varchar2(30),',
'    last_advisor_date    timestamp with local time zone,',
'    last_security_date   timestamp with local time zone,',
'    --',
'    row_version_number   number not null,',
'    created              timestamp with local time zone  not null,',
'    created_by           varchar2(255) not null,',
'    updated              timestamp with local time zone  not null,',
'    updated_by           varchar2(255) not null,',
'    constraint eba_stds_applications_fk1',
'        foreign key (status_id) references eba_stds_app_statuses(id),',
'    constraint eba_stds_applications_fk2',
'        foreign key (type_id) references eba_stds_types(id),',
'    constraint eba_stds_applications_uk unique (apex_app_id)',
')',
'/',
'',
'create index eba_stds_applications_i1 on eba_stds_applications(status_id);',
'create index eba_stds_applications_i2 on eba_stds_applications(type_id);',
'create unique index eba_stds_applications_u1 on eba_stds_applications(prefix);',
'',
'create table eba_stds_notes (',
'    id             number not null',
'                   constraint eba_stds_notes_pk',
'                   primary key,',
'    application_id number not null',
'                   constraint eba_stds_notes_fk1',
'                       references eba_stds_applications(id) on delete cascade,',
'    note           clob not null,',
'    --',
'    row_version_number number not null,',
'    created            timestamp with local time zone  not null,',
'    created_by         varchar2(255) not null,',
'    updated            timestamp with local time zone  not null,',
'    updated_by         varchar2(255) not null',
')',
'/',
'',
'create index eba_stds_notes_i1 on eba_stds_notes(application_id);',
'/',
'',
'create table eba_stds_standards (',
'    id                number not null',
'                          constraint eba_stds_standards_pk',
'                          primary key,',
'    name              varchar2(64) not null,',
'    description       varchar2(4000),',
'    primary_developer varchar2(255),',
'    implementation    clob,',
'    date_started      timestamp with local time zone',
'                          default localtimestamp not null,',
'    --',
'    created           timestamp with local time zone  not null,',
'    created_by        varchar2(255) not null,',
'    updated           timestamp with local time zone  not null,',
'    updated_by        varchar2(255) not null',
')',
'/',
'',
'create table eba_stds_standard_tests (',
'    id                number not null',
'                          constraint eba_stds_standard_tests_pk',
'                          primary key,',
'    standard_id        number not null',
'                          constraint eba_stds_standard_tests_fk1',
'                              references eba_stds_standards(id) on delete cascade,',
'    test_type         varchar2(16) default ''PASS_FAIL'' not null,',
'    name              varchar2(64) not null,',
'    display_sequence  number,',
'    check_sql         clob,',
'    app_bind_variable varchar2(30) default '':APP_ID'' not null,',
'    link_type         varchar2(64),',
'    failure_help_text varchar2(4000),',
'    --',
'    created           timestamp with local time zone  not null,',
'    created_by        varchar2(255) not null,',
'    updated           timestamp with local time zone  not null,',
'    updated_by        varchar2(255) not null,',
'    constraint eba_stds_standard_tests_ck1',
'        check ( test_type in (''PASS_FAIL'', ''FAIL_REPORT'', ''PERCENTAGE'') )',
')',
'/',
'create index eba_stds_standard_tests_n1',
'    on eba_stds_standard_tests( standard_id );',
'',
'create table eba_stds_standard_app_ref (',
'    id             number not null',
'                       constraint eba_stds_standard_app_ref_pk',
'                       primary key,',
'    standard_id     number not null',
'                   constraint eba_stds_standard_app_ref_fk1',
'                       references eba_stds_standards(id) on delete cascade,',
'    application_id number not null',
'                   constraint eba_stds_standard_app_ref_fk2',
'                       references eba_stds_applications(id) on delete cascade',
')',
'/',
'',
'create unique index eba_stds_standard_app_ref_u1',
'    on eba_stds_standard_app_ref( standard_id, application_id );',
'create index eba_stds_standard_app_ref_n1 on eba_stds_standard_app_ref( application_id );',
'',
'create table eba_stds_standard_type_ref (',
'    id         number not null',
'                   constraint eba_stds_standard_type_ref_pk',
'                   primary key,',
'    standard_id number not null',
'               constraint eba_stds_standard_type_ref_fk1',
'                   references eba_stds_standards(id) on delete cascade,',
'    type_id    number not null',
'               constraint eba_stds_standard_type_ref_fk2',
'                   references eba_stds_types(id) on delete cascade',
')',
'/',
'',
'create unique index eba_stds_standard_type_ref_u1',
'    on eba_stds_standard_type_ref( standard_id, type_id );',
'create index eba_stds_standard_type_ref_n1 on eba_stds_standard_type_ref( type_id );',
'',
'create table eba_stds_standard_statuses (',
'    id             number not null',
'                   constraint eba_stds_standard_statuses_pk',
'                   primary key,',
'    standard_id     number',
'                   constraint eba_stds_standard_statuses_fk1',
'                   references eba_stds_standards(id) on delete cascade,',
'    application_id number',
'                   constraint eba_stds_standard_statuses_fk2',
'                   references eba_stds_applications(id) on delete cascade,',
'    test_id        number',
'                   constraint eba_stds_standard_statuses_fk3',
'                   references eba_stds_standard_tests(id) on delete cascade,',
'    pass_fail_pct  number,',
'    test_duration  number,',
'    updated        timestamp with local time zone not null',
');',
'',
'create index eba_stds_standard_statuses_n1 on eba_stds_standard_statuses( application_id );',
'create index eba_stds_standard_statuses_n2 on eba_stds_standard_statuses( standard_id );',
'create index eba_stds_standard_statuses_n3 on eba_stds_standard_statuses( test_id );',
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
'create index eba_stds_test_validations_n3 on eba_stds_test_validations( test_id, application_id, result_identifier );'))
);
wwv_flow_api.component_end;
end;
/
