create or replace force view v_ast_apex_page_help as
select 
case when aap.help_text is null
     then 'N'
     else 'Y'
     end as pass_fail,
aap.page_id, 
aap.page_name,
aap.help_text,
aap.application_id
from apex_application_pages aap
order by aap.application_id, aap.page_id  
;