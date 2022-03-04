create or replace package eba_stds_parser as
    g_collection varchar2(255) := 'EBA_STDS_PARSER';
    function is_valid_query( p_query in clob ) return varchar2;
    procedure update_standard_status;
    function build_link( p_test_id in number, p_application_id in number, p_param in varchar2 )
        return varchar2;
    
    procedure assert_exception (
                p_result_identifier in eba_stds_test_validations.result_identifier%type,
                p_test_id           in eba_stds_test_validations.test_id%type,
                p_app_id            in eba_stds_test_validations.application_id%type
                );
end eba_stds_parser;
/