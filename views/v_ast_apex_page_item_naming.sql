create or replace force view v_ast_apex_page_item_naming
 as
select 
case when pi.item_name like 'P'||pi.page_id||'_%'
     then 'Y'
     else 'N'
     end as pass_fail,
apex_string.format('%0:%1', pi.application_id, pi.item_id) reference_code,
pi.application_id, 
pi.item_id, 
pi.item_name, 
pi.application_name, 
pi.page_id, 
pi.page_name, 
pi.region
from apex_application_page_items pi
inner join apex_applications aa on pi.application_id = aa.application_id
                                and aa.availability_status != 'Unavailable'
where pi.page_id not like '%.%' --indicates a translated app 
order by  pi.application_name, pi.application_id, pi.page_id, pi.page_name, pi.region, pi.item_id
;