create or replace force view ast_item_help_vw as
 select case when aai.inline_help_text is null
             and  aai.item_help_text is null
             and  aai.display_as not in ('Hidden')
             then 'N'
             else 'Y'
        end as pass_fail,  
        aai.item_id,
        aai.page_id,
        aai.item_name, 
        aai.inline_help_text, 
        aai.item_help_text,
        aai.application_id
from apex_application_page_items aai
order by aai.application_id, aai.page_id, aai.item_id 
;
    