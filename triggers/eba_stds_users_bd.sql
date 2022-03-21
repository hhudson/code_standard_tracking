create or replace trigger eba_stds_users_bd
    before delete on eba_stds_users
    for each row
declare
    pragma autonomous_transaction;
begin
    -- Disallow deletes to a user's own record unless last one.
    if v('APP_USER') = upper(:old.username) then
       for c1 in (
          select count(*) cnt
            from eba_stds_users
           where id != :old.id )
       loop
          if c1.cnt > 0 then
             raise_application_error(-20002, 'Delete disallowed, you cannot delete your own access control details.');
          end if;
       end loop;
    end if;    
end;
/
alter trigger eba_stds_users_bd enable;