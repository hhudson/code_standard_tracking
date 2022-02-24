set define off;

PROMPT CHANGE_ME data

declare
  type rec_data is varray(3) of varchar2(4000);
  type tab_data is table of rec_data index by pls_integer;
  l_data tab_data;
  l_row eba_stds_types%rowtype;
begin

  -- Column order:
  -- dummy_type
  -- 1: CHANGE_ME_code
  -- 2: CHANGE_ME_name
  -- 3: CHANGE_ME_seq

  -- Template
  l_data(l_data.count + 1) := rec_data('40', 'dummy', 'this a special application');


  for i in 1..l_data.count loop
    l_row.display_sequence := l_data(i)(1);
    l_row.name := l_data(i)(2);
    l_row.description := l_data(i)(3);

    merge into eba_stds_types dest
      using (
        select
          l_row.display_sequence display_sequence,
          l_row.name name,
          l_row.description description
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
          dest.display_sequence = l_row.display_sequence,
          dest.description = l_row.description
    when not matched then
      insert (
        display_sequence,
        name,
        description)
      values(
        l_row.display_sequence,
        l_row.name,
        l_row.description)
    ;
  end loop;

end;
/
