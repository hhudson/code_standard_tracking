set define off;

PROMPT eba_stds_access_levels data
PRO . eba_stds_access_levels data
/* Packaged App Tracker access levels */

declare
  type rec_data is varray(3) of varchar2(4000);
  type tab_data is table of rec_data index by pls_integer;
  l_data tab_data;
  l_row eba_stds_access_levels%rowtype;
begin

  -- Column order:
  -- eba_stds_access_levels
  -- 1: id
  -- 2: access_level

  -- Template
  l_data(l_data.count + 1) := rec_data('1', 'Reader');
  l_data(l_data.count + 1) := rec_data('2', 'Contributor');
  l_data(l_data.count + 1) := rec_data('3', 'Administrator');


  for i in 1..l_data.count loop
    l_row.id := l_data(i)(1);
    l_row.access_level := l_data(i)(2);

    merge into eba_stds_access_levels dest
      using (
        select
          l_row.id id,
          l_row.access_level access_level
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
          dest.access_level = l_row.access_level
    when not matched then
      insert (
        id,
        access_level)
      values(
        l_row.id,
        l_row.access_level)
    ;
  end loop;

end;
/
