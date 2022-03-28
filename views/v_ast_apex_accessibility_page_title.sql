create or replace force view v_ast_apex_accessibility_page_title as
select 
case when ap.page_title is null
     then 'N'
     else 'Y'
     end as pass_fail,
apex_string.format('%0:%1', ap.application_id, ap.page_id) reference_code,
ap.application_id,
ap.page_id,
ap.page_name,
ap.application_name
from apex_application_pages ap
inner join apex_applications aa on ap.application_id = aa.application_id
                                and aa.availability_status != 'Unavailable'
where ap.page_id != 0
order by ap.application_id, ap.page_id
;
