create or replace force view v_ast_apex_page_help as
select 
case when aap.help_text is null
     then 'N'
     else 'Y'
     end as pass_fail,
apex_string.format('%0:%1', aap.application_id, aap.page_id) reference_code,
aap.application_id,
aap.page_id, 
aap.page_name,
aap.help_text
from apex_application_pages aap
where aap.page_id not in (0, 9999)
order by aap.application_id, aap.page_id  
;