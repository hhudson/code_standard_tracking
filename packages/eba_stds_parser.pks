create or replace package eba_stds_parser authid definer as
    g_collection constant varchar2(255):= 'EBA_STDS_PARSER';
    g_false_neg  constant varchar2(31) := 'FALSE_NEGATIVE';
    g_legacy     constant varchar2(31) := 'LEGACY';

    function is_valid_query( p_query in clob ) return varchar2;
    
    -- function is_valid_query( p_query in clob ) return varchar2;
    function view_sql (p_view_name in user_views.view_name%type) return clob;

    procedure validate_view( p_view_name in user_views.view_name%type       default null,
                             p_test_id   in eba_stds_standard_tests.id%type default null,
                             x_view_sql  out nocopy user_views.text%type,
                             x_feedback  out nocopy varchar2,
                             x_pass      out nocopy boolean);

    procedure update_standard_status;
    function build_link( p_test_id        in eba_stds_standard_tests.id%type, 
                         p_application_id in apex_applications.application_id%type, 
                         p_param          in varchar2
                         )
        return varchar2;
    
  procedure load_collection(p_test_id        in eba_stds_standard_tests.id%type,
                            p_page_id        in apex_application_pages.page_id%type,
                            p_application_id in apex_applications.application_id%type default null
                            );
    
    procedure assert_exception (
                p_result_identifier in eba_stds_test_validations.result_identifier%type,
                p_test_id           in eba_stds_test_validations.test_id%type          default null,
                p_app_id            in eba_stds_test_validations.application_id%type   default null,
                p_exception_type    in varchar2                                        default g_false_neg
                );

    
    function test_results_sql return varchar2;

    function test_status_sql return varchar2;
    
    procedure run_all_tests (p_standard_id in eba_stds_standards.id%type);

    procedure add_applications;

    procedure bulk_mark_exception (
                p_test_id           in eba_stds_test_validations.test_id%type          default null,
                p_app_id            in eba_stds_test_validations.application_id%type   default null,
                p_exception_type    in varchar2                                        default g_false_neg);
    function default_application_id  
        return eba_stds_test_validations.application_id%type deterministic;

    
end eba_stds_parser;
/