-- Release specific references to files in this folder
-- This file is automatically executed from the /release/_release.sql file
-- 
-- Ex: @code/issue-123.sql 

ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';

create or replace type eba_stds_filter_column_t as object (
    -- The name of the column in the query.
    -- If the column name is case sensitive, enclose it in double quotes.
    query_column varchar2(50),
    -- The type of the column; used for controlling the search functionality.
    -- Valid options are: CHAR, VARCHAR, VARCHAR2, NCHAR, NVARCHAR2, CLOB, NCLOB,
    -- NUMBER, BINARY_FLOAT, BINARY_DOUBLE, DATE, TIMESTAMP,
    -- TIMESTAMP WITH TIME ZONE, TIMESTAMP WITH LOCAL TIME ZONE
    datatype varchar2(30),
    -- Flag indicating whether or not the column is included in text search.
    in_text_search_yn varchar2(1),
    -- If in text search:
        -- Flag indicating whether an exact match is required ( = vs. like )
        exact_match_yn varchar2(1),
        -- Flag for whether the search string is case sensitive for this column.
        case_sensitive_yn varchar2(1),
    -- If an LOV applies:
        -- The header displayed in the filter list.
        header       varchar2(64),
        -- The list of values containing the filter options.
        lov_name     varchar2(256),
        -- A flag indicating whether the filter applies to the display
        -- value of the list of values ('D') or the return value ('R').
        match_column varchar2(1)
)
/
create or replace type eba_stds_filter_col_tbl as table of eba_stds_filter_column_t
/

create sequence eba_stds_seq  minvalue 1000 maxvalue 999999999999999999999999999 increment by 1 start with 1000 cache 20 noorder  nocycle;

create table eba_stds_tags (
    id                      number        not null
                            constraint eba_stds_tags_pk
                            primary key,
    tag                     varchar2(255) not null,
    content_id              number,
    content_type            varchar2(30)
                            constraint eba_stds_tags_ck1 check
                            (content_type in ('APPLICATION')),
    --
    created                 timestamp with local time zone  not null,
    created_by              varchar2(255)                   not null,
    updated                 timestamp with local time zone  not null,
    updated_by              varchar2(255)                   not null )
/
create table eba_stds_tags_type_sum (
    tag                             varchar2(255),
    content_type                    varchar2(30),
    tag_count                       number,
    --
    constraint eba_stds_tags_type_sum_pk primary key (tag,content_type) )
/
create table eba_stds_tags_sum (
    tag                             varchar2(255)
                                    constraint eba_stds_tags_sum_pk 
                                    primary key,
    tag_count                       number )
/
create table eba_stds_access_levels (
    id                      number              not null
                                                constraint eba_stds_acc_levels_pk
                                                primary key,
    access_level            varchar2(30)        not null
                                                constraint eba_stds_access_levels_uk
                                                unique,
    --
    constraint eba_stds_acc_lv_ac_lvl_ck1
           check (access_level in ('Administrator', 'Contributor','Reader' )) )
/


create table eba_stds_users (
    id                      number              not null
                                                constraint eba_stds_users_pk
                                                primary key,
    username                varchar2(255)       not null
                                                constraint eba_stds_users_uk
                                                unique,
    access_level_id         number              not null
                                                constraint eba_stds_users_fk1
                                                references eba_stds_access_levels,
    account_locked          varchar2(1)         not null
                                                constraint eba_stds_users_ck1
                                                check (account_locked in ('Y','N')),
    --
    row_version_number      number                          not null,
    created                 timestamp with local time zone  not null,
    created_by              varchar2(255)                   not null,
    updated                 timestamp with local time zone  not null,
    updated_by              varchar2(255)                   not null )
/
create index eba_stds_users_i1 on eba_stds_users (access_level_id);


create table eba_stds_error_lookup (
    constraint_name         varchar2(30)        not null
                                                constraint eba_stds_error_lookup_pk
                                                primary key,
    message                 varchar2(4000)      not null,
    language_code           varchar2(30)        not null,
    --
    constraint eba_stds_error_lookup_uk 
           unique (constraint_name,language_code) )
