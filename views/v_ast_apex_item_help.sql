create or replace force view v_ast_apex_item_help as
select 
case when aai.inline_help_text is null
     and  aai.item_help_text is null
     and  aai.display_as not in ('Hidden')
     then 'N'
     else 'Y'
     end as pass_fail, 
apex_string.format('%0:%1', aai.application_id, aai.item_id) reference_code,
aai.application_id,
aai.item_id,
aai.page_id,
aai.item_name, 
aai.inline_help_text, 
aai.item_help_text
from apex_application_page_items aai
inner join apex_applications aa on aai.application_id = aa.application_id
                                and aa.availability_status != 'Unavailable'
order by aai.application_id, aai.page_id, aai.item_id 
;
    