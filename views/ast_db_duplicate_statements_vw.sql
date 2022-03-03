create or replace force view ast_db_duplicate_statements_vw as
select
case when sc.thecount = 1
     then 'Y'
     else 'N'
     end as pass_fail,
apex_string.format('%0:%1:%2', us.object_name, us.object_type, us.line) reference_code,
us.object_name, 
us.object_type,
us.line, 
us.text,
sc.thecount
from user_statements us
join (select sql_id, count(*) thecount
      from user_statements 
      where sql_id is not null 
      group by sql_id ) sc on sc.sql_id = us.sql_id
order by us.object_name, object_type, us.line 
;