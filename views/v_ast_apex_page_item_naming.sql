create or replace force view v_ast_apex_page_item_naming
 as
select 
case when pi.item_name like 'P'||pi.page_id||'_%'
     then 'Y'
     else 'N'
     end as pass_fail,
pi.item_id, 
pi.item_name, 
pi.application_name, 
pi.application_id, 
pi.page_id, 
pi.page_name, 
pi.region
from apex_application_page_items pi
where pi.page_id not like '%.%' --indicates a translated app 
order by  pi.application_name, pi.application_id, pi.page_id, pi.page_name, pi.region, pi.item_id
;