create or replace trigger eba_stds_tags_biu
    before insert or update on eba_stds_tags
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(v('APP_USER'),USER);
    end if;

    :new.updated    := localtimestamp;
    :new.updated_by := nvl(v('APP_USER'),USER);
end;
/
alter trigger eba_stds_tags_biu enable
/