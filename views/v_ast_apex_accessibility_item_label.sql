set define off

create or replace force view v_ast_apex_accessibility_item_label as
select 
case when (pi.label is null or pi.label = '&nbsp')
     and pi.display_as not in ('Hidden')
     then 'N'
     else 'Y'
     end pass_fail,
apex_string.format('%0:%1', pi.application_id, pi.item_id) reference_code,
pi.application_id,
pi.item_id,
pi.item_name,
pi.label,
pi.page_id,
pi.page_name,
pi.display_as
from apex_application_page_items pi
order by pi.application_id, pi.page_id, pi.item_name
;