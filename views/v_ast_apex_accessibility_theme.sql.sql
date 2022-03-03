create or replace force view v_ast_apex_accessibility_theme as
select 
case when ts.is_accessible = 'Yes'
     then 'Y'
     else 'N'
     end as pass_fail,
ts.application_id,
ts.application_name,
ts.theme_number,
ts.name theme_name,
ts.is_accessible
from apex_application_theme_styles ts
where ts.is_current = 'Yes'
order by ts.application_id
;