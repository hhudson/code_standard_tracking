set define off;

PROMPT eba_stds_types data

declare
  type rec_data is varray(3) of varchar2(4000);
  type tab_data is table of rec_data index by pls_integer;
  l_data tab_data;
  l_row eba_stds_types%rowtype;
begin

  -- Column order:
  -- 4_eba_stds_types
  -- 1: name
  -- 2: id
  -- 3: display_sequence

  -- Template
  l_data(l_data.count + 1) := rec_data('Default'               , '10', 1);
  l_data(l_data.count + 1) := rec_data('Information Technology', '20', 2);
  l_data(l_data.count + 1) := rec_data('Engineering'           , '30', 3);
  l_data(l_data.count + 1) := rec_data('Test Application'      , '40', 4);
  l_data(l_data.count + 1) := rec_data('Initial development'   , '50', 5);
  l_data(l_data.count + 1) := rec_data('Releasable'            , '60', 6);
  l_data(l_data.count + 1) := rec_data('Production'            , '70', 7);
  l_data(l_data.count + 1) := rec_data('DB Supporting Objects' , '80', 8);


  for i in 1..l_data.count loop
    l_row.name := l_data(i)(1);
    l_row.id := l_data(i)(2);
    l_row.display_sequence := l_data(i)(3);

    merge into eba_stds_types dest
      using (
        select
          l_row.name name
        from dual
      ) src
      on (1=1
        and dest.name = src.name
      )
    when matched then
      update
        set
          -- Don't update the value as it's probably a key/secure value
          -- Deletions are handled above
          dest.id = l_row.id,
          dest.display_sequence = l_row.display_sequence
    when not matched then
      insert (
        name,
        id,
        display_sequence)
      values(
        l_row.name,
        l_row.id,
        l_row.display_sequence)
    ;
  end loop;

end;
/
