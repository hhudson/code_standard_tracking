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