create or replace trigger eba_stds_tz_pref_biu
    before insert or update on eba_stds_tz_pref
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    if :new.timezone_preference is null then
        :new.timezone_preference := 'UTC';
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    :new.username   := upper(:new.username);
end;
/
alter trigger eba_stds_tz_pref_biu enable;

