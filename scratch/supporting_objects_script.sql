Rem
Rem  Set plscope_settings
Rem
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
Rem
Rem  eba_stds Spec
Rem
create or replace package eba_stds is
    -------------------------------------------------------------------------
    -- Generates a unique Identifier
    -------------------------------------------------------------------------
    function gen_id return number;

    -------------------------------------------------------------------------
    -- Handle the process of registering the scheduled job.
    -------------------------------------------------------------------------
    procedure register_job;

end eba_stds;

Rem
Rem  eba_stds_security spec
Rem
create or replace package eba_stds_security is
    -------------------------------------------------------------------------
    -- Gets the current user's authorization level. Can depend on the following:
    --  * If access control is currently disabled, returns highest level of 3.
    --  * If access control is enabled, but user is not in list, returns 0
    --  * If access control is enabled and user is in list, returns their
    --    access level.
    -------------------------------------------------------------------------
    function get_authorization_level (
        p_username             varchar2)
        return number;

    -------------------------------------------------------------------------
    -- Check the application's logic to see if the user is allowed to
    -- view the data on a page. Used for finer control than the normal ACL.
    -------------------------------------------------------------------------
    function is_authorized_viewer( p_user in varchar2) return varchar2;

end eba_stds_security;
/
show errors
Rem
Rem  framework Spec
Rem
create or replace
package eba_stds_fw as

    function conv_txt_html (
        p_txt_message in varchar2 )
        return varchar2;

    function conv_urls_links (
        p_string in varchar2 )
        return varchar2;

    function format_status_update (
        p_string in clob,
        p_shorten_url in varchar2 default 'N' )
        return varchar2;

    function tags_cleaner (
        p_tags  in varchar2,
        p_case  in varchar2 default 'U' )
        return varchar2;

    procedure tag_sync (
        p_new_tags          in varchar2,
        p_old_tags          in varchar2,
        p_content_type      in varchar2,
        p_content_id        in number );

    function get_preference_value (
        p_preference_name in varchar2 )
        return varchar2;

    procedure set_preference_value (
        p_preference_name  in varchar2, 
        p_preference_value in varchar2 );

    function compress_int (
        n in integer )
        return varchar2;

    function apex_error_handling (
        p_error in apex_error.t_error )
        return apex_error.t_error_result;

end eba_stds_fw;
/
show errors
Rem
Rem  Parser Spec
Rem
create or replace package eba_stds_parser as

    g_collection varchar2(255) := 'EBA_STDS_PARSER';

    function is_valid_query( p_query in clob ) return varchar2;

    procedure update_standard_status;

    function build_link( p_test_id in number, p_application_id in number, p_param in varchar2 )
        return varchar2;

end eba_stds_parser;

Rem
Rem  Filter Search Spec
Rem
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
);
/
create or replace type eba_stds_filter_col_tbl as table of eba_stds_filter_column_t;
/

