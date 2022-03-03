
create or replace force view ast_db_commented_specs_vw as
with proc_declrtns as (
    select line, name, object_name
    from user_identifiers
    where type  in ('PROCEDURE','FUNCTION')
    and object_type = 'PACKAGE'
    and usage  = 'DECLARATION'
    order by object_name, line, name)
select 
case when trim(us.text) = '------------------------------------------------------------------------------'
     then 'Y'
     else 'N'
     end as pass_fail,     
apex_string.format('%0:%1:%2', pd.object_name, us.type, pd.line) reference_code,
pd.name,
pd.object_name,
pd.line
from user_source us 
inner join proc_declrtns pd on  us.type = 'PACKAGE'
                            and us.name = pd.object_name
                            and us.line = (pd.line - 1)
order by pd.object_name, pd.line