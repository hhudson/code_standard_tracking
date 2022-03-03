create or replace force view ast_apex_html_escaping_cols_vw as
select 
case when display_text_as = 'WITHOUT_MODIFICATION'
     then 'N'
     else 'Y'
     end as pass_fail,
region_id, 
application_id, 
application_name,
page_id,
region_name, 
column_alias,
report_label,
'IR' report_type
from apex_application_page_ir_col  
union all
select 
case when escape_on_http_output ='Yes'
     then 'Y'
     else 'N'
     end as pass_fail, 
region_id, 
application_id, 
application_name,
page_id,
region_name, 
name,
heading,
'IG' report_type
from apex_appl_page_ig_columns
order by application_id, page_id, region_name, column_alias
;