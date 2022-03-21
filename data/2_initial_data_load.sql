begin
    eba_stds_data.load_initial_data();

   insert into eba_stds_applications( apex_app_id, type_id )
   select aa.application_id, 1 type_id
   from apex_applications aa, apex_workspaces wrk
   where not exists (
           select null
           from eba_stds_applications esa
           where esa.apex_app_id = aa.application_id )
       and aa.workspace = wrk.workspace
       and wrk.workspace_id = v('WORKSPACE_ID');
end;
/