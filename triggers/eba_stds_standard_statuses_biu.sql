create or replace trigger eba_stds_standard_statuses_biu
    before insert or update on eba_stds_standard_statuses
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    :new.updated := systimestamp;
end;
/
show errors

alter trigger eba_stds_standard_statuses_biu enable;