create or replace force view ast_apex_page_auth_vw as
select 
case when aap.page_requires_authentication = 'Yes'
     and aap.authorization_scheme is null
     then 'N'
     else 'Y'
     end as pass_fail, 
aap.page_id, 
aap.page_name, 
aap.page_access_protectåion, 
aap.page_mode,
aap.page_requires_authentication,
aap.application_id
from apex_application_pages aap
order by aap.application_id, aap.page_id
;