create or replace package eba_stds_filter2_fw as
    -- Procedure: reset_collection
    -- Clears the collections if they exist.
    procedure reset_collection( p_collection in varchar2
                                    default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') );

    -- Procedure: build_collection
    -- Creates and populates the collections which drive the filter search.
    -- This must be called prior to any other procedures/functions.
    -- Arguments: p_col_tbl is a table of eba_stds_filter_column_t.
    --   Must contain a record for each column in the query which is searchable,
    --   whether by text search, list of values filter, or both.
    --  p_collection is the name of the collection to be used for the page.
    --   It should be unique across the application.
    procedure build_collection( p_collection in varchar2
                                    default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                                p_col_tbl in eba_stds_filter_col_tbl
                                   );

    -- Procedure: render_dropdown
    -- Emits the HTML for a menubar dropdown list of filters.
    procedure render_dropdown( p_collection in varchar2
                                   default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') );
    -- Procedure: render_sidebar
    -- Emits the HTML for a sidebar list of filters.
    procedure render_sidebar( p_collection in varchar2
                                  default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') );

    -- Function: get_filter
    -- Returns the active state of the specified filter.
    function get_filter( p_collection in varchar2
                             default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                         p_seq_id in number ) return varchar2;

    -- Procedure: set_filter
    -- Sets the active state of the specified filter.
    procedure set_filter( p_collection in varchar2
                              default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                          p_seq_id in number,
                          p_active in varchar2 );

    -- Procedure: set_filter
    -- Alternate entry point to set based on the column & display value.
    procedure set_filter( p_collection in varchar2
                              default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                          p_column in varchar2 default null,
                          p_dispval in varchar2,
                          p_active in varchar2 );

    -- Function: get_active_filters
    -- Pipelined function to return the active filters. This enables us to "hide"
    -- the collection name.
    type active_filters_t is record (
        filter_sequence number,
        filter_group    varchar2(4000),
        filter_display  varchar2(4000),
        filter_value    varchar2(4000),
        numeric_value   number,
        min_num_value   number,
        max_num_value   number,
        min_boundary    varchar2(2),
        max_boundary    varchar2(2),
        date_value      date,
        active_group    varchar2(4000),
        match_col       varchar2(1)
    );
    type active_filters_tbl is table of active_filters_t;
    function get_active_filters( p_collection in varchar2
                                     default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID') )
        return active_filters_tbl PIPELINED;

    -- Procedure: add_text_search
    -- Adds a search string to the text search filters.
    procedure add_text_search( p_collection in varchar2
                                   default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                               p_text_group in varchar2 default 'Report Row Contains',
                               p_search_str in varchar2,
                               p_multiple   in boolean default true );

    -- Function: apply_active_filters
    -- Modifies the user's query to include the selected filters.
    -- Usable in classic reports, tabular forms, and other places which allow
    -- for a function returning SQL query.
    function apply_active_filters( p_collection in varchar2
                                       default 'APEX_FILTER_'||v('APP_ID')||'_'||v('APP_PAGE_ID'),
                                   p_query in clob
        ) return clob;

end eba_stds_filter2_fw;
/
Rem
Rem  Sequences
Rem
create sequence eba_stds_seq  minvalue 1000 maxvalue 999999999999999999999999999 increment by 1 start with 1000 cache 20 noorder  nocycle;
    

Rem
Rem  Tags Tables
Rem
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

create or replace trigger eba_stds_tags_biu
    before insert or update on eba_stds_tags
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(v('APP_USER'),USER);
    end if;

    :new.updated    := localtimestamp;
    :new.updated_by := nvl(v('APP_USER'),USER);
end;
/
alter trigger eba_stds_tags_biu enable;

    
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
Rem
Rem  ACL Tables
Rem
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

create or replace trigger eba_stds_users_biu
    before insert or update on eba_stds_users
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := eba_stds.gen_id();
        end if;
        :new.created_by := nvl(v('APP_USER'), USER);
        :new.created    := localtimestamp;
        :new.row_version_number := 1;
        if :new.account_locked is null then
            :new.account_locked := 'N';    
        end if;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := nvl(v('APP_USER'), USER);
    :new.updated    := localtimestamp;
    -- Always store username as upper case
    :new.username := upper(:new.username);
end;
/
alter trigger eba_stds_users_biu enable;

create or replace trigger eba_stds_users_bd
    before delete on eba_stds_users
    for each row
declare
    pragma autonomous_transaction;
begin
    -- Disallow deletes to a user's own record unless last one.
    if v('APP_USER') = upper(:old.username) then
       for c1 in (
          select count(*) cnt
            from eba_stds_users
           where id != :old.id )
       loop
          if c1.cnt > 0 then
             raise_application_error(-20002, 'Delete disallowed, you cannot delete your own access control details.');
          end if;
       end loop;
    end if;    
end;
/
alter trigger eba_stds_users_bd enable;


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

create or replace trigger eba_stds_preferences_biu
before insert or update on eba_stds_preferences
    for each row
begin
    if inserting and :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created_by  := nvl(v('APP_USER'),USER);
        :new.created     := localtimestamp;
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := nvl(v('APP_USER'),USER);
    :new.updated    := localtimestamp;
    :new.preference_name := upper(:new.preference_name);
end;
/
alter trigger eba_stds_preferences_biu enable;

Rem
Rem  Error Table
Rem
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

create or replace trigger eba_stds_errors_bi
    before insert or update on eba_stds_errors
    for each row
begin
    if :new.id is null then
       :new.id := eba_stds.gen_id();
    end if;
end;
/
alter trigger eba_stds_errors_bi enable;

Rem
Rem  Timezone Table
Rem
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
  
create or replace trigger eba_stds_tz_pref_biu
    before insert or update on eba_stds_tz_pref
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    if :new.timezone_preference is null then
        :new.timezone_preference := 'UTC';
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    :new.username   := upper(:new.username);
end;
/
alter trigger eba_stds_tz_pref_biu enable;
Rem
Rem  History Table
Rem
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

create or replace trigger eba_stds_history_biu
    before insert or update on eba_stds_history
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.action_date := localtimestamp;
        :new.action_by  := nvl(wwv_flow.g_user,user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := :new.row_version_number + 1;
    end if;
end;
/
alter trigger eba_stds_history_biu enable;

Rem
Rem  Notifications Table
Rem
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
);
/

create or replace trigger eba_stds_notif_biu
    before insert or update on eba_stds_notifications
    for each row
begin
    if inserting and :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created_by := nvl(v('app_user'),user);
        :new.created    := localtimestamp;
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    if :new.notification_type is null then
        :new.notification_type := 'manual';
    end if;
    if :new.display_sequence is null then
        :new.display_sequence := 10;
    end if;
    :new.updated_by := nvl(v('app_user'),user);
    :new.updated    := localtimestamp;
end;
/
alter trigger eba_stds_notif_biu enable;

Rem
Rem  Application Tables
Rem
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

create index eba_stds_notes_i1 on eba_stds_notes(application_id);
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
    test_type         varchar2(16) default 'PASS_FAIL' not null,
    name              varchar2(64) not null,
    display_sequence  number,
    check_sql         clob,
    app_bind_variable varchar2(30) default ':APP_ID' not null,
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
    --
    created           timestamp with local time zone  not null,
    created_by        varchar2(255) not null,
    updated           timestamp with local time zone  not null,
    updated_by        varchar2(255) not null,
    --
    constraint eba_stds_test_val_ck
        check( false_positive_yn in ('Y','N') )
);
create index eba_stds_test_validations_n1 on eba_stds_test_validations( test_id );
create index eba_stds_test_validations_n2 on eba_stds_test_validations( application_id );
create index eba_stds_test_validations_n3 on eba_stds_test_validations( test_id, application_id, result_identifier );
Rem
Rem  Application Triggers
Rem
create or replace trigger eba_stds_types_biu
    before insert or update on eba_stds_types
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/
show errors

alter trigger eba_stds_types_biu enable;

create or replace trigger eba_stds_app_statuses_biu
    before insert or update on eba_stds_app_statuses
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/
show errors

alter trigger eba_stds_app_statuses_biu enable;

create or replace trigger eba_stds_standard_statuses_biu
    before insert or update on eba_stds_standard_statuses
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/
show errors

alter trigger eba_stds_standard_statuses_biu enable;

create or replace trigger eba_stds_applications_biu
    before insert or update on eba_stds_applications
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if :new.row_key is null then
        declare
            l_next_seq_val number;
        begin
           select eba_stds_seq.nextval into l_next_seq_val from dual;
           :new.row_key := eba_stds_fw.compress_int(l_next_seq_val);
        end;
    end if;
    if :new.tags is not null then
        :new.tags := eba_stds_fw.tags_cleaner( :new.tags );
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    eba_stds_fw.tag_sync(
        p_new_tags      => :new.tags,
        p_old_tags      => :old.tags,
        p_content_type  => 'APPLICATION',
        p_content_id    => :new.id );
end;
/
show errors

alter trigger eba_stds_applications_biu enable;

create or replace trigger eba_stds_applications_bd
    before delete on eba_stds_applications
    for each row
begin
    eba_stds_fw.tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'APPLICATION',
        p_content_id    => :old.id );
end;
/

alter trigger eba_stds_applications_bd enable;

create or replace trigger eba_stds_notes_biu
    before insert or update on eba_stds_notes
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;
/

alter trigger eba_stds_notes_biu enable;

create or replace trigger eba_stds_standards_biu
    before insert or update on eba_stds_standards
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;
/

alter trigger eba_stds_standards_biu enable;

create or replace trigger eba_stds_standard_tests_biu
    before insert or update on eba_stds_standard_tests
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;
/

alter trigger eba_stds_standard_tests_biu enable;

create or replace trigger eba_stds_standard_app_ref_biu
    before insert or update on eba_stds_standard_app_ref
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/

alter trigger eba_stds_standard_app_ref_biu enable;

create or replace trigger eba_stds_standard_type_ref_biu
    before insert or update on eba_stds_standard_type_ref
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/

alter trigger eba_stds_standard_type_ref_biu enable;

create or replace trigger eba_stds_standard_statuses_biu
    before insert or update on eba_stds_standard_statuses
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    :new.updated := localtimestamp;
end;
/

alter trigger eba_stds_standard_statuses_biu enable;

create or replace trigger eba_stds_test_validations_biu
    before insert or update on eba_stds_test_validations
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;
/
show errors

alter trigger eba_stds_test_validations_biu enable;

Rem
Rem  History Triggers
Rem
create or replace trigger au_eba_stds_widgets
    after update on eba_stds_widgets
    for each row
declare
    ov varchar2(4000) := null;
    nv varchar2(4000) := null;
begin
    -- TAGS (default)
    if nvl(:old.tags, '0') != nvl(:new.tags,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'TAGS', substr(:old.tags,0,4000), substr(:new.tags,0,4000) ); 
    end if;
    -- WIDGET_NAME (default)
    if nvl(:old.widget_name, '0') != nvl(:new.widget_name,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'WIDGET_NAME', substr(:old.widget_name,0,4000), substr(:new.widget_name,0,4000) ); 
    end if;
    -- WIDGET_OWNER (default)
    if nvl(:old.widget_owner, '0') != nvl(:new.widget_owner,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'WIDGET_OWNER', substr(:old.widget_owner,0,4000), substr(:new.widget_owner,0,4000) ); 
    end if;
    -- CONTRIBUTOR_1 (default)
    if nvl(:old.contributor_1, '0') != nvl(:new.contributor_1,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_1', substr(:old.contributor_1,0,4000), substr(:new.contributor_1,0,4000) ); 
    end if;
    -- CONTRIBUTOR_2 (default)
    if nvl(:old.contributor_2, '0') != nvl(:new.contributor_2,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_2', substr(:old.contributor_2,0,4000), substr(:new.contributor_2,0,4000) ); 
    end if;
    -- CONTRIBUTOR_3 (default)
    if nvl(:old.contributor_3, '0') != nvl(:new.contributor_3,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_3', substr(:old.contributor_3,0,4000), substr(:new.contributor_3,0,4000) ); 
    end if;
    -- CONTRIBUTOR_4 (default)
    if nvl(:old.contributor_4, '0') != nvl(:new.contributor_4,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_4', substr(:old.contributor_4,0,4000), substr(:new.contributor_4,0,4000) ); 
    end if;
    -- WIDGET_DESCRIPTION (default)
    if nvl(:old.widget_description, '0') != nvl(:new.widget_description,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'WIDGET_DESCRIPTION', substr(:old.widget_description,0,4000), substr(:new.widget_description,0,4000) ); 
    end if;
end au_eba_stds_widgets;
/

alter trigger au_eba_stds_widgets enable
/

Rem
Rem  eba_stds Body
Rem
create or replace package body eba_stds as

    -------------------------------------------------------------------------
    -- Generates a unique Identifier
    -------------------------------------------------------------------------
    function gen_id return number is
    begin
        return to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end gen_id;

    -------------------------------------------------------------------------
    -- Handle the process of registering the scheduled job.
    -------------------------------------------------------------------------
    procedure register_job is
        c_workspace_id constant number := apex_application.get_security_group_id();
        l_app_id number;
        l_stmt varchar2(1000);
    begin
        l_app_id := nvl(wwv_flow_application_install.get_application_id,v('FB_FLOW_ID'));
        l_stmt := q'[begin #PKG#.create_job( job_name => 'EBA_STDS_TEST_UPD_JOB', ]'
            ||q'[job_type => 'PLSQL_BLOCK', job_action => 'eba_stds_parser.update_standard_status;', ]'
            ||q'[repeat_interval => 'FREQ=DAILY;interval=1', enabled => TRUE); end;]';
        for c1 in ( select object_name
                    from sys.all_objects
                    where object_name in ('DBMS_SCHEDULER', 'CLOUD_SCHEDULER')
                        and object_type = 'PACKAGE'
                    order by object_name desc ) loop
            execute immediate replace(l_stmt, '#PKG#',
                sys.dbms_assert.enquote_name(c1.object_name, false));
            return;
        end loop;

    end register_job;

end eba_stds;
/
show errors

Rem
Rem  framework Body
Rem
CREATE OR REPLACE PACKAGE BODY "EBA_STDS_FW" as
    function conv_txt_html (
        p_txt_message in varchar2 )
        return varchar2
    is
        l_html_message   varchar2(32767) default p_txt_message;
        l_temp_url varchar2(32767) := null;
        l_length number;
    begin
        l_html_message := replace(l_html_message, chr(10), '<br />');
        l_html_message := replace(l_html_message, chr(13), null);
        return l_html_message;
    end conv_txt_html;
    function format_status_update ( p_string in clob, p_shorten_url in varchar2 default 'N' ) return varchar2 is
        l_string      varchar2(32767);
        l_endofUrl    varchar2(4000) default chr(10) || chr(13) || chr(9) || ' )<>';
        l_url         varchar2(4000);
        l_current_pos number := 1;
        n             number := 1;
        m             number := 1;
        p             number := 1;
    begin
        l_string := apex_escape.html(dbms_lob.substr(p_string,2500,1)) || ' ';
        for i in 1 .. 1000 loop
            n := instr( lower(l_string), 'http:&#x2f;&#x2f;', l_current_pos );
            m := instr( lower(l_string), 'https:&#x2f;&#x2f;', l_current_pos );
            p := instr( lower(l_string), 'ftp:&#x2f;&#x2f;', l_current_pos   );
            -- set n to position of first link
            if m > 0 and (n = 0 or m < n) and (p = 0 or m < p) then
               n := m;
            elsif p > 0 and (n = 0 or p < n) then
               n := p;
            end if;
            exit when n = 0 or length(l_string) > 32000;
            for j in 0 .. length( l_string ) - n loop
                if ( instr( l_endofUrl, substr( l_string, n+j, 1 ) ) > 0 ) then
                   l_url := rtrim( substr( l_string, n, j ), '.'||chr(32)||chr(10) );
                   if p_shorten_url = 'Y' and length(l_url) > 100 then
                       l_url := '<a href="' || l_url || '" target="_blank">'
                           || substr(l_url,0,60)||'...'||substr(l_url,-30,30) || '</a>';
                   else
                       l_url := '<a href="' || l_url || '" target="_blank">' || l_url || '</a>';
                   end if;
                   l_string := substr( l_string, 1, n-1 ) || l_url || substr( l_string, n+j );
                   l_current_pos := n + length(l_url);
                   exit;
                end if;
            end loop;
        end loop;
        return replace(l_string,chr(10),'<br>');
    end format_status_update;
    function conv_urls_links (
        p_string in varchar2 )
        return varchar2
    is
        l_string   varchar2(32767) default p_string;
        l_endofUrl varchar2(4000) default chr(10) || chr(13) || chr(9) || ' )<>';
        l_url         varchar2(4000);
        l_current_pos number := 1;
        n             number := 1;
        m             number := 1;
        p             number := 1;
    begin
        l_string := p_string || ' ';
        for i in 1 .. 1000 loop
            n := instr( lower(l_string), 'http://', l_current_pos );
            m := instr( lower(l_string), 'https://', l_current_pos );
            p := instr( lower(l_string), 'ftp://', l_current_pos   );
            -- set n to position of first link
            if m > 0 and (n = 0 or m < n) and (p = 0 or m < p) then
               n := m;
            elsif p > 0 and (n = 0 or p < n) then
               n := p;
            end if;
            exit when n = 0 or length(l_string) > 32000;
            for j in 0 .. length( l_string ) - n loop
                if ( instr( l_endofUrl, substr( l_string, n+j, 1 ) ) > 0 ) then
                   l_url := rtrim( substr( l_string, n, j ), '.'||chr(32)||chr(10) );
                   l_url := '<a href="' || l_url || '">' || l_url || '</a>';
                   l_string := substr( l_string, 1, n-1 ) || l_url || substr( l_string, n+j );
                   l_current_pos := n + length(l_url);
                   exit;
                end if;
            end loop;
        end loop;
        return l_string;
    end conv_urls_links;
    function tags_cleaner (
        p_tags  in varchar2,
        p_case  in varchar2 default 'U' )
        return varchar2
    is
        type tags is table of varchar2(255) index by varchar2(255);
        l_tags_a        tags;
        l_tag           varchar2(255);
        l_tags          apex_application_global.vc_arr2;
        l_tags_string   varchar2(32767);
        i               integer;
    begin
        l_tags := apex_util.string_to_table(p_tags,',');
        for i in 1..l_tags.count loop
            --remove all whitespace, including tabs, spaces, line feeds and carraige returns with a single space
            l_tag := substr(trim(regexp_replace(l_tags(i),'[[:space:]]{1,}',' ')),1,255);
            if l_tag is not null and l_tag != ' ' then
                if p_case = 'U' then
                    l_tag := upper(l_tag);
                elsif p_case = 'L' then
                    l_tag := lower(l_tag);
                end if;
                --add it to the associative array, if it is a duplicate, it will just be replaced
                l_tags_a(l_tag) := l_tag;
            end if;
        end loop;
        l_tag := null;
        l_tag := l_tags_a.first;
        while l_tag is not null loop
            l_tags_string := l_tags_string||l_tag;
            if l_tag != l_tags_a.last then
                l_tags_string := l_tags_string || ', ';
            end if;
            l_tag := l_tags_a.next(l_tag);
        end loop;
        return substr(l_tags_string, 1, 4000);
    end tags_cleaner;
    procedure tag_sync (
        p_new_tags          in varchar2,
        p_old_tags          in varchar2,
        p_content_type      in varchar2,
        p_content_id        in number )
    as
        type tags is table of varchar2(255) index by varchar2(255);
        l_new_tags_a    tags;
        l_old_tags_a    tags;
        l_new_tags      apex_application_global.vc_arr2;
        l_old_tags      apex_application_global.vc_arr2;
        l_merge_tags    apex_application_global.vc_arr2;
        l_dummy_tag     varchar2(255);
        i               integer;
    begin
        l_old_tags := apex_util.string_to_table(p_old_tags,', ');
        l_new_tags := apex_util.string_to_table(p_new_tags,', ');
        if l_old_tags.count > 0 then --do inserts and deletes
            --build the associative arrays
            for i in 1..l_old_tags.count loop
                l_old_tags_a(l_old_tags(i)) := l_old_tags(i);
            end loop;
            for i in 1..l_new_tags.count loop
                l_new_tags_a(l_new_tags(i)) := l_new_tags(i);
            end loop;
            --do the inserts
            for i in 1..l_new_tags.count loop
                begin
                    l_dummy_tag := l_old_tags_a(l_new_tags(i));
                exception when no_data_found then
                    insert into eba_stds_tags (tag, content_id, content_type )
                    values (l_new_tags(i), p_content_id, p_content_type );
                    l_merge_tags(l_merge_tags.count + 1) := l_new_tags(i);
                end;
            end loop;
            --do the deletes
            for i in 1..l_old_tags.count loop
                begin
                    l_dummy_tag := l_new_tags_a(l_old_tags(i));
                exception when no_data_found then
                    delete from eba_stds_tags where content_id = p_content_id and tag = l_old_tags(i);
                    l_merge_tags(l_merge_tags.count + 1) := l_old_tags(i);
                end;
            end loop;
        else --just do inserts
            for i in 1..l_new_tags.count loop
                insert into eba_stds_tags (tag, content_id, content_type )
                values (l_new_tags(i), p_content_id, p_content_type );
                l_merge_tags(l_merge_tags.count + 1) := l_new_tags(i);
            end loop;
        end if;
        for i in 1..l_merge_tags.count loop
            merge into eba_stds_tags_type_sum s
            using (select count(*) tag_count
                     from eba_stds_tags
                    where tag = l_merge_tags(i) and content_type = p_content_type ) t
            on (s.tag = l_merge_tags(i) and s.content_type = p_content_type )
            when not matched then insert (tag, content_type, tag_count)
                                  values (l_merge_tags(i), p_content_type, t.tag_count)
            when matched then update set s.tag_count = t.tag_count;
            merge into eba_stds_tags_sum s
            using (select sum(tag_count) tag_count
                     from eba_stds_tags_type_sum
                    where tag = l_merge_tags(i) ) t
            on (s.tag = l_merge_tags(i) )
            when not matched then insert (tag, tag_count)
                                  values (l_merge_tags(i), t.tag_count)
            when matched then update set s.tag_count = t.tag_count;
        end loop;
    end tag_sync;
    function get_preference_value (
        p_preference_name varchar2 )
        return varchar2
    is
        l_preference_value varchar2(255);
    begin
        select preference_value
            into l_preference_value
        from eba_stds_preferences
        where preference_name = p_preference_name;
        return l_preference_value;
    exception
        when no_data_found then
            return 'Preference does not exist';
    end get_preference_value;
    procedure set_preference_value (
        p_preference_name  varchar2, 
        p_preference_value varchar2 )
    is
    begin
        merge into eba_stds_preferences dest
        using ( select upper(p_preference_name) preference_name,
                    p_preference_value preference_value
                from dual ) src
        on ( upper(dest.preference_name) = src.preference_name )
        when matched then
            update set dest.preference_value = src.preference_value
        when not matched then
            insert (dest.preference_name, dest.preference_value)
            values (src.preference_name, src.preference_value);
    end set_preference_value;
    function compress_int (
        n in integer )
        return varchar2
    as
        ret varchar2(30);
        quotient integer;
        remainder integer;
        digit char(1);
    begin
        ret := '';
        quotient := n;
        while quotient > 0
        loop
            remainder := mod(quotient, 10 + 26);
            quotient := floor(quotient  / (10 + 26));
            if remainder < 26 then
                digit := chr(ascii('A') + remainder);
            else
                digit := chr(ascii('0') + remainder - 26);
            end if;
            ret := digit || ret;
        end loop ;
        if length(ret) < 5 then
            ret := lpad(ret, 4, 'A');
        end if ;
        return upper(ret);
    end compress_int;
    procedure add_error_log ( 
        p_error in apex_error.t_error )
    is
    pragma autonomous_transaction;
    begin
        -- Remove old errors
        delete from eba_stds_errors where err_time <= localtimestamp - 21;
        -- Log the error.
        insert into eba_stds_errors (
            app_id,
            app_page_id,
            app_user,
            user_agent,
            ip_address,
            ip_address2,
            message,
            page_item_name,
            region_id,
            column_alias,
            row_num,
            apex_error_code,
            ora_sqlcode,
            ora_sqlerrm,
            error_backtrace )
        select v('APP_ID'),
            v('APP_PAGE_ID'),
            v('APP_USER'),
            owa_util.get_cgi_env('HTTP_USER_AGENT'),
            owa_util.get_cgi_env('REMOTE_ADDR'),
            sys_context('USERENV', 'IP_ADDRESS'),
            substr(p_error.message,0,4000),
            p_error.page_item_name,
            p_error.region_id,
            p_error.column_alias,
            p_error.row_num,
            p_error.apex_error_code,
            p_error.ora_sqlcode,
            substr(p_error.ora_sqlerrm,0,4000),
            substr(p_error.error_backtrace,0,4000)
        from dual;
        commit;
    end add_error_log;
    function apex_error_handling (
        p_error in apex_error.t_error )
        return apex_error.t_error_result
    is
        l_result          apex_error.t_error_result;
        l_constraint_name varchar2(255);
    begin
        l_result := apex_error.init_error_result (
                        p_error => p_error );
        -- If it is an internal error raised by APEX, like an invalid statement or
        -- code which can not be executed, the error text might contain security sensitive
        -- information. To avoid this security problem we can rewrite the error to
        -- a generic error message and log the original error message for further
        -- investigation by the help desk.
        if p_error.is_internal_error then
            -- mask all errors that are not common runtime errors (Access Denied
            -- errors raised by application / page authorization and all errors
            -- regarding session and session state)
            if not p_error.is_common_runtime_error then
                add_error_log( p_error );
                -- Change the message to the generic error message which doesn't expose
                -- any sensitive information.
                l_result.message         := 'An unexpected internal application error has occurred.';
                l_result.additional_info := null;
            end if;
        else
            -- Always show the error as inline error
            -- Note: If you have created manual tabular forms (using the package
            --       apex_item/htmldb_item in the SQL statement) you should still
            --       use "On error page" on that pages to avoid loosing entered data
            l_result.display_location := case
                                           when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification
                                           else l_result.display_location
                                         end;
            -- If it's a constraint violation like
            --
            --   -) ORA-00001: unique constraint violated
            --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)
            --   -) ORA-02290: check constraint violated
            --   -) ORA-02291: integrity constraint violated - parent key not found
            --   -) ORA-02292: integrity constraint violated - child record found
            --
            -- we try to get a friendly error message from our constraint lookup configuration.
            -- If we don't find the constraint in our lookup table we fallback to
            -- the original ORA error message.
            if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then
                l_constraint_name := apex_error.extract_constraint_name (
                                         p_error => p_error );
                begin
                    select message
                      into l_result.message
                      from eba_stds_error_lookup
                     where constraint_name = l_constraint_name;
                exception when no_data_found then null; -- not every constraint has to be in our lookup table
                end;
            end if;
            -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
            -- in a table trigger or in a PL/SQL package called by a process and we
            -- haven't found the error in our lookup table, then we just want to see
            -- the actual error text and not the full error stack with all the ORA error numbers.
            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
                l_result.message := apex_error.get_first_ora_error_text (
                                        p_error => p_error );
            end if;
            -- If no associated page item/tabular form column has been set, we can use
            -- apex_error.auto_set_associated_item to automatically guess the affected
            -- error field by examine the ORA error for constraint names or column names.
            if l_result.page_item_name is null and l_result.column_alias is null then
                apex_error.auto_set_associated_item (
                    p_error        => p_error,
                    p_error_result => l_result );
            end if;
        end if;
        return l_result;
    end apex_error_handling;
end eba_stds_fw;
/
show errors
Rem
Rem  Parser Body
Rem
create or replace package body eba_stds_parser as

    -- Private helper function.
    function clean_query( p_query in clob ) return clob;

    -- Do any necessary clean-up.
    function clean_query( p_query in clob ) return clob is
        l_query clob := p_query;
    begin

        loop
            if substr(l_query,-1) in (chr(10),chr(13),';',' ','/') then
                l_query := substr(l_query,1,length(l_query)-1);
            else
                exit;
            end if;
        end loop;

        return l_query;

    end clean_query;

    -- test if query is valid
    function is_valid_query( p_query in clob ) return varchar2 is
        l_source_query  clob := p_query;
        l_source_queryv clob;

        l_report_cursor integer;
    begin
        if l_source_query is not null then
            if substr(upper(ltrim(l_source_query)),1,6) != 'SELECT'
                    and substr(upper(ltrim(l_source_query)),1,4) != 'WITH' then
                return 'Query must begin with SELECT or WITH';
            end if;

            l_source_query := clean_query( l_source_query );
            l_source_queryv := sys.dbms_assert.noop( str => l_source_query );

            begin
                l_report_cursor := sys.dbms_sql.open_cursor;

                sys.dbms_sql.parse( l_report_cursor, l_source_queryv, SYS.DBMS_SQL.NATIVE );

                sys.dbms_sql.close_cursor(l_report_cursor);

            exception when others then
                if sys.dbms_sql.is_open( l_report_cursor ) then
                    sys.dbms_sql.close_cursor( l_report_cursor );
                end if;
                return sqlerrm;
            end;

        end if;

        return null;
    end is_valid_query;

    -- Procedure: update_standard_status
    -- Updates the standard_statuses table with the current pass/fail
    --   status for each relevant automated test.
    procedure update_standard_status is
        l_query clob;
        l_cursor integer := null;
        l_feedback integer;

        cursor tst_csr is
            select standard_id,
                id test_id,
                test_type,
                name,
                check_sql,
                app_bind_variable,
                failure_help_text
            from eba_stds_standard_tests;
        tst_rec tst_csr%ROWTYPE;

        cursor app_csr( d_standard_id in number, d_test_id in number ) is
            select ap.id application_id,
                ap.apex_app_id,
                aa.last_updated_on app_update,
                st_stat.updated test_run,
                st_stat.pass_fail_pct
            from eba_stds_applications ap,
                eba_stds_standards s,
                eba_stds_standard_type_ref st_type,
                eba_stds_standard_statuses st_stat,
                apex_applications aa
            where s.id = d_standard_id
                and st_type.standard_id = s.id
                and st_type.type_id = ap.type_id
                and aa.application_id = ap.apex_app_id
                and st_stat.standard_id(+) = d_standard_id
                and st_stat.test_id(+) = d_test_id
                and st_stat.application_id(+) = ap.id
            order by ap.apex_app_id;
        app_rec app_csr%ROWTYPE;

        l_message    varchar2(4000);
        l_status     varchar2(1);
        l_identifier varchar2(4000);
        l_pass_cnt   number;
        l_total      number;
        l_start      timestamp with local time zone;
        l_duration   interval day to second;
        l_dur_ms     number;

        procedure save_status( p_standard_id in number, p_application_id in number,
            p_test_id in number, p_status in number, p_duration in number ) is
        begin
            merge into eba_stds_standard_statuses dest
            using ( select p_application_id app_id,
                        p_standard_id standard_id,
                        p_test_id test_id,
                        p_status pass_fail_pct,
                        p_duration duration
                        from dual ) src
            on ( dest.application_id = src.app_id
                and dest.standard_id = src.standard_id
                and dest.test_id = src.test_id )
            when matched then
                update set dest.pass_fail_pct = src.pass_fail_pct, dest.test_duration = src.duration
            when not matched then
                insert ( dest.application_id, dest.standard_id, dest.test_id, dest.pass_fail_pct, dest.test_duration )
                values ( src.app_id, src.standard_id, src.test_id, src.pass_fail_pct, src.duration );
        end save_status;
    begin
        for tst_rec in tst_csr loop
            -- Remove any old records that don't apply any more.
            delete from eba_stds_standard_statuses
            where standard_id = tst_rec.standard_id
                and test_id = tst_rec.test_id
                and not exists (select null
                                from eba_stds_applications ap,
                                    eba_stds_standards s,
                                    eba_stds_standard_type_ref st_type,
                                    eba_stds_standard_statuses st_stat,
                                    apex_applications aa
                                where s.id = tst_rec.standard_id
                                    and st_type.standard_id = s.id
                                    and st_type.type_id = ap.type_id
                                    and aa.application_id = ap.apex_app_id
                                    and st_stat.standard_id(+) = tst_rec.standard_id
                                    and st_stat.test_id(+) = tst_rec.test_id
                                    and st_stat.application_id(+) = ap.id);

            -- Paranoia check.
            l_message := is_valid_query( tst_rec.check_sql );
            for app_rec in app_csr( tst_rec.standard_id, tst_rec.test_id ) loop
                if l_message is not null then
                    save_status( p_standard_id => tst_rec.standard_id,
                        p_application_id => null,
                        p_test_id => tst_rec.test_id,
                        p_status => null,
                        p_duration => null );
                else

                    if app_rec.app_update < nvl(app_rec.test_run, app_rec.app_update-1) then
                        null;
                    else
                        l_pass_cnt := 0;
                        l_total := 0;

                        l_start := localtimestamp;
                        begin
                            l_cursor := sys.dbms_sql.open_cursor;
                            sys.dbms_sql.parse( l_cursor, sys.dbms_assert.noop(tst_rec.check_sql), dbms_sql.native);
                            sys.dbms_sql.bind_variable( l_cursor, tst_rec.app_bind_variable, app_rec.apex_app_id );
                            sys.dbms_sql.define_column( l_cursor, 1, l_status, column_size => 1 );
                            if tst_rec.test_type = 'FAIL_REPORT' then
                                sys.dbms_sql.define_column( l_cursor, 2, l_identifier, column_size => 4000 );
                            end if;

                            l_feedback := sys.dbms_sql.execute( l_cursor );
                            loop
                                l_feedback := sys.dbms_sql.fetch_rows( l_cursor );
                                exit when l_feedback = 0;

                                sys.dbms_sql.column_value( l_cursor, 1, l_status );
                                l_total := l_total + 1;
                                if l_status = 'Y' then
                                    l_pass_cnt := l_pass_cnt + 1;
                                else
                                    -- Check the validations table for false positives.
                                    if tst_rec.test_type = 'FAIL_REPORT' then
                                        sys.dbms_sql.column_value( l_cursor, 2, l_identifier );
                                        for c1 in ( select null
                                                    from eba_stds_test_validations tv
                                                    where tv.test_id = tst_rec.test_id
                                                        and tv.application_id = app_rec.apex_app_id
                                                        and tv.result_identifier = l_identifier
                                                        and tv.false_positive_yn = 'Y' ) loop
                                            l_pass_cnt := l_pass_cnt + 1;
                                        end loop;
                                    else
                                        for c1 in ( select null
                                                    from eba_stds_test_validations tv
                                                    where tv.test_id = tst_rec.test_id
                                                        and tv.application_id = app_rec.apex_app_id
                                                        and tv.result_identifier is null
                                                        and tv.false_positive_yn = 'Y' ) loop
                                            l_pass_cnt := l_pass_cnt + 1;
                                        end loop;
                                    end if;
                                end if;
                            end loop;
                            sys.dbms_sql.close_cursor( l_cursor );

                            l_duration := localtimestamp - l_start;
                            l_dur_ms := extract(   day from l_duration) * 24*60*60*1000
                                      + extract(  hour from l_duration) * 60*60*1000
                                      + extract(minute from l_duration) * 60*1000
                                      + extract(second from l_duration) * 1000;

                            save_status( p_standard_id => tst_rec.standard_id,
                                p_application_id => app_rec.application_id,
                                p_test_id => tst_rec.test_id,
                                -- If the report doesn't return anything, treat it as a pass.
                                p_status => case l_total when 0 then 100 else 100*(l_pass_cnt/l_total) end,
                                p_duration => l_dur_ms );
                        exception when others then
                            -- If the Check SQL is bad, we don't want to raise the error;
                            -- the status will be null, indicating a bad test.
                            if sys.dbms_sql.is_open( l_cursor ) then
                                sys.dbms_sql.close_cursor( l_cursor );
                            end if;
                        end;
                    end if;
                end if;
            end loop;
        end loop;
    end update_standard_status;

    function build_link( p_test_id in number, p_application_id in number, p_param in varchar2 )
            return varchar2 is
        l_app number;
        l_page number;
        l_builder_session number := v('APX_BLDR_SESSION');
        l_link varchar2(4000) := null;
        l_version number;
    begin
        if l_builder_session is null then
            -- Not logged in to the builder; bail out.
            return l_link;
        end if;

        -- Do things differently depending on the APEX version.
        for c1 in ( select to_number(substr(version_no,0,instr(version_no,'.'))) vrsn from apex_release ) loop
            l_version := c1.vrsn;
        end loop;

        if l_version >= 5 then
            l_app := 4000;
            l_page := 4500;
        end if;

        for c1 in ( select link_type from eba_stds_standard_tests where id = p_test_id ) loop
            case c1.link_type
            when 'APPLICATION' then
                l_app := 4000;
                l_page := 1;
                l_link := ':::RP:FB_FLOW_ID,F4000_P1_FLOW,P0_FLOWPAGE:'
                    ||p_application_id||','||p_application_id||','||p_application_id;
            when 'PAGE' then
                if l_version < 5 then
                    l_app := 4000;
                    l_page := 4150;
                    l_link := '::::FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4150_GOTO_PAGE:'
                        ||p_application_id||','||p_param||','||p_param;
                else
                    l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                        ||':'||p_application_id||','||p_param||','||p_application_id||','||p_param||','||p_param
                        ||'#5000:'||p_param;
                end if;
            when 'REGION' then
                for c2 in ( select page_id
                            from apex_application_page_regions
                            where application_id = p_application_id
                                and region_id = p_param ) loop
                    if l_version < 5 then
                        l_app := 4000;
                        l_page := 4651;
                        l_link := ':::RP,4651,960,420,601,4050,27,196,121,232,695,754,832,287,2000'
                            ||':FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4651_ID:'
                            ||p_application_id||','||c2.page_id||','||p_param;
                    else
                        l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                            ||':'||p_application_id||','||c2.page_id||','||p_application_id||','||c2.page_id||','||c2.page_id
                            ||'#5110:'||p_param;
                    end if;
                end loop;
            when 'PAGE_ITEM' then
                for c2 in ( select page_id
                            from apex_application_page_items
                            where application_id = p_application_id
                                and item_id = p_param ) loop
                    if l_version < 5 then
                        l_app := 4000;
                        l_page := 4311;
                        l_link := ':::RP,4311:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4311_ID:'
                            ||p_application_id||','||c2.page_id||','||p_param;
                    else
                        l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                            ||':'||p_application_id||','||c2.page_id||','||p_application_id||','||c2.page_id||','||c2.page_id
                            ||'#5120:'||p_param;
                    end if;
                end loop;
            when 'APP_ITEM' then
                l_app := 4000;
                l_page := 4303;
                l_link := '::::FB_FLOW_ID,F4000_P4303_ID:'
                    ||p_application_id||','||p_param;
            when 'BUTTON' then
                for c2 in ( select page_id
                            from apex_application_page_buttons
                            where application_id = p_application_id
                                and button_id = p_param ) loop
                    if l_version < 5 then
                        l_app := 4000;
                        l_page := 4314;
                        l_link := ':::RP,4314:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P4314_ID:'
                            ||p_application_id||','||c2.page_id||','||p_param;
                    else
                        l_link := '::NO:1,4150:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P4150_GOTO_PAGE,F4000_P1_PAGE'
                            ||':'||p_application_id||','||c2.page_id||','||p_application_id||','||c2.page_id||','||c2.page_id
                            ||'#5130:'||p_param;
                    end if;
                end loop;
            when 'LIST' then
                l_app := 4000;
                l_page := 4050;
                l_link := ':::4050:FB_FLOW_ID,F4000_P4050_LIST_ID:'
                    ||p_application_id||','||p_param;
            when 'LISTENTRY' then
                l_app := 4000;
                l_page := 4052;
                l_link := ':::4050,4052:FB_FLOW_ID,F4000_P4052_ID:'
                    ||p_application_id||','||p_param;
            else
                -- Someone tried to link to a component we don't support yet.
                null;
            end case;
        end loop;

        if l_link is not null then
            l_link := 'f?p='||l_app||':'||l_page||':'||l_builder_session||l_link;
        end if;

        return l_link;
    end build_link;

end eba_stds_parser;
Rem
Rem  Filter Search Body
Rem
create or replace package body eba_stds_filter2_fw as
    --------------------------------------------------------------------------------
    -- HELPER TYPE DEFINITIONS, FUNCTION AND PROCEDURE DECLARATIONS
    type lov_value_t is record (
        d varchar2(4000),
        r varchar2(4000)
    );
    type lov_values_tbl is table of lov_value_t;

    function get_lov_values( p_app_id in number, p_lov_name in varchar2 )
               return lov_values_tbl;

    procedure add_col_to_search( p_collection in varchar2, p_column in varchar2,
                                 p_exact_match in varchar2, p_case_sensitive in varchar2 );

    procedure add_lov_filter( p_collection in varchar2, p_column in varchar2,
                              p_datatype in varchar2, p_header in varchar2,
                              p_lov in varchar2, p_match_on in varchar2 );

    procedure add_numeric_filter( p_collection in varchar2, p_column in varchar2,
                                  p_header in varchar2, p_display in varchar2,
                                  p_filter in varchar2 );

    function enquote( p_name in varchar2 ) return varchar2;
    -- END HELPER DECLARATION SECTION
    --------------------------------------------------------------------------------

    --------------------------------------------------------------------------------
    -- Procedure: reset_collection
    -- Clears the collections if they exist.
    --------------------------------------------------------------------------------
    procedure reset_collection( p_collection in varchar2 ) is
    begin
        apex_collection.create_or_truncate_collection( p_collection_name => p_collection );
        apex_collection.create_or_truncate_collection( p_collection_name => p_collection||'_COL' );
    end reset_collection;

    --------------------------------------------------------------------------------
    -- Procedure: build_collection
    -- Creates and populates the collections which drive the filter search.
    -- This must be called prior to any other procedures/functions.
    -- Arguments: p_col_tbl is a table of eba_stds_filter_column_t.
    --   Must contain a record for each column in the query which is searchable,
    --   whether by text search, list of values filter, or both.
    --  p_collection is the name of the collection to be used for the page.
    --   It should be unique across the application.
    --------------------------------------------------------------------------------
    procedure build_collection( p_collection in varchar2, p_col_tbl in eba_stds_filter_col_tbl ) is
    begin
        -- Create the collections if they don't exist already.
        if not apex_collection.collection_exists( p_collection_name => p_collection ) then
            apex_collection.create_collection( p_collection_name => p_collection );
        end if;
        if not apex_collection.collection_exists( p_collection_name => p_collection||'_COL' ) then
            apex_collection.create_collection( p_collection_name => p_collection||'_COL' );
        end if;
        -- Loop through the columns passed in and process them.
        if p_col_tbl.COUNT > 0 then
            for r in p_col_tbl.FIRST..p_col_tbl.LAST loop
                -- If the column is searchable, add it to the text search collection.
                if p_col_tbl(r).in_text_search_yn = 'Y' then
                    add_col_to_search( p_collection     => p_collection||'_COL',
                                       p_column         => p_col_tbl(r).query_column,
                                       p_exact_match    => p_col_tbl(r).exact_match_yn,
                                       p_case_sensitive => p_col_tbl(r).case_sensitive_yn );
                end if;
                -- If the column is filterable, add the values to the filter collection.
                if p_col_tbl(r).lov_name is not null then
                    add_lov_filter( p_collection => p_collection,
                                    p_column     => p_col_tbl(r).query_column,
                                    p_datatype   => p_col_tbl(r).datatype,
                                    p_header     => p_col_tbl(r).header,
                                    p_lov        => p_col_tbl(r).lov_name,
                                    p_match_on   => p_col_tbl(r).match_column );
                end if;
            end loop;
        end if;
    end build_collection;

    --------------------------------------------------------------------------------
    -- Procedure: render_dropdown
    -- Emits the HTML for a menubar dropdown list of filters.
    --------------------------------------------------------------------------------
    procedure render_dropdown( p_collection in varchar2 ) is
        cursor hdr_csr is
            select header
            from (
                select c002 header, min(seq_id) s_id
                from apex_collections
                where collection_name = p_collection
                    and c001 is not null -- Ignore text searches.
                group by c002)
            order by s_id;
        hdr_rec hdr_csr%ROWTYPE;

        cursor fltr_csr( d_header in varchar2 ) is
            select seq_id,
                c003 disp,
                c010 active
            from apex_collections
            where collection_name = p_collection
                and c002 = d_header
            order by seq_id;
        fltr_rec fltr_csr%ROWTYPE;
    begin
        -- Start the dropdown.
        sys.htp.p('<div class="dropMenuContainer">');
        sys.htp.p('  <a href="javascript:void(0);" class="uButton filterMenuButton"><span>Filter <img src="'||v('IMAGE_PREFIX')||'f_spacer.gif" alt="Show Only..." class="dropDown"></span></a>');
        sys.htp.p('  <div class="menuDrop">');

        for hdr_rec in hdr_csr loop
            -- Start a new group.
            sys.htp.p('    <h4>'||apex_escape.html(hdr_rec.header)||'</h4>');
            sys.htp.p('    <ul>');

            for fltr_rec in fltr_csr( hdr_rec.header ) loop
                -- For each item in the group, create an LI tag.
                -- Note that we add the group, display, and return values to
                -- the link so that we can grab them with javascript in
                -- the dynamic actions.
                sys.htp.p('      <li><a href="#" data-group="'||apex_escape.html(hdr_rec.header)||'" '
                    ||'data-sequence="'||apex_escape.html(fltr_rec.seq_id)||'" '
                    ||'class="filterLink'
                    ||case when fltr_rec.active = 'Y' then ' active' else '' end
                    ||'"><img src="'||v('IMAGE_PREFIX')||'f_spacer.gif" alt=" "><span>'
                    ||apex_escape.html(fltr_rec.disp)||'</span></a></li>');
            end loop;
            -- Close the group.
            sys.htp.p('    </ul>');
        end loop;

        -- Finish the dropdown.
        sys.htp.p('  </div>');
        sys.htp.p('</div>');
    end render_dropdown;

    --------------------------------------------------------------------------------
    -- Procedure: render_sidebar
    -- Emits the HTML for a sidebar list of filters.
    --------------------------------------------------------------------------------
    procedure render_sidebar( p_collection in varchar2 ) is
        cursor hdr_csr is
            select header
            from (
                select c002 header, min(seq_id) s_id
                from apex_collections
                where collection_name = p_collection
                    and c001 is not null -- Ignore text searches.
                group by c002)
            order by s_id;
        hdr_rec hdr_csr%ROWTYPE;

        cursor fltr_csr( d_header in varchar2 ) is
            select seq_id,
                c003 disp,
                c010 active
            from apex_collections
            where collection_name = p_collection
                and c002 = d_header
            order by seq_id;
        fltr_rec fltr_csr%ROWTYPE;

        l_grp  number := 0;
    begin
        for hdr_rec in hdr_csr loop
            -- Start a new group.
            sys.htp.p('<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked">');
 
            sys.htp.p('<div class="t-Form-labelContainer">');
            sys.htp.p('<label for="P_FILTER_'||l_grp||'" id="P_FILTER_'||l_grp||'_LABEL" '
                ||'class="t-Form-label">'||apex_escape.html(hdr_rec.header)||'</label>');
            sys.htp.p('</div>');
            sys.htp.p('  <div class="t-Form-inputContainer">');
            sys.htp.p('    <fieldset tabindex="-1" id="P_FILTER_'||l_grp||'" '
                ||'aria-labelledby="P_FILTER_'||l_grp||'_LABEL" class="checkbox_group">');

            for fltr_rec in fltr_csr( hdr_rec.header ) loop
                -- For each item in the group, create an LI tag.
                -- Note that we add the group, display, and return values to
                -- the link so that we can grab them with javascript in
                -- the dynamic actions.
                sys.htp.p('<input class="filterLink" type="checkbox" id="P_FILTER_'||l_grp||'_'
                    ||apex_escape.html(fltr_rec.seq_id)||'" '
                    ||'data-group="'||apex_escape.html(hdr_rec.header)||'" '
                    ||'data-sequence="'||apex_escape.html(fltr_rec.seq_id)||'"'
                    ||case when fltr_rec.active = 'Y' then ' checked ' else '' end
                    ||'value="'||apex_escape.html(fltr_rec.seq_id)||'">');
                sys.htp.p('<label for="P_FILTER_'||l_grp||'_'
                    ||apex_escape.html(fltr_rec.seq_id)||'">'
                    ||apex_escape.html(fltr_rec.disp)
                    ||'</label><br>');
            end loop;
            -- Close the group.
            sys.htp.p('    </fieldset>');
            sys.htp.p('  </div>');
            sys.htp.p('</div>');
        end loop;
    end render_sidebar;

    --------------------------------------------------------------------------------
    -- Function: get_filter
    -- Returns the active state of the specified filter.
    --------------------------------------------------------------------------------
    function get_filter( p_collection in varchar2, p_seq_id in number ) return varchar2 is
    begin
        for c in (  select c010 ret
                    from apex_collections
                    where collection_name = p_collection
                        and seq_id = p_seq_id ) loop
            return c.ret;
        end loop;

        -- In case the entry doesn't exist in the collection, return null.
        -- Should never happen.
        return null;
    end get_filter;

    --------------------------------------------------------------------------------
    -- Procedure: set_filter
    -- Sets the active state of the specified filter.
    --------------------------------------------------------------------------------
    procedure set_filter( p_collection in varchar2,
                          p_seq_id in number,
                          p_active in varchar2 ) is
        l_cnt number;
    begin
        if p_active = 'N' then
            select count(*) into l_cnt
            from apex_collections
            where collection_name = p_collection
                and seq_id = p_seq_id
                and c001 is null;

            if l_cnt > 0 then
                -- Text search to be removed.
                apex_collection.delete_member( p_collection_name => p_collection,
                                               p_seq             => p_seq_id );
                return;
            end if;
        end if;

        apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                 p_seq => p_seq_id,
                                                 p_attr_number => 10,
                                                 p_attr_value => p_active );
    end set_filter;

    --------------------------------------------------------------------------------
    -- Procedure: set_filter
    -- Alternate entry point to set based on the column & display value.
    --------------------------------------------------------------------------------
    procedure set_filter( p_collection in varchar2,
                          p_column in varchar2,
                          p_dispval in varchar2,
                          p_active in varchar2 ) is
        cursor seq_csr is
            select seq_id
            from apex_collections
            where collection_name = p_collection
                and c001 = p_column
                and (c003 = p_dispval or apex_escape.html(c003) = p_dispval);
        seq_rec seq_csr%ROWTYPE;
    begin
        for seq_rec in seq_csr loop
            set_filter( p_collection => p_collection, p_seq_id => seq_rec.seq_id, p_active => p_active );
        end loop;
    end set_filter;

    --------------------------------------------------------------------------------
    -- Procedure: add_text_search
    -- Adds a search string to the text search filters.
    --------------------------------------------------------------------------------
    procedure add_text_search( p_collection in varchar2, p_text_group in varchar2,
                               p_search_str in varchar2, p_multiple in boolean ) is
        l_x number := 0;
    begin
        -- Text searches are stored similar to filters, but we don't need to
        -- associate them with columns in the query or worry about the display/return
        -- value match flag. For simplicity, we do store the search string in
        -- both the display and return value fields, however.
        if p_multiple then
            select count(*) into l_x
            from apex_collections
            where collection_name = p_collection
                and c006 = 'TEXTSEARCH'
                and c003 = p_search_str;

            -- If the string matches what's already searched, no need to add it again.
            if l_x = 0 then
                apex_collection.add_member( p_collection_name => p_collection,
                                            p_c002 => p_text_group,
                                            p_c003 => p_search_str,
                                            p_c004 => p_search_str,
                                            p_c006 => 'TEXTSEARCH',
                                            p_c010 => 'Y' );
            end if;
        else
            begin
                select seq_id into l_x
                from apex_collections
                where collection_name = p_collection
                    and c006 = 'TEXTSEARCH';

                -- If there's already a search string, replace it.
                apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                         p_seq => l_x,
                                                         p_attr_number => 3,
                                                         p_attr_value => p_search_str );
                apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                         p_seq => l_x,
                                                         p_attr_number => 4,
                                                         p_attr_value => p_search_str );
            exception
                when NO_DATA_FOUND then
                    -- New text search.
                    apex_collection.add_member( p_collection_name => p_collection,
                                                p_c002 => p_text_group,
                                                p_c003 => p_search_str,
                                                p_c004 => p_search_str,
                                                p_c006 => 'TEXTSEARCH',
                                                p_c010 => 'Y' );
            end;
        end if;
    end;

    --------------------------------------------------------------------------------
    -- Function: get_active_filters
    -- Pipelined function to return the active filters. This enables us to "hide"
    -- the collection name.
    --------------------------------------------------------------------------------
    function get_active_filters( p_collection in varchar2 )
            return active_filters_tbl PIPELINED is
        cursor fltr_csr is
            select seq_id filter_sequence,
                c002 filter_group,
                c003 filter_display,
                nvl(to_char(d001),nvl(to_char(n001),c004)) filter_value,
                n001 numeric_value,
                n002 min_num_value,
                n003 max_num_value,
                c015 min_boundary,
                c016 max_boundary,
                d001 date_value,
                last_value(c002) over (order by seq_id rows between unbounded preceding and 1 preceding) active_group,
                c005 match_col
            from apex_collections
            where collection_name = p_collection
                and c010 = 'Y'
            order by seq_id;
        fltr_rec fltr_csr%ROWTYPE;
    begin
        for fltr_rec in fltr_csr loop
            PIPE ROW (fltr_rec);
        end loop;
    end get_active_filters;

    --------------------------------------------------------------------------------
    -- Function: apply_active_filters
    -- Modifies the user's query to include the selected filters.
    -- Usable in classic reports, tabular forms, and other places which allow
    -- for a function returning SQL query.
    --------------------------------------------------------------------------------
    function apply_active_filters( p_collection in varchar2, p_query in clob )
            return clob is
        l_with  clob;
        l_from  clob;
        l_where clob;
        t number := 0;
        d number := 0;

        -- The list of groups with active filter(s). These use 'AND' behavior.
        -- Note that we protect ourselves from having quotes in the group name.
        cursor grp_csr is
            select replace(g.grp,'''','''''') grp, g.col, g.group_type
            from (
                select ac.c002 grp, ac.c001 col, ac.c006 group_type
                from apex_collections ac
                where ac.collection_name = p_collection
                    and ac.c010 = 'Y'
                    and ac.c006 != 'TEXTSEARCH'
                group by ac.c002, ac.c001, ac.c006 ) g;
        grp_rec grp_csr%ROWTYPE;

        -- The active text search string(s). We want 'AND' behavior for these.
        cursor text_csr is
            select seq_id
            from apex_collections
            where collection_name = p_collection
                and c006 = 'TEXTSEARCH';
        text_rec text_csr%ROWTYPE;
        -- The columns used in text searches.
        cursor tscol_csr is
            select c001 col,
                c002 exact,
                c003 case_sensitive
            from apex_collections
            where collection_name = p_collection||'_COL';
        ts_rec tscol_csr%ROWTYPE;
    begin
        l_from := ' select src.* from ('||p_query||') src';
        -- First, apply any active LOV filters.
        for grp_rec in grp_csr loop
            -- The first filter creates the where clause; the others add ANDs.
            if l_where is null then
                l_with := 'with af as ( select /*+ INLINE */ c002 gp, '
                        ||'decode(c005,''D'',c003,c004) m, n001 n, '
                        ||'n002 minv, n003 maxv, c015 inc_min, c016 inc_max, d001 d '
                        ||'from apex_collections where collection_name = '''
                        ||replace(p_collection,'''','''''')||''' '
                        ||'and c001 is not null and c010 = ''Y'' )';
                l_where := ' where ';
            else
                l_where := l_where || ' and ';
            end if;
            -- Create an IN clause for the filter group.
            if grp_rec.group_type = 'NUMBER' then
                -- For numeric columns, check against the numeric value.
                l_where := l_where || 'src.'||enquote(grp_rec.col) || ' in (';
                l_where := l_where||'select af.n from af where af.gp = '''||grp_rec.grp||'''';
                l_where := l_where || ')';
            elsif grp_rec.group_type = 'NUMBER_RANGE' then
                -- For numeric range columns, need to use exists.
                l_where := l_where || 'exists ( select null from af '
                        ||'where af.gp = '''||grp_rec.grp||''' '
                        ||'and (af.minv is null '
                        ||'or ( af.inc_min = ''Y'' and af.minv <= src.'||enquote(grp_rec.col)||') '
                        ||'or ( af.inc_min = ''N'' and af.minv < src.'||enquote(grp_rec.col)||')) '
                        ||'and (af.maxv is null '
                        ||'or ( af.inc_max = ''Y'' and af.maxv >= src.'||enquote(grp_rec.col)||') '
                        ||'or ( af.inc_max = ''N'' and af.maxv > src.'||enquote(grp_rec.col)||')))';
            elsif grp_rec.group_type = 'DATE' then
                -- For date columns, check against the date value.
                l_where := l_where || 'src.'||enquote(grp_rec.col) || ' in (';
                l_where := l_where||'select af.d from af where af.gp = '''||grp_rec.grp||'''';
                l_where := l_where || ')';
            else
                l_where := l_where || 'src.'||enquote(grp_rec.col) || ' in (';
                l_where := l_where||'select af.m from af where af.gp = '''||grp_rec.grp||'''';
                l_where := l_where || ')';
            end if;
        end loop;

        -- Now, apply the text search filters. Applying them after the LOV filters
        -- should allow for better optimization paths.
        for text_rec in text_csr loop
            -- Declare a new view for this particular text filter.
            t := t+1;
            if l_with is null then
                l_with := 'with ';
            else
                l_with := l_with||', ';
            end if;
            l_with := l_with||'tf'||t||' as ( select /*+ INLINE */ c003 m, upper(c003) um from apex_collections '
                                    ||'where collection_name = '''
                                    ||replace(p_collection,'''','''''')||''' and '
                                    ||'seq_id = '||text_rec.seq_id||' )';

            l_from := l_from||', tf'||t;
            -- The first filter (may not have been any LOV filters) creates the where clause; the others add ANDs.
            if l_where is null then
                l_where := l_where || ' where ';
            else
                l_where := l_where || ' and ';
            end if;

            l_where := l_where||'(';
            d := 0;
            for ts_rec in tscol_csr loop
                d := d+1;
                -- Every column checked after the first needs to be ORed in.
                if d > 1 then l_where := l_where ||'or '; end if;
                -- Now, build the condition.
                if ts_rec.exact = 'Y' and ts_rec.case_sensitive = 'Y' then
                    -- Exact, case-sensitive match.
                    l_where := l_where||'src.'||enquote(ts_rec.col)||' = tf'||t||'.m ';
                elsif ts_rec.exact = 'Y' and ts_rec.case_sensitive = 'N' then
                    -- Exact, case-insensitive match.
                    l_where := l_where||'upper(src.'||enquote(ts_rec.col)||')'||' = tf'||t||'.um ';
                elsif ts_rec.exact = 'N' and ts_rec.case_sensitive = 'Y' then
                    -- LIKE search, case-sensitive.
                    l_where := l_where||'src.'||enquote(ts_rec.col)||' like ''%''||tf'||t||'.m||''%'' ';
                elsif ts_rec.exact = 'N' and ts_rec.case_sensitive = 'N' then
                    -- LIKE search, case-insensitive.
                    l_where := l_where||'upper(src.'||enquote(ts_rec.col)||')'||' like ''%''||tf'||t||'.um||''%'' ';
                end if;
            end loop;
            l_where := l_where||')';
        end loop;
        return l_with||l_from||l_where;
    end apply_active_filters;

    --------------------------------------------------------------------------------
    -- HELPER FUNCTION AND PROCEDURE DEFINITIONS
    --------------------------------------------------------------------------------
    -- Function: get_lov_values
    -- Parses a list of values, returning the display and return values.
    -- Note that this does not support any APEX conditionality; authorizations,
    --   build options, and conditions are ignored. Sorry.
    --------------------------------------------------------------------------------
    function get_lov_values( p_app_id in number, p_lov_name in varchar2 )
            return lov_values_tbl is
        l_val lov_value_t;
        l_ret lov_values_tbl := lov_values_tbl();
        cursor lov_csr is
            select lov_type,
                list_of_values_query,
                lov_id
            from apex_application_lovs
            where application_id = p_app_id
                and list_of_values_name = p_lov_name;
        lov_rec lov_csr%ROWTYPE;
        type csr_t is ref cursor;
        dlov_csr csr_t;
    begin
        -- Although the query returns a single row, let PL/SQL handle the cursor.
        for lov_rec in lov_csr loop
            if lov_rec.lov_type = 'Static' then
                -- Static LOVs hold the display and return values in the data dictionary.
                for c1 in (
                        select display_value d, return_value r
                        from apex_application_lov_entries
                        where application_id = p_app_id
                            and lov_id = lov_rec.lov_id
                        order by display_sequence ) loop
                    l_ret.extend;
                    l_ret(l_ret.COUNT).d := c1.d;
                    l_ret(l_ret.COUNT).r := c1.r;
                end loop;
            else
                -- To get the display and return values of dynamic LOVs, we need
                -- to use a weakly-bound cursor.
                open dlov_csr for sys.dbms_assert.noop(lov_rec.list_of_values_query);
                loop
                    fetch dlov_csr into l_val;
                    exit when dlov_csr%NOTFOUND;
                    l_ret.extend;
                    l_ret(l_ret.COUNT) := l_val;
                end loop;
            end if;
        end loop;
        return l_ret;
    end get_lov_values;

    --------------------------------------------------------------------------------
    -- Procedure: add_col_to_search
    -- Adds a column to the text search collection if it isn't already there. If it
    -- is, updates the exact match/case sensitivity columns, just in case.
    --------------------------------------------------------------------------------
    procedure add_col_to_search( p_collection in varchar2, p_column in varchar2,
                                 p_exact_match in varchar2, p_case_sensitive in varchar2 ) is
        l_seq number;
        l_match varchar2(1);
        l_case varchar2(1);
    begin
        -- Collections don't have boolean columns. Convert to varchar2(1).
        if p_exact_match = 'Y' then l_match := 'Y'; else l_match := 'N'; end if;
        if p_case_sensitive = 'Y' then l_case := 'Y'; else l_case := 'N'; end if;

        begin
            select seq_id into l_seq
            from apex_collections
            where collection_name = p_collection
                and c001 = p_column;

            apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                     p_seq => l_seq,
                                                     p_attr_number => 2,
                                                     p_attr_value => l_match );
            apex_collection.update_member_attribute( p_collection_name => p_collection,
                                                     p_seq => l_seq,
                                                     p_attr_number => 3,
                                                     p_attr_value => l_case );
        exception
            when NO_DATA_FOUND then
                -- Column not found in the collection; add it.
                apex_collection.add_member( p_collection_name => p_collection,
                                            p_c001 => p_column,
                                            p_c002 => l_match,
                                            p_c003 => l_case );
        end;
    end add_col_to_search;

    --------------------------------------------------------------------------------
    -- Procedure: add_lov_filter
    -- Adds a filter's values to the collection if they don't already exist.
    --------------------------------------------------------------------------------
    procedure add_lov_filter( p_collection in varchar2, p_column in varchar2,
                              p_datatype in varchar2, p_header in varchar2,
                              p_lov in varchar2, p_match_on in varchar2 ) is
        l_cnt number;
        l_lov_vals lov_values_tbl;
    begin
        -- Get the display and return values for the LOV and loop through them.
        l_lov_vals := get_lov_values( p_app_id => v('APP_ID'), p_lov_name => p_lov );
        if l_lov_vals.COUNT > 0 then
            for vl in l_lov_vals.FIRST..l_lov_vals.LAST loop
                select count(*) into l_cnt
                from apex_collections
                where collection_name = p_collection
                    and c001 = p_column
                    and c002 = p_header
                    and c003 = l_lov_vals(vl).d;

                if l_cnt = 0 then
                    -- Value not found in the collection; add it.
                    if p_datatype in ('NUMBER', 'BINARY_FLOAT', 'BINARY_DOUBLE') then
                        add_numeric_filter( p_collection => p_collection,
                                            p_column => p_column,
                                            p_header => p_header,
                                            p_display => l_lov_vals(vl).d,
                                            p_filter => l_lov_vals(vl).r );
                    elsif p_datatype in ('DATE', 'TIMESTAMP',
                                'TIMESTAMP WITH TIME ZONE',
                                'TIMESTAMP WITH LOCAL TIME ZONE') then
                        apex_collection.add_member( p_collection_name => p_collection,
                                                    p_c001 => p_column,
                                                    p_c002 => p_header,
                                                    p_c003 => l_lov_vals(vl).d,
                                                    p_c006 => 'DATE',
                                                    p_d001 => to_date(l_lov_vals(vl).r),
                                                    p_c005 => p_match_on,
                                                    p_c010 => 'N' );
                    else
                        apex_collection.add_member( p_collection_name => p_collection,
                                                    p_c001 => p_column,
                                                    p_c002 => p_header,
                                                    p_c003 => l_lov_vals(vl).d,
                                                    p_c004 => l_lov_vals(vl).r,
                                                    p_c005 => p_match_on,
                                                    p_c006 => 'VARCHAR',
                                                    p_c010 => 'N' );
                    end if;
                end if;
            end loop;
        end if;
    end add_lov_filter;

    --------------------------------------------------------------------------------
    -- Procedure: add_numeric_filter
    -- Handles adding a numeric filter (exact match or range) to the collection.
    --------------------------------------------------------------------------------
    procedure add_numeric_filter( p_collection in varchar2, p_column in varchar2,
                                  p_header in varchar2, p_display in varchar2,
                                  p_filter in varchar2 ) is
        cursor ftr_csr is
            select decode(substr(p_filter,1,1),'[','Y','N') inc_min,
                decode(substr(p_filter,-1,1),']','Y','N') inc_max,
                to_number(substr(p_filter,2,instr(p_filter,',')-2)) min,
                to_number(substr(p_filter,instr(p_filter,',')+1,length(p_filter)-(instr(p_filter,',')+1))) max
            from dual;
        ftr_rec ftr_csr%ROWTYPE;
    begin
        if substr( p_filter, 1, 1 ) in ('(','[') then
            -- Range filter. Format is: open interval-minimum-comma-maximum-close interval,
            -- where the open and close intervals are either parentheses ()
            -- or brackets []; parentheses show non-inclusive range (up to but not including),
            -- while brackets indicate inclusive (up to and including).
            -- If minimum or maximum are not specified, then the range is unbounded.
            -- Examples:
            --   Less than 10: (,10)
            --   Any number from 1 to 5, but not including 5: [1,5)
            --   100 or more: [100,]
            for ftr_rec in ftr_csr loop
                -- Single-row loop.
                apex_collection.add_member( p_collection_name => p_collection,
                                            p_c001 => p_column,
                                            p_c002 => p_header,
                                            p_c003 => p_display,
                                            p_c006 => 'NUMBER_RANGE',
                                            p_n002 => ftr_rec.min,
                                            p_n003 => ftr_rec.max,
                                            p_c015 => ftr_rec.inc_min,
                                            p_c016 => ftr_rec.inc_max,
                                            p_c010 => 'N' );
            end loop;
        else
            -- Single number filter.
            apex_collection.add_member( p_collection_name => p_collection,
                                        p_c001 => p_column,
                                        p_c002 => p_header,
                                        p_c003 => p_display,
                                        p_c006 => 'NUMBER',
                                        p_n001 => to_number(p_filter),
                                        p_c010 => 'N' );
        end if;
    end add_numeric_filter;

    --------------------------------------------------------------------------------
    -- Function: enquote
    -- Wrapper around sys.dbms_assert_enquote_name to reduce typing.
    --------------------------------------------------------------------------------
    function enquote( p_name in varchar2 ) return varchar2 is
    begin
        return sys.dbms_assert.enquote_name( str => p_name, capitalize => true );
    end enquote;

end eba_stds_filter2_fw;
/
Rem
Rem  eba_stds_security body
Rem
create or replace package body eba_stds_security as
    -------------------------------------------------------------------------
    -- Gets the current user's authorization level. Depends on the following:
    --  * If access control is currently disabled, returns highest level of 3.
    --  * If access control is enabled, but user is not in list, returns 0
    --  * If access control is enabled and user is in list, returns their
    --    access level.
    -------------------------------------------------------------------------
    function get_authorization_level ( p_username varchar2 ) return number
    is
        l_access_level_id       eba_stds_users.access_level_id%type := 0;  -- default to lowest privilege.
        l_account_locked        eba_stds_users.account_locked%type;
    begin
        -- If access control is disabled, default to highest privilege
        if eba_stds_fw.get_preference_value('ACCESS_CONTROL_ENABLED') = 'N' then
            return 3;
        else
            -- Query for user's access level, throws no_data_found if no user
            select access_level_id,
                   account_locked
              into l_access_level_id,
                   l_account_locked
              from eba_stds_users
             where username = p_username;
            -- Check if user's account is locked, return 0 (no privilege), otherwise stick
            -- with their level.
            if l_account_locked = 'Y' then
                return 0;
            end if;
            -- Overwrite user access level 1 with access level 2 if access control scope is PUBLIC_CONTRIBUTE
            if l_access_level_id = 1 and eba_stds_fw.get_preference_value('ACCESS_CONTROL_SCOPE') = 'PUBLIC_CONTRIBUTE' then
                return 2;
            end if;             
        end if;
        return l_access_level_id;
    exception
        when no_data_found then
            -- If no user exists with passed username, do a final check if reader access is set to any authenticated user
            if eba_stds_fw.get_preference_value('ACCESS_CONTROL_SCOPE') = 'PUBLIC_CONTRIBUTE' then
                return 2;
            elsif eba_stds_fw.get_preference_value('ACCESS_CONTROL_SCOPE') = 'PUBLIC_READONLY' then
                return 1;
            else
                return 0;
            end if;            
    end get_authorization_level;
     
    function is_authorized_viewer( 
        p_user in varchar2) return varchar2 is
        l_auth varchar2(1) := 'N';
        l_acl  varchar2(1);
        l_cnt  number      := 0;
    begin
        -- If the user has contributor or administrator access, then we don't need to do the rest.
        if apex_util.public_check_authorization('CONTRIBUTION RIGHTS') then
            return 'Y';
        end if;
        if l_acl = 'N' then
            return 'Y';
        end if;
        if get_authorization_level(p_username => p_user) > 0 then
            return 'Y';
        else
            return 'N';
        end if;
    end is_authorized_viewer;
end eba_stds_security;
/
show errors
    

Rem
Rem  Install ACL Data
Rem
/* Packaged App Tracker access levels */
insert into eba_stds_access_levels (id, access_level) values (1, 'Reader');
insert into eba_stds_access_levels (id, access_level) values (2, 'Contributor');
insert into eba_stds_access_levels (id, access_level) values (3, 'Administrator');

/* Packaged App Tracker preferences */
insert into eba_stds_preferences (id, preference_name, preference_value) values (1, 'ACCESS_CONTROL_ENABLED', 'N');
insert into eba_stds_preferences (id, preference_name, preference_value) values (2, 'ACCESS_CONTROL_SCOPE', 'ACL_ONLY');
insert into eba_stds_preferences (id, preference_name, preference_value) values (3, 'USERNAME_FORMAT', 'EMAIL');

/* Constraint error lookups */
insert into eba_stds_error_lookup (constraint_name, message, language_code) values ('eba_stds_users_uk', 'Username must be unique.', 'en');

commit;


Rem
Rem  Sample Data Package spec
Rem
create or replace package eba_stds_data is
    procedure load_initial_data;
    function is_initial_data_loaded return boolean;

    procedure load_sample_data;
    procedure remove_sample_data;
    function is_sample_data_loaded return boolean;
end eba_stds_data;

Rem
Rem  Sample Data Package body
Rem
create or replace package body eba_stds_data is
    procedure load_initial_data is
    begin
        if not is_initial_data_loaded() then
            insert into eba_stds_types (id, display_sequence, name)
                values (1, 10, 'Default');
            insert into eba_stds_types (id, display_sequence, name)
                values (2, 20, 'Information Technology');
            insert into eba_stds_types (id, display_sequence, name)
                values (3, 30, 'Engineering');

            insert into eba_stds_app_statuses (id, display_sequence, name)
                values (1, 10,'Test Application');
            insert into eba_stds_app_statuses (id, display_sequence, name)
                values (2, 20,'Initial development');
            insert into eba_stds_app_statuses (id, display_sequence, name)
                values (3, 30,'Releasable');
            insert into eba_stds_app_statuses (id, display_sequence, name)
                values (4, 40,'Production');
        end if;
    end load_initial_data;

    function is_initial_data_loaded return boolean is
    begin
        for c1 in ( select null
                    from eba_stds_types
                    where id < 100
                    union
                    select null
                    from eba_stds_app_statuses
                    where id < 100 ) loop
            return true;
        end loop;
        return false;
    end is_initial_data_loaded;

    procedure load_sample_data is
    begin
        if not is_sample_data_loaded() then
            -- Create a sample standard to hold the tests.
            insert into eba_stds_standards ( id, name, description )
            values ( 1, 'Sample Standard', 'A demonstration standard with some example tests.');

            -- Associate the sample standard with all existing application types.
            insert into eba_stds_standard_type_ref ( id, standard_id, type_id )
            select rownum, 1 standard_id, t.id type_id
            from eba_stds_types t
            where not exists ( select null
                               from eba_stds_standard_type_ref r
                               where r.standard_id = 1
                                   and r.type_id = t.id );

            -- Create a few sample tests.
            insert into eba_stds_standard_tests ( id,
                standard_id,
                name,
                test_type,
                link_type,
                check_sql,
                app_bind_variable,
                failure_help_text )
            select 1 id,
                1 standard_id,
                'Item Templates Exist' name,
                'FAIL_REPORT' test_type,
                'PAGE_ITEM' link_type,
                ltrim(rtrim(q'[
select case
        when pi.item_label_template_id is null then 'N'
        when not exists ( select null
                          from apex_application_temp_label tl
                          where pi.item_label_template_id = tl.label_template_id
                              and pi.application_id = tl.application_id ) then 'N'
        else 'Y'
    end as pass_fail,
    pi.item_id,
    pi.page_id||'. '||pi.page_name page,
    pi.region,
    pi.item_name,
    pi.label,
    pi.display_as item_type,
    pi.item_label_template
from apex_application_page_items pi
where pi.application_id = :APP_ID
    and pi.display_as_code not in
        ( 'NATIVE_DISPLAY_ONLY',
           'NATIVE_HIDDEN',
           'NATIVE_STOP_AND_START_HTML_TABLE' )
                    ]',' '||chr(10)||chr(13)),' '||chr(10)||chr(13)) check_sql,
                ':APP_ID' app_bind_variable,
                ltrim(rtrim(q'[
All displayed page items should have an item template that exists in the application.
                    ]',' '||chr(10)||chr(13)),' '||chr(10)||chr(13)) failure_help_text
            from dual;

            insert into eba_stds_standard_tests ( id,
                standard_id,
                name,
                test_type,
                link_type,
                check_sql,
                app_bind_variable,
                failure_help_text )
            select 2 id,
                1 standard_id,
                'Help text, wrong template' name,
                'FAIL_REPORT' test_type,
                'PAGE_ITEM' link_type,
                ltrim(rtrim(q'[
select case when upper(tl.theme_class) like '%WITH HELP%' then 'Y'
        else 'N'
    end as pass_fail,
    pi.item_id,
    pi.page_id||'. '||pi.page_name page,
    pi.region,
    pi.item_name,
    pi.label,
    pi.display_as item_type,
    pi.item_label_template,
    tl.theme_class
from apex_application_page_items pi,
    apex_application_temp_label tl
where pi.application_id = :APP_ID
    and pi.display_as_code != 'NATIVE_HIDDEN'
    and pi.item_help_text is not null
    and pi.item_label_template_id = tl.label_template_id
    and pi.application_id = tl.application_id
                    ]',' '||chr(10)||chr(13)),' '||chr(10)||chr(13)) check_sql,
                ':APP_ID' app_bind_variable,
                ltrim(rtrim(q'[
Items which have help text should have a "with Help" template.
                    ]',' '||chr(10)||chr(13)),' '||chr(10)||chr(13)) failure_help_text
            from dual;

            insert into eba_stds_standard_tests ( id,
                standard_id,
                name,
                test_type,
                link_type,
                check_sql,
                app_bind_variable,
                failure_help_text )
            select 3 id,
                1 standard_id,
                'No Help Text' name,
                'FAIL_REPORT' test_type,
                'PAGE_ITEM' link_type,
                ltrim(rtrim(q'[
select case when upper(tl.theme_class) like '%WITH HELP%' then 'N'
        else 'Y'
    end as pass_fail,
    pi.item_id,
    pi.page_id||'. '||pi.page_name page,
    pi.region,
    pi.item_name,
    pi.label,
    pi.display_as item_type,
    pi.item_label_template,
    tl.theme_class
from apex_application_page_items pi,
    apex_application_temp_label tl
where pi.application_id = :APP_ID
    and pi.display_as_code != 'NATIVE_HIDDEN'
    and pi.item_help_text is null
    and pi.item_label_template_id = tl.label_template_id
    and pi.application_id = tl.application_id
                    ]',' '||chr(10)||chr(13)),' '||chr(10)||chr(13)) check_sql,
                ':APP_ID' app_bind_variable,
                ltrim(rtrim(q'[
Any item with a "with Help" template needs to have help text.
                    ]',' '||chr(10)||chr(13)),' '||chr(10)||chr(13)) failure_help_text
            from dual;
        end if;
    end load_sample_data;

    procedure remove_sample_data is
    begin
        delete from eba_stds_standards
        where id < 100;
    end remove_sample_data;

    function is_sample_data_loaded return boolean is
    begin
        for c1 in ( select null
                    from eba_stds_standards
                    where id < 100
                    union
                    select null
                    from eba_stds_standard_tests
                    where id < 100
                    union
                    select null
                    from eba_stds_standard_type_ref
                    where id < 100 ) loop
            return true;
        end loop;
        return false;
    end is_sample_data_loaded;

end eba_stds_data;

Rem
Rem  Initial Data Load
Rem
begin
    eba_stds_data.load_initial_data();

   insert into eba_stds_applications( apex_app_id, type_id )
   select aa.application_id, 1 type_id
   from apex_applications aa, apex_workspaces wrk
   where not exists (
           select null
           from eba_stds_applications esa
           where esa.apex_app_id = aa.application_id )
       and aa.workspace = wrk.workspace
       and wrk.workspace_id = v('WORKSPACE_ID');
end;
Rem
Rem  Add Flex Columns
Rem
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
Rem
Rem  Flex Registry table and trigger
Rem
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

create or replace trigger eba_stds_flex_registry_biu
    before insert or update on eba_stds_flex_registry
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := eba_stds.gen_id();
        end if;
        :new.row_version_number := 1;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created := localtimestamp;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    :new.updated := localtimestamp;
end eba_stds_flex_registry_biu;
/
show errors

alter trigger eba_stds_flex_registry_biu enable;
Rem
Rem  Flex Page Map table and trigger
Rem
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

create or replace trigger eba_stds_flex_page_map_biu
    before insert or update on eba_stds_flex_page_map
    for each row
begin
    if inserting and :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created := localtimestamp;
    end if;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    :new.updated := localtimestamp;
end eba_stds_flex_page_map_biu;
/
show errors

alter trigger eba_stds_flex_page_map_biu enable;

Rem
Rem  Flex Static LOVs table and trigger
Rem
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

create or replace trigger eba_stds_flex_sttc_lovs_biu
    before insert or update on eba_stds_flex_static_lovs
    for each row
begin
    if inserting and :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.row_version_number := 1;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created := localtimestamp;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    :new.updated := localtimestamp;
end eba_stds_flex_sttc_lovs_biu;
/
show errors

alter trigger eba_stds_flex_sttc_lovs_biu enable;

Rem
Rem  Flex Framework package spec
Rem
create or replace package eba_stds_flex_fw as

    procedure flex_report_update (
        p_flex_table_name    in varchar2,
        p_irr_region_id      in number,
        p_flex_column_prefix in varchar2,
        p_app_id             in number,
        p_page_id            in number,
        p_region_type        in varchar2
    );

    function validate_lov_query ( p_query in varchar2,
        p_display_column out varchar2,
        p_return_column out varchar2,
        p_error out varchar2
    ) return boolean;

    procedure populate_page_map_table;

    procedure reset_flex_registry;

    function fetch_v( p_column in varchar2,
                      p_input in varchar2 ) return varchar2;

    function fetch_n( p_column in varchar2,
                      p_input in number ) return varchar2;

end eba_stds_flex_fw;
/
show errors

Rem
Rem  Flex Framework package body
Rem
create or replace package body eba_stds_flex_fw as

    procedure flex_report_update (
        p_flex_table_name      in     varchar2,
        p_irr_region_id        in     number,
        p_flex_column_prefix   in     varchar2,
        p_app_id               in     number,
        p_page_id              in     number,
        p_region_type          in     varchar2
    ) is
        type postfixes_t is table of varchar2(30);
        l_postfixes postfixes_t
            := postfixes_t( '_FLEX_01','_FLEX_02','_FLEX_03','_FLEX_04',
                            '_FLEX_05','_FLEX_06','_FLEX_07','_FLEX_08',
                            '_FLEX_N01','_FLEX_N02','_FLEX_N03','_FLEX_N04',
                            '_FLEX_D01','_FLEX_D02','_FLEX_D03','_FLEX_D04',
                            '_FLEX_CLOB' );

        l_interactive_report_id number;
        l_region_id             number;
        l_label                 varchar2(255);
        l_alias                 varchar2(255);
        l_display_in_irr        varchar2(1);
        l_is_active             varchar2(1);
        l_format_mask           varchar2(30);
        l_rpt_hdr_alignment     varchar2(30);
        l_lov_type              varchar2(30);
        l_lov_sql_query         varchar2(4000);
        l_condition_type        varchar2(255);
        l_condition1            varchar2(4000);
        l_condition2            varchar2(4000);
        l_allow_sorting         varchar2(1) := 'N';
        l_allow_filtering       varchar2(1) := 'N';
        l_allow_highlighting    varchar2(1) := 'N';
        l_allow_ctrl_breaks     varchar2(1) := 'N';
        l_allow_aggregations    varchar2(1) := 'N';
        l_allow_computations    varchar2(1) := 'N';
        l_allow_charting        varchar2(1) := 'N';
        l_allow_group_by        varchar2(1) := 'N';
        l_allow_hide            varchar2(1) := 'N';
        --
        function get_irr_column_id(
            p_app_id     in     number,
            p_page_id     in     number,
            p_flex_column in     varchar2
        ) return number is
        begin
            for c1 in ( select arc.column_id
                        from apex_application_page_ir_col arc
                        where arc.application_id = p_app_id
                            and arc.page_id = p_page_id
                            and arc.column_alias = p_flex_column ) loop
                return c1.column_id;
            end loop;
            return null;
        end get_irr_column_id;

    begin
        apex_app_builder_api.set_application_id( p_application_id => p_app_id );

        if p_region_type = 'IR' then
            for c1 in (select i.interactive_report_id
                       from apex_application_page_regions r, apex_application_page_ir i
                       where r.application_id = i.application_id
                           and r.page_id = i.page_id
                           and r.region_id = i.region_id
                           and r.application_id = p_app_id
                           and r.page_id = p_page_id
                           and r.region_id = p_irr_region_id) loop
                l_interactive_report_id := c1.interactive_report_id;
            end loop;
        else
            for c1 in (select region_id
                       from apex_application_page_regions
                       where application_id = p_app_id
                           and page_id = p_page_id
                           and region_id = p_irr_region_id) loop
                l_region_id := c1.region_id;
            end loop;
        end if;

        -- Flex Columns
        for pf in 1..l_postfixes.COUNT loop
            l_label := null;
            l_alias := p_flex_column_prefix || l_postfixes(pf);
            for c2 in ( select substr(allow_sorting,1,1) as allow_sorting,
                            substr(allow_filtering,1,1) as allow_filtering,
                            substr(allow_highlighting,1,1) as allow_highlighting,
                            substr(allow_ctrl_breaks,1,1) as allow_ctrl_breaks,
                            substr(allow_aggregations,1,1) as allow_aggregations,
                            substr(allow_computations,1,1) as allow_computations,
                            substr(allow_charting,1,1) as allow_charting,
                            substr(allow_group_by,1,1) as allow_group_by,
                            substr(allow_hide,1,1) as allow_hide
                        from apex_application_page_ir_col
                        where interactive_report_id = l_interactive_report_id
                            and column_alias = l_alias ) loop
                l_allow_sorting      := c2.allow_sorting;
                l_allow_filtering    := c2.allow_filtering;
                l_allow_highlighting := c2.allow_highlighting;
                l_allow_ctrl_breaks  := c2.allow_ctrl_breaks;
                l_allow_aggregations := c2.allow_aggregations;
                l_allow_computations := c2.allow_computations;
                l_allow_charting     := c2.allow_charting;
                l_allow_group_by     := c2.allow_group_by;
                l_allow_hide         := c2.allow_hide;
            end loop;

            for c1 in ( select nvl(fr.report_label_text, fr.form_label_text) label,
                            fr.is_displayed_on_ir,
                            fr.format_mask,
                            fr.rpt_hdr_alignment,
                            case when fr.display_as = 'SELECT_LIST' then fr.lov_type
                                else null
                            end as lov_type,
                            case when fr.display_as = 'SELECT_LIST' then
                                case fr.lov_type
                                    when 'STATIC' then
                                        'STATIC2(~,*):'
                                            ||( select listagg(display_value||'*'||return_value,'~')
                                                    within group ( order by display_sequence )
                                                from eba_stds_flex_static_lovs sl
                                                where sl.flex_table = fr.flexible_table
                                                    and sl.flex_column = fr.flexible_column )
                                    when 'DYNAMIC' then
                                        dbms_lob.substr(fr.lov_sql_query,4000,1)
                                    else
                                        null
                                end
                                else null
                            end as lov_sql_query,
                            fr.condition_type,
                            fr.condition1,
                            fr.condition2,
                            fr.active_yn
                        from eba_stds_flex_registry fr
                        where flexible_table = p_flex_table_name
                            and flexible_column = l_alias ) loop
                l_label             := c1.label;
                l_display_in_irr    := c1.is_displayed_on_ir;
                l_format_mask       := c1.format_mask;
                l_rpt_hdr_alignment := c1.rpt_hdr_alignment;
                -- If the LOV query is undefined, then there is no LOV.
                l_lov_type          := case when c1.lov_sql_query is null then null else c1.lov_type end;
                l_lov_sql_query     := c1.lov_sql_query;
                l_condition_type    := c1.condition_type;
                l_condition1        := c1.condition1;
                l_condition2        := c1.condition2;
                l_is_active         := c1.active_yn;
            end loop;

            if p_region_type = 'IR' and l_label is not null then
                apex_app_builder_api.edit_ir_column (
                    p_id                      => get_irr_column_id(
                                                   p_app_id      => p_app_id,
                                                   p_page_id     => p_page_id,
                                                   p_flex_column => l_alias),
                    p_page_id                 => p_page_id,
                    p_interactive_report_id   => l_interactive_report_id,
                    --
                    p_column_label            => l_label,
                    p_display_text_as        => case
                                                    when l_is_active = 'Y' then 'ESCAPE_SC'
                                                    else 'HIDDEN'
                                                end,
                    p_rpt_show_filter_lov    => 'D',
                    p_rpt_lov                => null,
                    --
                    p_allow_sorting           => l_allow_sorting,
                    p_allow_filtering         => l_allow_filtering,
                    p_allow_highlighting      => l_allow_highlighting,
                    p_allow_ctrl_breaks       => l_allow_ctrl_breaks,
                    p_allow_aggregations      => l_allow_aggregations,
                    p_allow_computations      => l_allow_computations,
                    p_allow_charting          => l_allow_charting,
                    p_allow_group_by          => l_allow_group_by,
                    p_allow_hide              => l_allow_hide,
                    --
                    p_format_mask             => l_format_mask,
                    p_column_link             => null,
                    p_column_linktext         => null,
                    p_column_link_attr        => null,
                    p_display_condition_type  => l_condition_type,
                    p_display_condition       => l_condition1,
                    p_display_condition2      => l_condition2
                    );
            elsif p_region_type = 'CR' and l_label is not null and l_is_active = 'Y' then
                apex_app_builder_api.edit_cr_column (
                    p_page_id                 => p_page_id,
                    p_region_id               => l_region_id,
                    p_column_alias            => l_alias,
                    p_column_label            => l_label,
                    p_heading_alignment       => l_rpt_hdr_alignment,
                    --
                    p_display_as              => case when l_lov_type is not null then 'TEXT_FROM_LOV'
                                                    else 'ESCAPE_SC'
                                                end,
                    p_inline_lov              => l_lov_sql_query,
                    --
                    p_display_when_cond_type  => l_condition_type,
                    p_display_when_condition  => l_condition1,
                    p_display_when_condition2 => l_condition2);
            end if;

        end loop;
    end flex_report_update;

    function validate_lov_query ( p_query in varchar2,
                                  p_display_column out varchar2,
                                  p_return_column out varchar2,
                                  p_error out varchar2
                                ) return boolean is
        l_source_query  varchar2(32767) := p_query;
        l_source_queryv varchar2(32767);
        l_report_cursor integer;
        --
        l_col_cnt number;
        l_cols    sys.dbms_sql.desc_tab2;

        function clean_query( p_query in varchar2 ) return varchar2 is
            l_query varchar2(32767) := p_query;
        begin
            loop
                if substr(l_query,-1) in (chr(10),chr(13),';',' ','/') then
                    l_query := substr(l_query,1,length(l_query)-1);
                else
                    exit;
                end if;
            end loop;
            return l_query;
        end clean_query;

    begin
        if l_source_query is not null then
            if substr(upper(ltrim(l_source_query)),1,6) != 'SELECT'
                    and substr(upper(ltrim(l_source_query)),1,4) != 'WITH' then
                p_error := 'Query must begin with SELECT or WITH';
            else
                l_source_query := clean_query( l_source_query );
                l_source_queryv := sys.dbms_assert.noop( str => l_source_query );
                begin
                    l_report_cursor := sys.dbms_sql.open_cursor;
                    sys.dbms_sql.parse( l_report_cursor, l_source_queryv, SYS.DBMS_SQL.NATIVE );
                    sys.dbms_sql.describe_columns2( l_report_cursor, l_col_cnt, l_cols );
                    sys.dbms_sql.close_cursor(l_report_cursor);
                    if l_col_cnt = 2 then
                        if l_cols(1).col_name_len > 30 or l_cols(2).col_name_len > 30 then
                            p_error := 'Column name too long; please use an alias';
                        else
                            p_display_column := l_cols(1).col_name;
                            p_return_column  := l_cols(2).col_name;
                            p_error := null;
                        end if;
                    else
                        p_error := 'Select List Query must have two columns';
                    end if;
                exception when others then
                    if sys.dbms_sql.is_open( l_report_cursor ) then
                        sys.dbms_sql.close_cursor( l_report_cursor );
                    end if;
                    p_error := sqlerrm;
                end;
            end if;
        else
            p_error := 'Select List Query must have some value';
        end if;

        if p_error is null then
            return true;
        else
            return false;
        end if;
    end validate_lov_query;

    procedure populate_page_map_table
    is
        l_region_type varchar2(10);
        l_prefix      varchar2(30);
        l_app_id      number;
        --
        l_classes     apex_application_global.vc_arr2;
    begin
        l_app_id := nvl(wwv_flow_application_install.get_application_id,v('FB_FLOW_ID'));

        -- Clear out any page mapping data that already exists, as it may be outdated now.
        delete from eba_stds_flex_page_map;

        -- Look through the application pages for regions that have a "FLEX" CSS class.
        for c1 in ( select r.page_id,
                        r.region_css_classes,
                        r.source_type_code,
                        r.region_id
                    from apex_application_page_regions r,
                        apex_application_pages p
                    where r.application_id = l_app_id
                        and r.application_id = p.application_id
                        and r.page_id = p.page_id
                        and r.source_type_code in ('DYNAMIC_QUERY','SQL_QUERY','STATIC_TEXT')
                        and upper(r.region_css_classes) like '%FLEX%'
                ) loop
            --Determine region type
            if c1.source_type_code = 'DYNAMIC_QUERY' then
                l_region_type := 'IR';
            elsif c1.source_type_code = 'SQL_QUERY' then
                l_region_type := 'CR';
            elsif c1.source_type_code = 'STATIC_TEXT' then
                l_region_type := 'FORM';
            end if;

            -- Regions may include flex data from multiple sources, so loop through the list.
            l_classes := apex_util.string_to_table(lower(c1.region_css_classes),' ');
            for i in 1..l_classes.COUNT loop
                -- Populate the flex page map.
                for c2 in ( select flexible_table, table_prefix
                            from eba_stds_flex_registry
                            where report_css_class = l_classes(i)
                            group by flexible_table, table_prefix ) loop
                    insert into eba_stds_flex_page_map
                        ( flex_table, page_id, region_id, flex_column_prefix, region_type )
                    values
                        ( c2.flexible_table, c1.page_id, c1.region_id, c2.table_prefix, l_region_type );
                end loop;
            end loop;
        end loop;
    end populate_page_map_table;

    procedure reset_flex_registry is
    begin
        -- Update all flex registry columns to factory defaults
        update eba_stds_flex_registry
        set friendly_name      = null,
            assigned_yn        = 'N',
            active_yn          = 'N',
            form_label_text    = flexible_column,
            report_label_text  = null,
            is_required_yn     = 'N',
            is_displayed_on_ir = 'N',
            label_template_id  = 0,
            display_as         = 'TEXT',
            width              = 30,
            max_width          = 4000,
            height             = 1,
            format_mask        = null,
            label_alignment    = null,
            help_text          = null,
            lov_type           = null,
            lov_sql_query      = null,
            default_value      = null,
            rpt_hdr_alignment  = null,
            condition_type     = 'EXISTS',
            condition1         = 'select null from eba_stds_flex_registry '
                                    ||'where flexible_table = '''
                                    ||flexible_table
                                    ||''' and flexible_column = '''
                                    ||flexible_column
                                    ||''' and active_yn = ''Y'''
                                    ||' and assigned_yn = ''Y''',
            condition2         = null;

        -- Update CLOB flex registry columns to factory defaults
        update eba_stds_flex_registry
        set display_as  = 'TEXTAREA',
            width       = 80,
            max_width   = 30000,
            height      = 5
        where instr(flexible_column,'FLEX_CLOB') > 0;
    end reset_flex_registry;

    function fetch_v( p_column in varchar2,
                      p_input in varchar2 ) return varchar2 is
        -- The return value. Set to the lookup value by default; if the column
        -- actually has a valid LOV, it will be replaced appropriately.
        l_val varchar2(4000) := p_input;
        -- Variables needed for dealing with dynamic LOVs.
        l_sql     clob;
        type ref_csr_t is ref cursor;
        l_refcsr  ref_csr_t;
    begin
        for c1 in ( select fr.lov_type,
                        fr.lov_sql_query,
                        fr.lov_display_col,
                        fr.lov_return_col
                    from eba_stds_flex_registry fr
                    where flexible_column = p_column ) loop
            if c1.lov_type = 'STATIC' then
                for c2 in ( select display_value
                            from eba_stds_flex_static_lovs
                            where flex_column = p_column
                                and return_value = p_input ) loop
                    l_val := c2.display_value;
                end loop;
            elsif c1.lov_type = 'DYNAMIC' then
                if c1.lov_sql_query is not null then
                    l_sql := 'select ' || sys.dbms_assert.enquote_name(str => c1.lov_display_col, capitalize => false) || ' from ('
                        || sys.dbms_assert.noop(str => c1.lov_sql_query)
                        || ') where ' || sys.dbms_assert.enquote_name(str => c1.lov_return_col, capitalize => false) || ' = '
                        || sys.dbms_assert.enquote_literal(str => replace(p_input,'''',''''''));
                    open l_refcsr for l_sql;
                    -- Normally, we would loop, but we expect just one row.
                    fetch l_refcsr into l_val;
                    close l_refcsr;
                end if;
            end if;
        end loop;

        return l_val;
    end fetch_v;

    function fetch_n( p_column in varchar2,
                      p_input in number ) return varchar2 is
        -- The return value. Set to the lookup value by default; if the column
        -- actually has a valid LOV, it will be replaced appropriately.
        l_val varchar2(4000);
        -- Variables needed for dealing with dynamic LOVs.
        l_sql     clob;
        l_csr     number;
        l_col_cnt number;
        l_cols    dbms_sql.desc_tab;
        type ref_csr_t is ref cursor;
        l_refcsr  ref_csr_t;
    begin
        for c1 in ( select fr.format_mask,
                        fr.lov_type,
                        fr.lov_sql_query,
                        fr.lov_display_col,
                        fr.lov_return_col
                    from eba_stds_flex_registry fr
                    where flexible_column = p_column ) loop
            l_val := to_char( p_input, c1.format_mask );
            if c1.lov_type = 'STATIC' then
                for c2 in ( select display_value
                            from eba_stds_flex_static_lovs
                            where flex_column = p_column
                                and return_value = p_input ) loop
                    l_val := c2.display_value;
                end loop;
            elsif c1.lov_type = 'DYNAMIC' then
                if c1.lov_sql_query is not null then
                    l_sql := 'select ' || sys.dbms_assert.enquote_name(str => c1.lov_display_col, capitalize => false) || ' from ('
                        || sys.dbms_assert.noop(str => c1.lov_sql_query)
                        || ') where ' || sys.dbms_assert.enquote_name(str => c1.lov_return_col, capitalize => false) || ' = '
                        || sys.dbms_assert.enquote_literal(str => replace(p_input,'''',''''''));
                    open l_refcsr for l_sql;
                    -- Normally, we would loop, but we expect just one row.
                    fetch l_refcsr into l_val;
                    close l_refcsr;
                end if;
            end if;
        end loop;

        return l_val;
    end fetch_n;

end eba_stds_flex_fw;
/
show errors
Rem
Rem  Populate flex registry
Rem
declare
    type postfixes_t is table of varchar2(30);
    l_postfixes postfixes_t := postfixes_t(
                          '01','02','03','04',
                          '05','06','07','08',
                          'N01','N02','N03','N04',
                          'D01','D02','D03','D04',
                          'CLOB');

    type table_r is record (
        table_name        varchar2(30),
        report_css_class  varchar2(30),
        display_name_sing varchar2(128),
        display_name_plrl varchar2(128)
    );
    type tables_t is table of table_r index by varchar2(30);
    l_tables tables_t;

    l_tbl varchar2(30);
begin
    --
    l_tables('APPLICATION').table_name        := 'EBA_STDS_APPLICATIONS';
    l_tables('APPLICATION').report_css_class  := 'flex_applications';
    l_tables('APPLICATION').display_name_sing := 'Application';
    l_tables('APPLICATION').display_name_plrl := 'Applications';
    --
    l_tables('STANDARD').table_name        := 'EBA_STDS_STANDARDS';
    l_tables('STANDARD').report_css_class  := 'flex_standards';
    l_tables('STANDARD').display_name_sing := 'Standard';
    l_tables('STANDARD').display_name_plrl := 'Standards';
    --
    l_tables('TEST').table_name        := 'EBA_STDS_STANDARD_TESTS';
    l_tables('TEST').report_css_class  := 'flex_tests';
    l_tables('TEST').display_name_sing := 'Test';
    l_tables('TEST').display_name_plrl := 'Tests';
    --

    l_tbl := l_tables.FIRST;
    while l_tbl is not null loop
        for pf in 1..l_postfixes.COUNT loop
            merge into eba_stds_flex_registry dest
            using ( select l_tbl prefix,
                        l_tables(l_tbl).table_name table_name,
                        l_tbl||'_FLEX_'||l_postfixes(pf) column_name,
                        l_tables(l_tbl).report_css_class report_css_class,
                        l_tables(l_tbl).display_name_sing display_name_sing,
                        l_tables(l_tbl).display_name_plrl display_name_plrl,
                        case when l_postfixes(pf) = 'CLOB'
                            then 'TEXTAREA'
                            else 'TEXT'
                        end as display_as,
                        case when l_postfixes(pf) = 'CLOB'
                            then 80
                            else 30
                        end as width,
                        case when l_postfixes(pf) = 'CLOB'
                            then 30000
                            else 4000
                        end as max_width,
                        case when l_postfixes(pf) = 'CLOB'
                            then 5
                            else 1
                        end as height
                    from dual
            ) src
            on ( dest.flexible_table = src.table_name
                and dest.flexible_column = src.column_name )
            when not matched then
                insert (
                    dest.flexible_table,
                    dest.flexible_column,
                    dest.active_yn,
                    dest.form_label_text,
                    dest.is_required_yn,
                    --
                    dest.report_css_class,
                    dest.table_prefix,
                    dest.display_name_sing,
                    dest.display_name_plrl,
                    --
                    dest.label_template_id,
                    dest.display_as,
                    dest.width,
                    dest.max_width,
                    dest.height,
                    dest.is_displayed_on_ir,
                    dest.assigned_yn,
                    --
                    dest.condition_type,
                    dest.condition1,
                    dest.condition2
                )
                values (
                    src.table_name,
                    src.column_name,
                    'N',
                    src.column_name,
                    'N',
                    --
                    src.report_css_class,
                    src.prefix,
                    src.display_name_sing,
                    src.display_name_plrl,
                    --
                    0,
                    src.display_as,
                    src.width,
                    src.max_width,
                    src.height,
                    'N',
                    'N',
                    --
                    'EXISTS',
                    'select null from eba_stds_flex_registry '
                        ||'where flexible_table = '''||src.table_name
                        ||''' and flexible_column = '''||src.column_name
                        ||''' and active_yn = ''Y'''
                        ||' and assigned_yn = ''Y''',
                    null
                );
        end loop;
        l_tbl := l_tables.NEXT( l_tbl );
    end loop;
end;
/
show errors

commit;
Rem
Rem  Populate flex page map
Rem
declare
    l_app_id number;
begin
    eba_stds_flex_fw.populate_page_map_table();
    -- Make sure we're starting with a clean slate.
    eba_stds_flex_fw.reset_flex_registry();
end;
Rem
Rem  Export Package
Rem
create or replace package eba_stds_export as

    procedure export( p_standard_id in number default null, p_test_id in number default null );

end eba_stds_export;

Rem
Rem  Export Package Body
Rem
create or replace package body eba_stds_export as

    function encode_as_str( p_value in varchar2 ) return varchar2 is
    begin
        if p_value is null then
            return 'null';
        elsif instr( p_value, ']''' ) = 0 then
            return 'q''['||p_value||']''';
        elsif instr( p_value, ')''' ) = 0 then
            return 'q''('||p_value||')''';
        elsif instr( p_value, '#''' ) = 0 then
            return 'q''#'||p_value||'#''';
        elsif instr( p_value, '~''' ) = 0 then
            return 'q''~'||p_value||'~''';
        elsif instr( p_value, '!''' ) = 0 then
            return 'q''!'||p_value||'!''';
        elsif instr( p_value, '"''' ) = 0 then
            return 'q''"'||p_value||'"''';
        elsif instr( p_value, '$''' ) = 0 then
            return 'q''$'||p_value||'$''';
        else
            sys.htp.p('Error: Can''t encode string "'||p_value||'"');
            return p_value;
        end if;
    end encode_as_str;

    function timestamp_as_str( p_value in timestamp ) return varchar2 is
    begin
        if p_value is null then
            return 'null';
        end if;
        return q'[to_timestamp(']'
            ||to_char( p_value, 'DD-MM-YYYY HH24:MI:SS.FF')
            ||q'[', 'DD-MM-YYYY HH24:MI:SS.FF')]';
    end timestamp_as_str;

    procedure export( p_standard_id in number, p_test_id in number ) is
        l_chunk number := 500;
        l_str varchar2(31000) := '';
        l_off number := 1;
        l_sz  number;
        l_crlf char(2) := chr(13)||chr(10);
        l_tab  char(4) := '    ';
    begin
        for c1 in ( select id,              -- number        not null
                        name,               -- varchar2(64)  not null
                        description,        -- varchar2(4000)
                        primary_developer,  -- varchar2(255)
                        implementation,     -- clob
                        date_started,       -- timestamp(6)  not null
                        created,            -- timestamp(6)  not null
                        created_by,         -- varchar2(255) not null
                        updated,            -- timestamp(6)  not null
                        updated_by,         -- varchar2(255) not null
                        standards_flex_01,  -- varchar2(4000)
                        standards_flex_02,  -- varchar2(4000)
                        standards_flex_03,  -- varchar2(4000)
                        standards_flex_04,  -- varchar2(4000)
                        standards_flex_05,  -- varchar2(4000)
                        standards_flex_06,  -- varchar2(4000)
                        standards_flex_07,  -- varchar2(4000)
                        standards_flex_08,  -- varchar2(4000)
                        standards_flex_n01, -- number
                        standards_flex_n02, -- number
                        standards_flex_n03, -- number
                        standards_flex_n04, -- number
                        standards_flex_d01, -- timestamp(6) with local time zone
                        standards_flex_d02, -- timestamp(6) with local time zone
                        standards_flex_d03, -- timestamp(6) with local time zone
                        standards_flex_d04, -- timestamp(6) with local time zone
                        standards_flex_clob -- clob
                    from eba_stds_standards st
                    where (p_standard_id is null
                            or st.id = p_standard_id )
                        and ( p_test_id is null
                            or exists ( select null
                                        from eba_stds_standard_tests tst
                                        where tst.id = p_test_id
                                            and tst.standard_id = st.id ))
                ) loop
            sys.htp.p('delete from eba_stds_standards where id = '||c1.id||';');
            sys.htp.p('insert into eba_stds_standards( '
                ||'id, name, description, primary_developer, '
                ||'date_started, created, created_by, updated, updated_by, '
                ||'standards_flex_01, standards_flex_02, standards_flex_03, '
                ||'standards_flex_04, standards_flex_05, standards_flex_06, '
                ||'standards_flex_07, standards_flex_08, standards_flex_n01, '
                ||'standards_flex_n02, standards_flex_n03, standards_flex_n04, '
                ||'standards_flex_d01, standards_flex_d02, standards_flex_d03, '
                ||'standards_flex_d04 ) '
                ||'values ('
                ||c1.id||', '
                ||encode_as_str(c1.name)||', '
                ||encode_as_str(c1.description)||', '
                ||encode_as_str(c1.primary_developer)||', '
                ||timestamp_as_str(c1.date_started)||', '
                ||timestamp_as_str(c1.created)||', '
                ||encode_as_str(c1.created_by)||', '
                ||timestamp_as_str(c1.updated)||', '
                ||encode_as_str(c1.updated_by)||', '
                ||encode_as_str(c1.standards_flex_01)||', '
                ||encode_as_str(c1.standards_flex_02)||', '
                ||encode_as_str(c1.standards_flex_03)||', '
                ||encode_as_str(c1.standards_flex_04)||', '
                ||encode_as_str(c1.standards_flex_05)||', '
                ||encode_as_str(c1.standards_flex_06)||', '
                ||encode_as_str(c1.standards_flex_07)||', '
                ||encode_as_str(c1.standards_flex_08)||', '
                ||nvl(to_char(c1.standards_flex_n01),'null')||', '
                ||nvl(to_char(c1.standards_flex_n02),'null')||', '
                ||nvl(to_char(c1.standards_flex_n03),'null')||', '
                ||nvl(to_char(c1.standards_flex_n04),'null')||', '
                ||timestamp_as_str(c1.standards_flex_d01)||', '
                ||timestamp_as_str(c1.standards_flex_d02)||', '
                ||timestamp_as_str(c1.standards_flex_d03)||', '
                ||timestamp_as_str(c1.standards_flex_d04)||');'
            );
            -- Save implementation
            if dbms_lob.getlength( c1.implementation ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.implementation );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.implementation, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standards '
                    ||'set implementation = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;
            -- Save standards_flex_clob
            if dbms_lob.getlength( c1.standards_flex_clob ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.standards_flex_clob );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.standards_flex_clob, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standards '
                    ||'set standards_flex_clob = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;
        end loop;

        for c1 in ( select id,              -- number       not null
                        standard_id,       -- number       not null
                        test_type,         -- varchar2(16) not null
                        name,              -- varchar2(64) not null
                        display_sequence,  -- number
                        check_sql,         -- clob
                        app_bind_variable, -- varchar2(30) not null
                        link_type,         -- varchar2(64)
                        failure_help_text, -- varchar2(4000)
                        created,           -- timestamp(6) with local time zone   not null
                        created_by,        -- varchar2(255) not null
                        updated,           -- timestamp(6) with local time zone   not null
                        updated_by,        -- varchar2(255) not null
                        tests_flex_01,     -- varchar2(4000)
                        tests_flex_02,     -- varchar2(4000)
                        tests_flex_03,     -- varchar2(4000)
                        tests_flex_04,     -- varchar2(4000)
                        tests_flex_05,     -- varchar2(4000)
                        tests_flex_06,     -- varchar2(4000)
                        tests_flex_07,     -- varchar2(4000)
                        tests_flex_08,     -- varchar2(4000)
                        tests_flex_n01,    -- number
                        tests_flex_n02,    -- number
                        tests_flex_n03,    -- number
                        tests_flex_n04,    -- number
                        tests_flex_d01,    -- timestamp(6) with local time zone
                        tests_flex_d02,    -- timestamp(6) with local time zone
                        tests_flex_d03,    -- timestamp(6) with local time zone
                        tests_flex_d04,    -- timestamp(6) with local time zone
                        tests_flex_clob    -- clob
                    from eba_stds_standard_tests tst
                    where ( p_test_id is null
                            or tst.id = p_test_id )
                        and ( p_standard_id is null
                            or tst.standard_id = p_standard_id )
                ) loop
            sys.htp.p('delete from eba_stds_standard_tests where id = '||c1.id||';');
            sys.htp.p('insert into eba_stds_standard_tests( '
                ||'id, standard_id, test_type, name, display_sequence, '
                ||'app_bind_variable, link_type, failure_help_text, created, '
                ||'created_by, updated, updated_by, tests_flex_01, tests_flex_02, '
                ||'tests_flex_03, tests_flex_04, tests_flex_05, tests_flex_06, '
                ||'tests_flex_07, tests_flex_08, tests_flex_n01, tests_flex_n02, '
                ||'tests_flex_n03, tests_flex_n04, tests_flex_d01, tests_flex_d02, '
                ||'tests_flex_d03, tests_flex_d04 ) '
                ||'values ('
                ||c1.id||', '
                ||c1.standard_id||', '
                ||encode_as_str(c1.test_type)||', '
                ||encode_as_str(c1.name)||', '
                ||c1.display_sequence||', '
                ||encode_as_str(c1.app_bind_variable)||', '
                ||encode_as_str(c1.link_type)||', '
                ||encode_as_str(c1.failure_help_text)||', '
                ||timestamp_as_str(c1.created)||', '
                ||encode_as_str(c1.created_by)||', '
                ||timestamp_as_str(c1.updated)||', '
                ||encode_as_str(c1.updated_by)||', '
                ||encode_as_str(c1.tests_flex_01)||', '
                ||encode_as_str(c1.tests_flex_02)||', '
                ||encode_as_str(c1.tests_flex_03)||', '
                ||encode_as_str(c1.tests_flex_04)||', '
                ||encode_as_str(c1.tests_flex_05)||', '
                ||encode_as_str(c1.tests_flex_06)||', '
                ||encode_as_str(c1.tests_flex_07)||', '
                ||encode_as_str(c1.tests_flex_08)||', '
                ||nvl(to_char(c1.tests_flex_n01),'null')||', '
                ||nvl(to_char(c1.tests_flex_n02),'null')||', '
                ||nvl(to_char(c1.tests_flex_n03),'null')||', '
                ||nvl(to_char(c1.tests_flex_n04),'null')||', '
                ||timestamp_as_str(c1.tests_flex_d01)||', '
                ||timestamp_as_str(c1.tests_flex_d02)||', '
                ||timestamp_as_str(c1.tests_flex_d03)||', '
                ||timestamp_as_str(c1.tests_flex_d04)
                ||');'
            );
            -- Save check_sql
            if dbms_lob.getlength( c1.check_sql ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.check_sql );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.check_sql, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standard_tests '
                    ||'set check_sql = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;
            -- Save tests_flex_clob
            if dbms_lob.getlength( c1.tests_flex_clob ) > 0 then
                l_off := 1;
                sys.htp.p('declare'||l_crlf||l_tab||'l_clob clob;'||l_crlf||'begin');
                sys.htp.p(l_tab||'dbms_lob.createtemporary( l_clob, true, dbms_lob.session );');
                l_sz := dbms_lob.getlength( c1.tests_flex_clob );
                while( l_off < l_sz ) loop
                    sys.htp.p(l_tab||'dbms_lob.append( l_clob, '
                        ||encode_as_str(dbms_lob.substr( c1.tests_flex_clob, l_chunk, l_off ))
                        ||' );');
                   l_off := l_off + l_chunk;
                end loop;
                sys.htp.p(l_tab||'update eba_stds_standard_tests '
                    ||'set tests_flex_clob = l_clob where id = '||c1.id||';');
                sys.htp.p(l_tab||'dbms_lob.freetemporary( l_clob );'
                    ||l_crlf||'end;'||l_crlf||'/');
            end if;
        end loop;
    end export;
end eba_stds_export;
Rem
Rem  Set First Run Preference
Rem
begin
    eba_stds_fw.set_preference_value( p_preference_name => 'FIRST_RUN', p_preference_value => 'YES' );
end;
