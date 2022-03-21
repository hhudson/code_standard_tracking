create or replace trigger eba_stds_applications_biu
    before insert or update on eba_stds_applications
    for each row
begin
    if :new.id is null then
        :new.id := eba_stds.gen_id();
    end if;
    if :new.row_key is null then
        declare
            l_next_seq_val number;
        begin
           select eba_stds_seq.nextval into l_next_seq_val from dual;
           :new.row_key := eba_stds_fw.compress_int(l_next_seq_val);
        end;
    end if;
    if :new.tags is not null then
        :new.tags := eba_stds_fw.tags_cleaner( :new.tags );
    end if;
    if inserting then
        :new.created    := localtimestamp;
        :new.created_by := nvl(wwv_flow.g_user,user);
        :new.row_version_number := 1;
    elsif updating then
        :new.row_version_number := nvl(:old.row_version_number,1) + 1;
    end if;
    :new.updated    := localtimestamp;
    :new.updated_by := nvl(wwv_flow.g_user,user);
    eba_stds_fw.tag_sync(
        p_new_tags      => :new.tags,
        p_old_tags      => :old.tags,
        p_content_type  => 'APPLICATION',
        p_content_id    => :new.id );
end;
/
show errors

alter trigger eba_stds_applications_biu enable;