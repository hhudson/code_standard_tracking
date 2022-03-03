create or replace force view v_ast_apex_app_auth as
select 
case when authorization_scheme is null
    then 'N'
    else 'Y'
    end as pass_fail, 
application_id, 
application_name,
authorization_scheme
from apex_applications 
order by  application_id
;