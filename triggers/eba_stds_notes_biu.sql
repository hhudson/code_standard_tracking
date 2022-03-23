create or replace trigger eba_stds_notes_biu
    before insert or update on eba_stds_notes
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
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;
/

alter trigger eba_stds_notes_biu enable;