create or replace force view v_ast_apex_page_auth as
select 
case when aap.page_requires_authentication = 'Yes'
     and aap.authorization_scheme is null
     then 'N'
     else 'Y'
     end as pass_fail, 
apex_string.format('%0:%1', aap.application_id, aap.page_id) reference_code,
aap.application_id,
aap.page_id, 
aap.page_name, 
aap.page_access_protection, 
aap.page_mode,
aap.page_requires_authentication
from apex_application_pages aap
inner join apex_applications aa on aap.application_id = aa.application_id
                                and aa.availability_status != 'Unavailable'
order by aap.application_id, aap.page_id
;