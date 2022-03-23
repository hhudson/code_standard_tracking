/* this view is referenced in v_ast_db_plsql_all */
create or replace force view v_ast_db_plsql_1_commented_specs as
with proc_declrtns as (
    select line, name, object_name
    from user_identifiers
    where type  in ('PROCEDURE','FUNCTION')
    and object_type = 'PACKAGE'
    and usage  = 'DECLARATION'
    order by object_name, line, name)
select 
case when trim(us.text) = '------------------------------------------------------------------------------'
     then null
     else 'This procedure appears to be missing a comment or the comment is incorrectly formatted.'
     end as issue,   
pd.name proc_name,
pd.object_name,
us.type object_type,
pd.line,
us.text code,
'Verifying procedures have comments in package specs' check_type
from user_source us 
inner join proc_declrtns pd on  us.type = 'PACKAGE'
                            and us.name = pd.object_name
                            and us.line = (pd.line - 1)
where us.name not like 'BIN$%'
order by pd.object_name, pd.line;