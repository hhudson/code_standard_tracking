create or replace trigger eba_stds_history_biu
    before insert or update on eba_stds_history
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.action_date := localtimestamp;
        :new.action_by  := nvl(wwv_flow.g_user,user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := :new.row_version_number + 1;
    end if;
end;
/
alter trigger eba_stds_history_biu enable;