create or replace trigger eba_stds_app_statuses_biu
    before insert or update on eba_stds_app_statuses
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/
show errors

alter trigger eba_stds_app_statuses_biu enable;