/
    
    
create table eba_stds_preferences (
    id                      number              not null
                                                constraint eba_stds_preferences_pk
                                                primary key,
    preference_name         varchar2(255)       not null
                                                constraint eba_stds_preferences_uk
                                                unique,
    preference_value        varchar2(255)       not null,
    --
    row_version_number      number                          not null,
    created                 timestamp with local time zone  not null,
    created_by              varchar2(255)                   not null,
    updated                 timestamp with local time zone  not null,
    updated_by              varchar2(255)                   not null )
/
create table eba_stds_errors (
    id                 number not null
                       constraint eba_stds_errors_pk
                       primary key,
    err_time           timestamp with local time zone
                       default localtimestamp
                       not null,
    app_id             number,
    app_page_id        number,
    app_user           varchar2(512),
    user_agent         varchar2(4000),
    ip_address         varchar2(512), -- As reported by owa_util.get_cgi_env
    ip_address2       varchar2(512), -- As reported by sys_context
    -- From APEX_ERROR.T_ERROR:
    message           varchar2(4000), /* Displayed error message */
    page_item_name    varchar2(255),  /* Associated page item name */
    region_id         number,         /* Associated tabular form region id of the primary application */
    column_alias      varchar2(255),  /* Associated tabular form column alias */
    row_num           number,         /* Associated tabular form row */
    apex_error_code   varchar2(255),  /* Contains the system message code if it''s an error raised by APEX */
    ora_sqlcode       number,         /* SQLCODE on exception stack which triggered the error, NULL if the error was not raised by an ORA error */
    ora_sqlerrm       varchar2(4000), /* SQLERRM which triggered the error, NULL if the error was not raised by an ORA error */
    error_backtrace   varchar2(4000)  /* Output of dbms_utility.format_error_backtrace or dbms_utility.format_call_stack */
    -- END APEX_ERROR.T_ERROR
)
/

create index eba_stds_errors_i1 on eba_stds_errors(err_time);

create table eba_stds_tz_pref (
    id                       number        not null
                             constraint eba_stds_tz_pref_pk
                             primary key,
    username                 varchar2(255) not null
                             constraint eba_stds_tz_pref_uk
                             unique,
    timezone_preference      varchar2(255) not null,
    --
    row_version_number       number                          not null,
    created                  timestamp with local time zone  not null,
    created_by               varchar2(255)                   not null,
    updated                  timestamp with local time zone  not null,
    updated_by               varchar2(255)                   not null )
/

create table eba_stds_history (
    id                 number       not null
                       constraint eba_stds_history_pk 
                       primary key,
    component_id       number,
    component_rowkey   varchar2(30),
    table_name         varchar2(60) not null,
    column_name        varchar2(60) not null,
    old_value          varchar2(4000),
    new_value          varchar2(4000),
    action_date        timestamp with local time zone  not null,
    action_by          varchar2(255)                   not null,
    --
    row_version_number number  not null )
/

create index eba_stds_history_i1 on eba_stds_history (component_id);

create table eba_stds_notifications (
    id                       number        not null
                             constraint eba_stds_notif_pk 
                             primary key,
    notification_name        varchar2(255) not null
                             constraint eba_stds_notif_uk 
                             unique,
    notification_description varchar2(4000),
    notification_type        varchar2(30)  not null
                             constraint eba_stds_notif_tp_cc 
                             check (notification_type in ('RED','YELLOW')),
    display_sequence         number,
    display_from             timestamp with local time zone,
    display_until            timestamp with local time zone,
    --
    row_version_number       number                          not null,
    created                  timestamp with local time zone  not null,
    created_by               varchar2(255)                   not null,
    updated                  timestamp with local time zone  not null,
    updated_by               varchar2(255)                   not null
)
/
create table eba_stds_types (
    id               number not null
                         constraint eba_stds_types_pk
                         primary key,
    display_sequence number not null,
    name             varchar2(32) not null,
    description      varchar2(2000)
)
/
create unique index eba_stds_types_u1 on eba_stds_types(name);

