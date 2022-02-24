select *
from all_tab_cols
where 1=1
--and column_name like '%ESCA%'
--AND TABLE_NAME LIKE '%IR%'
AND OWNER like 'APEX%'
ORDER BY TABLE_NAME, column_name; 
/
select case when item_name like 'P'||page_id||'_%'
            then 'Y'
            else 'N'
            end as pass_fail,
item_id, item_name, application_name, application_id, page_id, page_name, region
from apex_application_page_items
where page_id not like '%.%' --indicates a translated app
/
select * 
from ast_html_escaping_cols_vw
/
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
report_label
from apex_application_page_ir_col  
union all
select case when escape_on_http_output ='Yes'
            then 'Y'
            else 'N'
            end as pass_fail, 
region_id, 
application_id, 
application_name,
page_id,
region_name, 
name,
heading
from apex_appl_page_ig_columns
/
select * 
from APEX_APPLICATION_PAGE_REG_COLS
/
Select case when escape_on_http_output ='Yes'
            then 'Y'
            else 'N'
            end as pass_fail, 
region_id, 
page_id,
region_name, 
name,
heading
from APEX_APPL_PAGE_IG_COLUMNS ig
--where application_id = :APP_ID
/
select *
from all_tab_cols
where table_name like '%IG%'
and owner like 'APEX%'
/
begin
 --EXEC DBMS_DDL.alter_compile('PACKAGE', 'MY_SCHEMA', 'MY_PACKAGE');
 dbms_utility.compile_schema(schema => user, compile_all => true);
end;
/
select * 
from all_identifiers
where object_type = 'VIEW'
and owner NOT IN ('ILA', 'APEX_210100')
/
select 
case when authorization_scheme is null
     then 'Y'
     else 'N'
     end as pass_fail, 
application_id, 
application_name,
authorization_scheme
from apex_applications
/

select id, text, scope, extra, time_stamp, user_name
from logger_logs
where 1=1
and id > 767654
and time_stamp > trunc(sysdate)
order by id desc
/
select 
pass_fail,
reference_code,
object_name, 
object_type, 
name, 
type,
line
from ast_unusued_identifiers
/
select * 
from ast_unusued_identifiers
/
select object_name  
                 , object_type  
                 , name
                 , type
                 , signature
                 , line
                 , apex_string.format('%0:%1:%2', di.object_name, di.object_type, di.line) reference_code
              from user_identifiers di 
             where     usage = 'DECLARATION'
             and type in ('VARIABLE', 'EXCEPTION')
             and object_name not like 'AOP%'
             and object_name not like 'EBA%'
             and declared_owner = 'ILA'
             and  apex_string.format('%0:%1:%2', di.object_name, di.object_type, di.line) = 'AIT_DEBUG:PACKAGE BODY:17'
/
select signature, count(*) refcount
              from user_identifiers   
             where usage = 'REFERENCE'
             group by signature
             /
             and signature = '2F85620B7603D48EEC6A212C8A95C62B'
/
select * 
from eba_stds_types
/
select * 
from user_identifiers