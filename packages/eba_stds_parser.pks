create or replace package eba_stds_parser as
    g_collection varchar2(255) := 'EBA_STDS_PARSER';
    function is_valid_query( p_query in clob ) return varchar2;
    procedure update_standard_status;
    function build_link( p_test_id in number, p_application_id in number, p_param in varchar2 )
        return varchar2;
end eba_stds_parser;
/