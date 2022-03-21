set define off;

PROMPT eba_stds_error_lookup data

declare
  type rec_data is varray(3) of varchar2(4000);
  type tab_data is table of rec_data index by pls_integer;
  l_data tab_data;
  l_row eba_stds_error_lookup%rowtype;
begin

  -- Column order:
  -- 3_eba_stds_error_lookup.sql
  -- 1: constraint_name
  -- 2: message
  -- 3: language_code

  -- Template
  l_data(l_data.count + 1) := rec_data('eba_stds_users_uk', 'Username must be unique.', 'en');


  for i in 1..l_data.count loop
    l_row.constraint_name := l_data(i)(1);
    l_row.message := l_data(i)(2);
    l_row.language_code := l_data(i)(3);

    merge into eba_stds_error_lookup dest
      using (
        select
          l_row.constraint_name constraint_name
        from dual
      ) src
      on (1=1
        and dest.constraint_name = src.constraint_name
      )
    when matched then
      update
        set
          -- Don't update the value as it's probably a key/secure value
          -- Deletions are handled above
          dest.message = l_row.message,
          dest.language_code = l_row.language_code
    when not matched then
      insert (
        constraint_name,
        message,
        language_code)
      values(
        l_row.constraint_name,
        l_row.message,
        l_row.language_code)
    ;
  end loop;

end;
/
