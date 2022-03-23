create or replace trigger eba_stds_standard_app_ref_biu
    before insert or update on eba_stds_standard_app_ref
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;
/

alter trigger eba_stds_standard_app_ref_biu enable;
