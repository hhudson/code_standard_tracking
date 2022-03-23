create or replace trigger eba_stds_flex_page_map_biu
    before insert or update on eba_stds_flex_page_map
    for each row
begin
    if inserting and :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if inserting then
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.created := localtimestamp;
    end if;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    :new.updated := localtimestamp;
end eba_stds_flex_page_map_biu;
/
show errors

alter trigger eba_stds_flex_page_map_biu enable;