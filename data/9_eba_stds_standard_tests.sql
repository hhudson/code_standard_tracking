set define off;

PROMPT eba_stds_standard_tests data

declare
  type rec_t_data is varray(7) of varchar2(4000);
  type tab_t_data is table of rec_t_data index by pls_integer;
  l_st_data tab_t_data;
  l_st_row eba_stds_standard_tests%rowtype;
  l_general_standard    eba_stds_standard_tests.standard_id%type := 1;
  l_accessible_standard eba_stds_standard_tests.standard_id%type := 2;
  l_db_object_standard  eba_stds_standard_tests.standard_id%type := 3;
  l_broken_standard     eba_stds_standard_tests.standard_id%type := 4;
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
  -- General
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
  -- accessibility
  l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_ACCESSIBILITY_THEME', 'Theme Style tested for accessibility', 100, 'FAIL_REPORT', l_accessible_standard, 'APPLICATION', 
                                    'Is your app using a Theme Style that has been tested for accessibility? Theme Styles that have not been accessibility tested may contain more issues, such as insufficient color contrast.');
  l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_ACCESSIBILITY_ITEM_LABEL', 'Page item has label', 110, 'FAIL_REPORT', l_accessible_standard, 'PAGE_ITEM', 
                                    'Does the item have a label defined? For example just defining the "Value Placeholder" text is not sufficient in labelling an item for accessibility.');
  l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_ACCESSIBILITY_PAGE_TITLE', 'Page has page title', 120, 'FAIL_REPORT', l_accessible_standard, 'PAGE', 
                                    'Does the page have a title? Meaningful page titles are important for accessibility, to help users understand the content and purpose of the current page. Note: Global pages, and pages with no regions are excluded from this check.');
  --db object
  l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_DB_PLSQL_ALL', 'PL/SQL code standards', 200, 'FAIL_REPORT', l_db_object_standard, 'DB_SUPPORTING_OBJECT', 
                                    'Enforcing PL/SQL code standards.');
  --Broken functionality
  l_st_data(l_st_data.count + 1) := rec_t_data('V_AST_APEX_VALID_LIST_LINKS', 'Links to invalid applications', 300, 'FAIL_REPORT', l_broken_standard, 'LISTENTRY', 
                                    'List Entries should not link to applications that have been made "unavailable"');

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

end;
/
