create or replace trigger eba_stds_notif_biu
    before insert or update on eba_stds_notifications
    for each row
begin
    if inserting and :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created_by := nvl(v('app_user'),user);
        :new.created    := localtimestamp;
        :new.row_version_number := 1;
    end if;
    if updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    if :new.notification_type is null then
        :new.notification_type := 'manual';
    end if;
    if :new.display_sequence is null then
        :new.display_sequence := 10;
    end if;
    :new.updated_by := nvl(v('app_user'),user);
    :new.updated    := localtimestamp;
end;
/
alter trigger eba_stds_notif_biu enable;