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