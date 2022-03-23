CREATE OR REPLACE EDITIONABLE TRIGGER  EBA_STDS_APPLICATIONS_BD
    before delete on eba_stds_applications
    for each row
begin
    eba_stds_fw.tag_sync(
        p_new_tags      => null,
        p_old_tags      => :old.tags,
        p_content_type  => 'APPLICATION',
        p_content_id    => :old.id );
end;
/
ALTER TRIGGER  EBA_STDS_APPLICATIONS_BD ENABLE
/
