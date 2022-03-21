create or replace trigger eba_stds_test_validations_biu
    before insert or update on eba_stds_test_validations
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
show errors

alter trigger eba_stds_test_validations_biu enable;