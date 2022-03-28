create or replace force view v_ast_apex_app_auth as
select 
case when aa.authorization_scheme is null
    then 'N'
    else 'Y'
    end as pass_fail, 
aa.application_id reference_code, 
aa.application_id, 
aa.application_name,
aa.authorization_scheme
from apex_applications aa
where aa.availability_status != 'Unavailable'
order by  aa.application_id
;