create or replace force view v_ast_apex_html_escaping_cols as
select 
case when ic1.display_text_as = 'WITHOUT_MODIFICATION'
     then 'N'
     else 'Y'
     end as pass_fail,
apex_string.format('%0:%1', ic1.application_id, ic1.region_id) reference_code,
ic1.application_id, 
ic1.region_id, 
ic1.application_name,
ic1.page_id,
ic1.region_name, 
ic1.column_alias,
ic1.report_label,
'IR' report_type
from apex_application_page_ir_col ic1
inner join apex_applications aa on ic1.application_id = aa.application_id
                                and aa.availability_status != 'Unavailable'
union all
select 
case when ic2.escape_on_http_output ='Yes'
     then 'Y'
     else 'N'
     end as pass_fail, 
apex_string.format('%0:%1', ic2.application_id, ic2.region_id) reference_code,
ic2.region_id, 
ic2.application_id, 
ic2.application_name,
ic2.page_id,
ic2.region_name, 
ic2.name,
ic2.heading,
'IG' report_type
from apex_appl_page_ig_columns ic2
inner join apex_applications aa on ic2.application_id = aa.application_id
                                and aa.availability_status != 'Unavailable'
order by application_id, page_id, region_name, column_alias
;