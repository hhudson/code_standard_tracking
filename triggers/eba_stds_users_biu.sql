create or replace trigger eba_stds_users_biu
    before insert or update on eba_stds_users
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := eba_stds.gen_id();
        end if;
        :new.created_by := nvl(v('APP_USER'), USER);
        :new.created    := localtimestamp;
        :new.row_version_number := 1;
        if :new.account_locked is null then
            :new.account_locked := 'N';    
        end if;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := nvl(v('APP_USER'), USER);
    :new.updated    := localtimestamp;
    -- Always store username as upper case
    :new.username := upper(:new.username);
end;
/
alter trigger eba_stds_users_biu enable;