create table eba_stds_app_statuses (
    id               number not null
                         constraint eba_stds_app_statuses_pk
                         primary key,
    display_sequence number not null,
    name             varchar2(32) not null,
    description      varchar2(2000)
)
/
create unique index eba_stds_app_statuses_u1 on eba_stds_app_statuses(name);

create table eba_stds_applications (
    id                   number not null
                         constraint eba_stds_applications_pk
                         primary key,
    -- Framework Columns
    row_key              varchar2(30) not null,
    tags                 varchar2(4000),
    -- Custom Columns
    apex_app_id          number not null,
    status_id            number,
    type_id              number,
    prefix               varchar2(30),
    last_advisor_date    timestamp with local time zone,
    last_security_date   timestamp with local time zone,
    --
    row_version_number   number not null,
    created              timestamp with local time zone  not null,
    created_by           varchar2(255) not null,
    updated              timestamp with local time zone  not null,
    updated_by           varchar2(255) not null,
    constraint eba_stds_applications_fk1
        foreign key (status_id) references eba_stds_app_statuses(id),
    constraint eba_stds_applications_fk2
        foreign key (type_id) references eba_stds_types(id),
    constraint eba_stds_applications_uk unique (apex_app_id)
)
/

create index eba_stds_applications_i1 on eba_stds_applications(status_id);
create index eba_stds_applications_i2 on eba_stds_applications(type_id);
create unique index eba_stds_applications_u1 on eba_stds_applications(prefix);

create table eba_stds_notes (
    id             number not null
                   constraint eba_stds_notes_pk
                   primary key,
    application_id number not null
                   constraint eba_stds_notes_fk1
                       references eba_stds_applications(id) on delete cascade,
    note           clob not null,
    --
    row_version_number number not null,
    created            timestamp with local time zone  not null,
    created_by         varchar2(255) not null,
    updated            timestamp with local time zone  not null,
    updated_by         varchar2(255) not null
)
/

create index eba_stds_notes_i1 on eba_stds_notes(application_id)
/

create table eba_stds_standards (
    id                number not null
                          constraint eba_stds_standards_pk
                          primary key,
    name              varchar2(64) not null,
    description       varchar2(4000),
    primary_developer varchar2(255),
    implementation    clob,
    date_started      timestamp with local time zone
                          default localtimestamp not null,
    --
    created           timestamp with local time zone  not null,
    created_by        varchar2(255) not null,
    updated           timestamp with local time zone  not null,
    updated_by        varchar2(255) not null
)
/

create table eba_stds_standard_tests (
    id                number not null
                          constraint eba_stds_standard_tests_pk
                          primary key,
    standard_id        number not null
                          constraint eba_stds_standard_tests_fk1
                              references eba_stds_standards(id) on delete cascade,
    test_type         varchar2(16) default 'FAIL_REPORT' not null,
    name              varchar2(64) not null,
    display_sequence  number,
    query_view        varchar2(255) not null,
    link_type         varchar2(64),
    failure_help_text varchar2(4000),
    --
    created           timestamp with local time zone  not null,
    created_by        varchar2(255) not null,
    updated           timestamp with local time zone  not null,
    updated_by        varchar2(255) not null,
    constraint eba_stds_standard_tests_ck1
        check ( test_type in ('PASS_FAIL', 'FAIL_REPORT', 'PERCENTAGE') )
)
/
create index eba_stds_standard_tests_n1
    on eba_stds_standard_tests( standard_id );

create table eba_stds_standard_app_ref (
    id             number not null
                       constraint eba_stds_standard_app_ref_pk
                       primary key,
    standard_id     number not null
                   constraint eba_stds_standard_app_ref_fk1
                       references eba_stds_standards(id) on delete cascade,
    application_id number not null
                   constraint eba_stds_standard_app_ref_fk2
                       references eba_stds_applications(id) on delete cascade
)
/

