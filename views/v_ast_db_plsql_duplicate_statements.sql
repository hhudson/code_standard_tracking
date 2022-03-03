create or replace force view v_ast_db_plsql_duplicate_statements as
select
'This statement appears more than once.' issue,
us.object_name, 
us.object_type,
us.line, 
us.text code,
'Checking for duplicate statements' check_type
from user_statements us
inner join (select sql_id
            from user_statements 
            where sql_id is not null 
            having count(*) > 1
            group by sql_id ) sc on sc.sql_id = us.sql_id
order by us.object_name, object_type, us.line 
;