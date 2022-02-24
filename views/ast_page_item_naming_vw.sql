create or replace force view ast_page_item_naming_vw as
select case when item_name like 'P'||page_id||'_%'
            then 'Y'
            else 'N'
            end as pass_fail,
item_id, 
item_name, 
application_name, 
application_id, 
page_id, 
page_name, 
region
from apex_application_page_items
where page_id not like '%.%' --indicates a translated app 
order by  application_name, application_id, page_id, page_name, region, item_id
;