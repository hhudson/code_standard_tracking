declare
    l_app_id number;
begin
    eba_stds_flex_fw.populate_page_map_table();
    -- Make sure we're starting with a clean slate.
    eba_stds_flex_fw.reset_flex_registry();
end;
/