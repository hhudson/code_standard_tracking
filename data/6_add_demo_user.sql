begin
    eba_stds_fw.set_preference_value (
        p_preference_name  => 'ACCESS_CONTROL_ENABLED',
        p_preference_value => 'Y');
    eba_stds_fw.set_preference_value (
        p_preference_name  => 'ACCESS_CONTROL_SCOPE',
        p_preference_value => ('PUBLIC_CONTRIBUTE') 
        );

    -- Seed user table with current user as an administrator or set the current user as administrator
    declare
       l_count number;
    begin
        select count(*) 
            into l_count 
        from eba_stds_users
        where username = 'DEMO_USER';
        if l_count = 0 then
            insert into eba_stds_users(username, access_level_id) values ('DEMO_USER', 3);   
        else
            update eba_stds_users
            set access_level_id = 3
            where username = 'DEMO_USER';
        end if;
    end;
end;
/