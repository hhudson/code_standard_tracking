/* this view is referenced in v_ast_db_plsql_all */
create or replace force view v_ast_db_plsql_2_discouraged_code as
select
case when lower(us.text) like '%nvl%'
     then 'Replace with coalesce'
     when lower(us.text) like '%decode%'
     then 'Replace with CASE statement'
     when lower(us.text) like '% goto %'
     then 'GOTO is discouraged'
     end as issue,
us.type object_type,
us.name object_name, 
us.text code, 
us.line,
'Checking for Discouraged Code' check_type
from user_source us
where us.name not like 'BIN$%'
order by us.type, us.name, us.text, us.line
;