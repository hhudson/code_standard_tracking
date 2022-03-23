/* this view is referenced in v_ast_db_plsql_all */
create or replace force view v_ast_db_plsql_2_deprecated_code as
select
case when lower(us.text) like '%nvl%'
     then 'Replace with coalesce'
     when lower(us.text) like '%decode%'
     then 'Replace with CASE statement'
     when lower(us.text) like '% goto %'
     then 'GOTO is deprecated'
     end as issue,
us.type object_type,
us.name object_name, 
us.text code, 
us.line,
'Checking for Deprecated Code' check_type
from user_source us
order by us.type, us.name, us.text, us.line
;