create or replace package body eba_stds_data is

    gc_scope_prefix constant varchar2(32) := lower($$plsql_unit) || '.';

    procedure load_initial_data is
    l_scope varchar2(128) := gc_scope_prefix || 'load_initial_data';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';
        
    type rec_data is varray(3) of varchar2(4000);
    type tab_data is table of rec_data index by pls_integer;
    
        procedure load_eba_stds_types is 
        l_data tab_data;
        l_row eba_stds_types%rowtype;
        begin
            l_data(l_data.count + 1) := rec_data('Default'               , '10', 1);
            l_data(l_data.count + 1) := rec_data('Information Technology', '20', 2);
            l_data(l_data.count + 1) := rec_data('Engineering'           , '30', 3);
            l_data(l_data.count + 1) := rec_data('Test Application'      , '40', 4);
            l_data(l_data.count + 1) := rec_data('Initial development'   , '50', 5);
            l_data(l_data.count + 1) := rec_data('Releasable'            , '60', 6);
            l_data(l_data.count + 1) := rec_data('Production'            , '70', 7);
            l_data(l_data.count + 1) := rec_data('DB Supporting Objects' , '80', 8);

            for i in 1..l_data.count loop
                l_row.name := l_data(i)(1);
                l_row.id := l_data(i)(2);
                l_row.display_sequence := l_data(i)(3);

                merge into eba_stds_types dest
                using (
                    select
                    l_row.name name
                    from dual
                ) src
                on (1=1
                    and dest.name = src.name
                )
                when matched then
                update
                    set
                    dest.id = l_row.id,
                    dest.display_sequence = l_row.display_sequence
                when not matched then
                insert (
                    name,
                    id,
                    display_sequence)
                values(
                    l_row.name,
                    l_row.id,
                    l_row.display_sequence)
                ;
            end loop;
        end load_eba_stds_types;

        procedure load_eba_stds_app_statuses is 
        l_data_as tab_data;
        l_row_as eba_stds_app_statuses%rowtype;
        begin
             l_data_as(l_data_as.count + 1) := rec_data(1, 'Test Application', 10);
             l_data_as(l_data_as.count + 1) := rec_data(2, 'Initial Development', 20);
             l_data_as(l_data_as.count + 1) := rec_data(3, 'Releasable', 30);
             l_data_as(l_data_as.count + 1) := rec_data(4, 'Production', 40);

            for i in 1..l_data_as.count loop
              l_row_as.id := l_data_as(i)(1);
              l_row_as.name := l_data_as(i)(2);
              l_row_as.display_sequence := l_data_as(i)(3);

              merge into eba_stds_app_statuses dest
                using (
                  select
                    l_row_as.id id
                  from dual
                ) src
                on (1=1
                  and dest.id = src.id
                )
              when matched then
                update
                  set
                    -- Don't update the value as it's probably a key/secure value
                    -- Deletions are handled above
                    dest.name = l_row_as.name,
                    dest.display_sequence = l_row_as.display_sequence
              when not matched then
                insert (
                  id,
                  name,
                  display_sequence)
                values(
                  l_row_as.id,
                  l_row_as.name,
                  l_row_as.display_sequence)
              ;
            end loop;
        end load_eba_stds_app_statuses;
    begin
        apex_debug.message(l_debug_template,'START');

        if not is_initial_data_loaded() then
            load_eba_stds_types;
            load_eba_stds_app_statuses;
        end if;

    exception when others then 
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;
    end load_initial_data;
    
    function is_initial_data_loaded return boolean is
    l_scope varchar2(128) := gc_scope_prefix || 'is_initial_data_loaded';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';

    begin
        apex_debug.message(l_debug_template,'START');

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
    exception when others then 
        apex_debug.error(p_message => l_debug_template, p0 =>'Unhandled Exception', p1 => sqlerrm, p5 => sqlcode, p6 => dbms_utility.format_error_stack, p7 => dbms_utility.format_error_backtrace, p_max_length=> 4096);
        raise;
    end is_initial_data_loaded;

    procedure load_sample_data is
    l_scope varchar2(128) := gc_scope_prefix || 'load_sample_data';
    l_debug_template varchar2(4096) := l_scope||' %0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20';

        procedure load_eba_stds_standards is 
        type rec_data is varray(3) of varchar2(4000);
        type tab_data is table of rec_data index by pls_integer;
        l_data tab_data;
        l_row eba_stds_standards%rowtype;
        begin
            -- Create a sample standard to hold the tests.
            l_data(l_data.count + 1) := rec_data(1, 'APEX General Standards', 'These are best practices that probably apply to any given APEX application.');
            l_data(l_data.count + 1) := rec_data(2, 'APEX Accessibility Standards', 'These are standards to maintain Accessibility.');
            l_data(l_data.count + 1) := rec_data(3, 'Supporting DB Object Standards', 'These tests run against the DB objects and therefore may be hard to associate with a given application. They can be associated with the "Application Standards Tracker" app.');


            for i in 1..l_data.count loop
              l_row.id := l_data(i)(1);
              l_row.name := l_data(i)(2);
              l_row.description := l_data(i)(3);

              merge into eba_stds_standards dest
                using (
                  select
                    l_row.id id
                  from dual
                ) src
                on (1=1
                  and dest.id = src.id
                )
              when matched then
                update
                  set
                    -- Don't update the value as it's probably a key/secure value
                    -- Deletions are handled above
                    dest.name = l_row.name,
                    dest.description = l_row.description
              when not matched then
                insert (
                  id,
                  name,
                  description)
                values(
                  l_row.id,
                  l_row.name,
                  l_row.description)
              ;
            end loop;
        end load_eba_stds_standards;
        procedure load_eba_stds_standard_type_ref
        is 
        begin
          insert into eba_stds_standard_type_ref ( standard_id, type_id )
            select 1 standard_id, t.id type_id
            from eba_stds_types t
            where not exists ( select null
                               from eba_stds_standard_type_ref r
                               where r.standard_id = 1
                                   and r.type_id = t.id )
            union all 
            select 2 standard_id, t.id type_id
            from eba_stds_types t
            where not exists ( select null
                               from eba_stds_standard_type_ref r
                               where r.standard_id = 2
                                   and r.type_id = t.id );
        end load_eba_stds_standard_type_ref;
        procedure load_eba_stds_standard_tests
        is
        type rec_t_data is varray(7) of varchar2(4000);
        type tab_t_data is table of rec_t_data index by pls_integer;
        l_st_data tab_t_data;
        l_st_row eba_stds_standard_tests%rowtype;
        l_general_standard    eba_stds_standard_tests.standard_id%type := 1;
        l_accessible_standard eba_stds_standard_tests.standard_id%type := 2;
        l_db_object_standard  eba_stds_standard_tests.standard_id%type := 3;
        begin
          -- Column order:
          -- 9_eba_stds_standard_tests
          -- 1: query_view
          -- 2: name
          -- 3: display_sequence
          -- 4: test_type
          -- 5: standard_id
          -- 6: link_type
          -- 7: failure_help_text

          -- Template
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_APP_AUTH', 'Application has Authorization scheme', 10, 'FAIL_REPORT', l_general_standard, 'APPLICATION', 
                                            'All Applications should have Authorization schemes.');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_PAGE_AUTH', 'Application Pages have Authorization schemes', 15, 'FAIL_REPORT', l_general_standard, 'PAGE', 
                                            'All Application Pages should have an Authorization schemes.');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_APP_ITEM_NAMING', 'Application Item correctly prefixed', 20, 'FAIL_REPORT', l_general_standard, 'APP_ITEM', 
                                            'All Application Item should be prefixed with "G_".');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_HTML_ESCAPING_COLS', 'Report Columns escape HTML', 30, 'FAIL_REPORT', l_general_standard, 'REGION', 
                                            'Interactive Reports and Grids should escape HTML to protect against XSS attacks.');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_ITEM_HELP', 'Page Items have help', 40, 'FAIL_REPORT', l_general_standard, 'PAGE_ITEM', 
                                            'Page Items should provide Help Text to users.');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_PAGE_HELP', 'Pages have help', 50, 'FAIL_REPORT', l_general_standard, 'PAGE', 
                                            'Pages should provide Help Text to users.');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_PAGE_ITEM_NAMING', 'Page Items correctly prefixed', 60, 'FAIL_REPORT', l_general_standard, 'PAGE_ITEM', 
                                            'Page Items should be prefixed "P" and the [page id], e.g. "P1_ITEM".');

          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_ACCESSIBILITY_THEME', 'Theme Style tested for accessibility', 100, 'FAIL_REPORT', l_accessible_standard, 'APPLICATION', 
                                            'Is your app using a Theme Style that has been tested for accessibility? Theme Styles that have not been accessibility tested may contain more issues, such as insufficient color contrast.');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_ACCESSIBILITY_ITEM_LABEL', 'Page item has label', 110, 'FAIL_REPORT', l_accessible_standard, 'PAGE_ITEM', 
                                            'Does the item have a label defined? For example just defining the "Value Placeholder" text is not sufficient in labelling an item for accessibility.');
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_ACCESSIBILITY_PAGE_TITLE', 'Page has page title', 120, 'FAIL_REPORT', l_accessible_standard, 'PAGE', 
                                            'Does the page have a title? Meaningful page titles are important for accessibility, to help users understand the content and purpose of the current page. Note: Global pages, and pages with no regions are excluded from this check.');
          
          l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_DB_PLSQL_ALL', 'PL/SQL code standards', 200, 'FAIL_REPORT', l_db_object_standard, 'DB_SUPPORTING_OBJECT', 
                                            'Enforcing PL/SQL code standards.');


          for i in 1..l_st_data.count loop
            l_st_row.query_view := l_st_data(i)(1);
            l_st_row.name := l_st_data(i)(2);
            l_st_row.display_sequence := l_st_data(i)(3);
            l_st_row.test_type := l_st_data(i)(4);
            l_st_row.standard_id := l_st_data(i)(5);
            l_st_row.link_type := l_st_data(i)(6);
            l_st_row.failure_help_text := l_st_data(i)(7);

            merge into eba_stds_standard_tests dest
              using (
                select
                  l_st_row.query_view query_view
                from dual
              ) src
              on (1=1
                and dest.query_view = src.query_view
              )
            when matched then
              update
                set
                  -- Don't update the value as it's probably a key/secure value
                  -- Deletions are handled above
                  dest.name = l_st_row.name,
                  dest.display_sequence = l_st_row.display_sequence,
                  dest.test_type = l_st_row.test_type,
                  dest.standard_id = l_st_row.standard_id,
                  dest.link_type = l_st_row.link_type,
                  dest.failure_help_text = l_st_row.failure_help_text
            when not matched then
              insert (
                query_view,
                name,
                display_sequence,
                test_type,
                standard_id,
                link_type,
                failure_help_text
                )
              values(
                l_st_row.query_view,
                l_st_row.name,
                l_st_row.display_sequence,
                l_st_row.test_type,
                l_st_row.standard_id,
                l_st_row.link_type,
                l_st_row.failure_help_text
                )
            ;
          end loop;
        end load_eba_stds_standard_tests;
    begin
        apex_debug.message(l_debug_template,'START');
        
        if not is_sample_data_loaded() then
            load_eba_stds_standards;
            
            -- Associate the sample standard with all existing application types.
            load_eba_stds_standard_type_ref;
            
            -- Create a few sample tests.
            load_eba_stds_standard_tests;
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
/