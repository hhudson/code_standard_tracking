create or replace trigger eba_stds_types_biu
    before insert or update on eba_stds_types
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/
alter trigger eba_stds_types_biu enable;