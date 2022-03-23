create or replace force view v_ast_apex_app_item_naming as
select 
case when ai.item_name like 'G_%'
     then 'Y'
     else 'N'
     end as pass_fail,
apex_string.format('%0:%1', ai.application_id, ai.application_item_id) reference_code,
ai.application_id, 
ai.application_item_id,
ai.application_name, 
ai.item_name, 
ai.scope
from apex_application_items ai
order by ai.application_id, ai.item_name
;
