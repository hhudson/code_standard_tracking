create or replace force view v_ast_apex_accessibility_theme as
select 
case when ts.is_accessible = 'Yes'
     then 'Y'
     else 'N'
     end as pass_fail,
ts.application_id reference_code,
ts.application_id,
ts.application_name,
ts.theme_number,
ts.name theme_name,
ts.is_accessible,
ts.workspace
from apex_application_theme_styles ts
inner join apex_applications aa on ts.application_id = aa.application_id
where ts.is_current = 'Yes'
order by ts.application_id
;