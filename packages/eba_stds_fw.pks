create or replace package eba_stds_fw authid definer as
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