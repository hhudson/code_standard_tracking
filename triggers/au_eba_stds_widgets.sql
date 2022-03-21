-- the following script is in the supporting object repository but i can't find the eba_stds_widgets table script
/*create or replace trigger au_eba_stds_widgets
    after update on eba_stds_widgets
    for each row
declare
    ov varchar2(4000) := null;
    nv varchar2(4000) := null;
begin
    -- TAGS (default)
    if nvl(:old.tags, '0') != nvl(:new.tags,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'TAGS', substr(:old.tags,0,4000), substr(:new.tags,0,4000) ); 
    end if;
    -- WIDGET_NAME (default)
    if nvl(:old.widget_name, '0') != nvl(:new.widget_name,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'WIDGET_NAME', substr(:old.widget_name,0,4000), substr(:new.widget_name,0,4000) ); 
    end if;
    -- WIDGET_OWNER (default)
    if nvl(:old.widget_owner, '0') != nvl(:new.widget_owner,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'WIDGET_OWNER', substr(:old.widget_owner,0,4000), substr(:new.widget_owner,0,4000) ); 
    end if;
    -- CONTRIBUTOR_1 (default)
    if nvl(:old.contributor_1, '0') != nvl(:new.contributor_1,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_1', substr(:old.contributor_1,0,4000), substr(:new.contributor_1,0,4000) ); 
    end if;
    -- CONTRIBUTOR_2 (default)
    if nvl(:old.contributor_2, '0') != nvl(:new.contributor_2,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_2', substr(:old.contributor_2,0,4000), substr(:new.contributor_2,0,4000) ); 
    end if;
    -- CONTRIBUTOR_3 (default)
    if nvl(:old.contributor_3, '0') != nvl(:new.contributor_3,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_3', substr(:old.contributor_3,0,4000), substr(:new.contributor_3,0,4000) ); 
    end if;
    -- CONTRIBUTOR_4 (default)
    if nvl(:old.contributor_4, '0') != nvl(:new.contributor_4,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'CONTRIBUTOR_4', substr(:old.contributor_4,0,4000), substr(:new.contributor_4,0,4000) ); 
    end if;
    -- WIDGET_DESCRIPTION (default)
    if nvl(:old.widget_description, '0') != nvl(:new.widget_description,'0') then 
        insert into eba_stds_history (table_name, component_rowkey, component_id, column_name, old_value, new_value) values 
            ('WIDGETS', :new.row_key, :new.id, 'WIDGET_DESCRIPTION', substr(:old.widget_description,0,4000), substr(:new.widget_description,0,4000) ); 
    end if;
end au_eba_stds_widgets;
/

alter trigger au_eba_stds_widgets enable
/
*/