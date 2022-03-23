create or replace trigger eba_stds_preferences_biu
before insert or update on eba_stds_preferences
    for each row
begin
    if inserting and :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created_by  := nvl(v('APP_USER'),USER);
        :new.created     := localtimestamp;
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := nvl(v('APP_USER'),USER);
    :new.updated    := localtimestamp;
    :new.preference_name := upper(:new.preference_name);
end;
/