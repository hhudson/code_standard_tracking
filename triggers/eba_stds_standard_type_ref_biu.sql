CREATE OR REPLACE EDITIONABLE TRIGGER  "EBA_STDS_STANDARD_TYPE_REF_BIU" 
    before insert or update on eba_stds_standard_type_ref
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
end;

/
ALTER TRIGGER  "EBA_STDS_STANDARD_TYPE_REF_BIU" ENABLE
/