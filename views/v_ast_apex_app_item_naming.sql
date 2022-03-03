create or replace force view v_ast_apex_app_item_naming as
select 
case when item_name like 'G_%'
     then 'Y'
     else 'N'
     end as pass_fail,
application_item_id,
application_id, 
application_name, 
item_name, 
scope
from apex_application_items
order by application_id, item_name
;