create unique index eba_stds_standard_app_ref_u1
    on eba_stds_standard_app_ref( standard_id, application_id );
create index eba_stds_standard_app_ref_n1 on eba_stds_standard_app_ref( application_id );

create table eba_stds_standard_type_ref (
    id         number not null
                   constraint eba_stds_standard_type_ref_pk
                   primary key,
    standard_id number not null
               constraint eba_stds_standard_type_ref_fk1
                   references eba_stds_standards(id) on delete cascade,
    type_id    number not null
               constraint eba_stds_standard_type_ref_fk2
                   references eba_stds_types(id) on delete cascade
)
/

create unique index eba_stds_standard_type_ref_u1
    on eba_stds_standard_type_ref( standard_id, type_id );
create index eba_stds_standard_type_ref_n1 on eba_stds_standard_type_ref( type_id );

create table eba_stds_standard_statuses (
    id             number not null
                   constraint eba_stds_standard_statuses_pk
                   primary key,
    standard_id     number
                   constraint eba_stds_standard_statuses_fk1
                   references eba_stds_standards(id) on delete cascade,
    application_id number
                   constraint eba_stds_standard_statuses_fk2
                   references eba_stds_applications(id) on delete cascade,
    test_id        number
                   constraint eba_stds_standard_statuses_fk3
                   references eba_stds_standard_tests(id) on delete cascade,
    pass_fail_pct  number,
    test_duration  number,
    updated        timestamp with local time zone not null
);

create index eba_stds_standard_statuses_n1 on eba_stds_standard_statuses( application_id );
create index eba_stds_standard_statuses_n2 on eba_stds_standard_statuses( standard_id );
create index eba_stds_standard_statuses_n3 on eba_stds_standard_statuses( test_id );

create table eba_stds_test_validations (
    id number not null
        constraint eba_stds_test_validations_pk
        primary key,
    test_id number not null
        constraint eba_stds_test_val_tst_fk
        references eba_stds_standard_tests( id ) on delete cascade,
    application_id number not null
        constraint eba_stds_test_val_app_fk
        references eba_stds_applications( apex_app_id ) on delete cascade,
    result_identifier varchar2(4000),   -- Null for pass/fail tests
    false_positive_yn varchar2(1),
    legacy_yn         varchar2(1),
    --
    created           timestamp with local time zone  not null,
    created_by        varchar2(255) not null,
    updated           timestamp with local time zone  not null,
    updated_by        varchar2(255) not null,
    --
    constraint eba_stds_test_val_ck
        check( false_positive_yn in ('Y','N') ),
    constraint eba_stds_test_val_ck2 
        check( legacy_yn in ('Y','N') )
);
create index eba_stds_test_validations_n1 on eba_stds_test_validations( test_id );
create index eba_stds_test_validations_n2 on eba_stds_test_validations( application_id );
create index eba_stds_test_validations_n3 on eba_stds_test_validations( test_id, application_id, result_identifier );

alter table eba_stds_applications
add ( applications_flex_01 varchar2(4000),
    applications_flex_02 varchar2(4000),
    applications_flex_03 varchar2(4000),
    applications_flex_04 varchar2(4000),
    applications_flex_05 varchar2(4000),
    applications_flex_06 varchar2(4000),
    applications_flex_07 varchar2(4000),
    applications_flex_08 varchar2(4000),
    applications_flex_n01 number,
    applications_flex_n02 number,
    applications_flex_n03 number,
    applications_flex_n04 number,
    applications_flex_d01 timestamp with local time zone,
    applications_flex_d02 timestamp with local time zone,
    applications_flex_d03 timestamp with local time zone,
    applications_flex_d04 timestamp with local time zone,
    applications_flex_clob clob
);

