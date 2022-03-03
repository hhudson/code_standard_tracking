create or replace force view ast_db_deprecated_code_vw as
select 'N' pass_fail,
apex_string.format('%0:%1:%2', us.name, us.type, us.line) reference_code,
case when lower(text) like '%nvl%'
     then 'Replace with coalesce'
     when lower(text) like '%decode%'
     then 'Replace with CASE statement'
     else 'Deprecated'
     end as explanation,
us.type,
us.name, 
us.text, 
us.line
from user_source us
where  (lower(us.text) like '%nvl%')
    or (lower(us.text) like '%goto%')
    or (lower(us.text) like '%decode%')
order by type, name, text, line
;