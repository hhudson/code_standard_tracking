set define off;

PROMPT eba_stds_app_statuses data

declare
  type rec_data is varray(3) of varchar2(4000);
  type tab_data is table of rec_data index by pls_integer;
  l_data_as tab_data;
  l_row_as eba_stds_app_statuses%rowtype;
begin

  -- Column order:
  -- 8_load_eba_stds_app_statuses
  -- 1: id
  -- 2: name
  -- 3: display_sequence

  -- Template
  l_data_as(l_data_as.count + 1) := rec_data(1, 'Test Application', 10);
  l_data_as(l_data_as.count + 1) := rec_data(2, 'Initial Development', 20);
  l_data_as(l_data_as.count + 1) := rec_data(3, 'Releasable', 30);
  l_data_as(l_data_as.count + 1) := rec_data(4, 'Production', 40);


  for i in 1..l_data_as.count loop
    l_row_as.id := l_data_as(i)(1);
    l_row_as.name := l_data_as(i)(2);
    l_row_as.display_sequence := l_data_as(i)(3);

    merge into eba_stds_app_statuses dest
      using (
        select
          l_row_as.id id
        from dual
      ) src
      on (1=1
        and dest.id = src.id
      )
    when matched then
      update
        set
          -- Don't update the value as it's probably a key/secure value
          -- Deletions are handled above
          dest.name = l_row_as.name,
          dest.display_sequence = l_row_as.display_sequence
    when not matched then
      insert (
        id,
        name,
        display_sequence)
      values(
        l_row_as.id,
        l_row_as.name,
        l_row_as.display_sequence)
    ;
  end loop;

end;
/