alter table eba_stds_standards
add ( standards_flex_01 varchar2(4000),
    standards_flex_02 varchar2(4000),
    standards_flex_03 varchar2(4000),
    standards_flex_04 varchar2(4000),
    standards_flex_05 varchar2(4000),
    standards_flex_06 varchar2(4000),
    standards_flex_07 varchar2(4000),
    standards_flex_08 varchar2(4000),
    standards_flex_n01 number,
    standards_flex_n02 number,
    standards_flex_n03 number,
    standards_flex_n04 number,
    standards_flex_d01 timestamp with local time zone,
    standards_flex_d02 timestamp with local time zone,
    standards_flex_d03 timestamp with local time zone,
    standards_flex_d04 timestamp with local time zone,
    standards_flex_clob clob
);

alter table eba_stds_standard_tests
add ( tests_flex_01 varchar2(4000),
    tests_flex_02 varchar2(4000),
    tests_flex_03 varchar2(4000),
    tests_flex_04 varchar2(4000),
    tests_flex_05 varchar2(4000),
    tests_flex_06 varchar2(4000),
    tests_flex_07 varchar2(4000),
    tests_flex_08 varchar2(4000),
    tests_flex_n01 number,
    tests_flex_n02 number,
    tests_flex_n03 number,
    tests_flex_n04 number,
    tests_flex_d01 timestamp with local time zone,
    tests_flex_d02 timestamp with local time zone,
    tests_flex_d03 timestamp with local time zone,
    tests_flex_d04 timestamp with local time zone,
    tests_flex_clob clob
);

create table eba_stds_flex_registry (
    id                 number primary key,
    row_version_number integer,
    flexible_table     varchar2(128) not null,
    flexible_column    varchar2(128) not null,
    friendly_name      varchar2(128) ,
    assigned_yn        varchar2(1)   not null,
    active_yn          varchar2(1)   not null,
    --
    report_css_class   varchar2(128) not null,
    table_prefix       varchar2(30)  not null,
    display_name_sing  varchar2(128) not null,
    display_name_plrl  varchar2(128) not null,
    --
    form_label_text    varchar2(255) not null,
    report_label_text  varchar2(255),
    is_required_yn     varchar2(1)   not null,
    is_displayed_on_ir varchar2(1)   not null,
    label_template_id  number        not null,
    display_as         varchar2(255) not null,
                           constraint eba_stds_flex_display_as_ck
                           check (display_as in ('SELECT_LIST','TEXT','TEXTAREA','DATE','NUMBER')),
    width              number        not null,
    max_width          number        not null,
    height             number        not null,
    format_mask        varchar2(30),
    label_alignment    varchar2(30),
    help_text          varchar2(4000),
    lov_type           varchar2(30),
    lov_sql_query      clob,
    lov_display_col    varchar2(30),
    lov_return_col     varchar2(30),
    default_value      varchar2(4000),
    rpt_hdr_alignment  varchar2(30),
    condition_type     varchar2(255),
    condition1         varchar2(4000),
    condition2         varchar2(4000),
    --
    created_by         varchar2(255),
    created            timestamp with local time zone,
    updated_by         varchar2(255),
    updated            timestamp with local time zone
);

create table eba_stds_flex_page_map (
    id                 number        primary key,
    flex_table         varchar2(128) not null,
    page_id            number        not null,
    region_id          number        not null,
    flex_column_prefix varchar2(30)  not null,
    region_type        varchar2(30)  not null,
    created_by         varchar2(255),
    created            timestamp with local time zone,
    updated_by         varchar2(255),
    updated            timestamp with local time zone
);

create table eba_stds_flex_static_lovs (
    id                 number primary key,
    row_version_number integer,
    flex_table         varchar2(128)  not null,
    flex_column        varchar2(128)  not null,
    display_sequence   number,
    display_value      varchar2(255)  not null,
    return_value       varchar2(4000) not null,
    --
    created_by         varchar2(255),
    created            timestamp with local time zone,
    updated_by         varchar2(255),
    updated            timestamp with local time zone
);
