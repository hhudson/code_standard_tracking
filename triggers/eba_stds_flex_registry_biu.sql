create or replace trigger eba_stds_flex_registry_biu
    before insert or update on eba_stds_flex_registry
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := eba_stds.gen_id();
        end if;
        :new.row_version_number := 1;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created := localtimestamp;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    :new.updated := localtimestamp;
end eba_stds_flex_registry_biu;
/
show errors

alter trigger eba_stds_flex_registry_biu enable;