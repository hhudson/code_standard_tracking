set define off;

PROMPT eba_stds_standards data

declare
  type rec_data is varray(3) of varchar2(4000);
  type tab_data is table of rec_data index by pls_integer;
  l_data tab_data;
  l_row eba_stds_standards%rowtype;
begin

  -- Column order:
  -- eba_stds_standards
  -- 1: id
  -- 2: name
  -- 3: description

  -- Template
  l_data(l_data.count + 1) := rec_data(1, 'APEX General Standards', 'These are best practices that probably apply to any given APEX application.');
  l_data(l_data.count + 1) := rec_data(2, 'APEX Accessibility Standards', 'These are standards to maintain Accessibility.');
  l_data(l_data.count + 1) := rec_data(3, 'Supporting DB Object Standards', 'These tests run against the DB objects and therefore may be hard to associate with a given application. They can be associated with the "Application Standards Tracker" app.');
  l_data(l_data.count + 1) := rec_data(4, 'APEX Broken Functionality', 'These tests identify functionality that invalid.');


  for i in 1..l_data.count loop
    l_row.id := l_data(i)(1);
    l_row.name := l_data(i)(2);
    l_row.description := l_data(i)(3);

    merge into eba_stds_standards dest
      using (
        select
          l_row.id id
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
          dest.name = l_row.name,
          dest.description = l_row.description
    when not matched then
      insert (
        id,
        name,
        description)
      values(
        l_row.id,
        l_row.name,
        l_row.description)
    ;
  end loop;

end;
/
