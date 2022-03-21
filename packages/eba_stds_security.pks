create or replace package eba_stds_security authid definer is
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