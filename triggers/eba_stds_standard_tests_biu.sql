create or replace trigger eba_stds_standard_tests_biu
    before insert or update on eba_stds_standard_tests
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
end;
/
alter trigger eba_stds_standard_tests_biu enable;