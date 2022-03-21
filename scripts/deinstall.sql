begin
    wwv_flow_api.create_or_remove_file( 
        p_location => 'APPLICATION',
        p_name     => 'fs-sprite.png',
        p_mode     => 'REMOVE',
        p_type     => 'IMAGE');
end;
/

declare
    l_stmt varchar2(1000);
begin
    for c1 in ( select sj.job_name, ao.object_name
                from user_scheduler_jobs sj, sys.all_objects ao
                where sj.job_name = 'EBA_STDS_TEST_UPD_JOB'
                    and ao.object_name in ('DBMS_SCHEDULER', 'CLOUD_SCHEDULER')
                    and ao.object_type = 'PACKAGE'
                order by object_name desc ) loop
        l_stmt := '[begin '||sys.dbms_assert.enquote_name(c1.object_name, false)
            ||'.drop_job( name => '''||c1.job_name||'''); end;]';
        execute immediate l_stmt;
        return;
    end loop;
end;
/

drop type eba_stds_filter_col_tbl;
drop type eba_stds_filter_column_t;

drop table eba_stds_flex_page_map      cascade constraints;
drop table eba_stds_flex_registry      cascade constraints;
drop table eba_stds_flex_static_lovs   cascade constraints;
drop table eba_stds_standard_statuses  cascade constraints;
drop table eba_stds_standard_type_ref  cascade constraints;
drop table eba_stds_standard_app_ref   cascade constraints;
drop table eba_stds_standard_tests     cascade constraints;
drop table eba_stds_standards          cascade constraints;
drop table eba_stds_app_statuses       cascade constraints;
drop table eba_stds_applications       cascade constraints;
drop table eba_stds_types              cascade constraints;
drop table eba_stds_notes              cascade constraints;
drop table eba_stds_access_levels      cascade constraints;
drop table eba_stds_history            cascade constraints;
drop table eba_stds_tags               cascade constraints;
drop table eba_stds_tags_type_sum      cascade constraints;
drop table eba_stds_tags_sum           cascade constraints;
drop table eba_stds_notifications      cascade constraints;
drop table eba_stds_preferences        cascade constraints;
drop table eba_stds_error_lookup       cascade constraints;
drop table eba_stds_users              cascade constraints;
drop table eba_stds_tz_pref            cascade constraints;
drop table eba_stds_errors             cascade constraints;
drop table eba_stds_test_validations   cascade constraints;

drop sequence eba_stds_seq;

drop package  eba_stds_export;
drop package  eba_stds_flex_fw;
drop package  eba_stds_filter2_fw;
drop package  eba_stds_parser;
drop package  eba_stds;
drop package  eba_stds_fw;
drop package  eba_stds_security;
drop package  eba_stds_data;

-- select apex_string.format('drop view %0;',lower(view_name)) stmt
-- from user_views
-- where (lower(view_name) like '%ast%' ) or  (lower(view_name) like 'v_eba%' )

drop view v_ast_apex_accessibility_item_label;
drop view v_ast_apex_accessibility_page_title;
drop view v_ast_apex_accessibility_theme;
drop view v_ast_apex_app_auth;
drop view v_ast_apex_app_item_naming;
drop view v_ast_apex_html_escaping_cols;
drop view v_ast_apex_item_help;
drop view v_ast_apex_page_auth;
drop view v_ast_apex_page_help;
drop view v_ast_apex_page_item_naming;
drop view v_ast_db_plsql_1_commented_specs;
drop view v_ast_db_plsql_2_deprecated_code;
drop view v_ast_db_plsql_3_duplicate_statements;
drop view v_ast_db_plsql_4_identifier_naming;
drop view v_ast_db_plsql_5_unusued_identifiers;
drop view v_ast_db_plsql_all;
drop view v_eba_stds_standard_tests;