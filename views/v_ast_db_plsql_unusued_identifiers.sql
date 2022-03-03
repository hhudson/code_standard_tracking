create or replace force view v_ast_db_plsql_unusued_identifiers as
with  declared_ids  
            as (select object_name  
                  , object_type  
                  , name
                  , type
                  , signature
                  , line
                  from user_identifiers  
                  where     usage = 'DECLARATION'
                  and type in ('VARIABLE', 'EXCEPTION')),  
      used_count
            as (select signature, count(*) refcount
                  from user_identifiers   
                  where usage = 'REFERENCE'
                  group by signature)  
select 
case when uc.signature is not null
     then 'This identifier has been declared but is not referenced anywhere. Please delete.'
     end as issue,
di.object_name, 
di.object_type, 
di.name code, 
di.type,
di.line,
'Checking for unused identifiers' check_type
from declared_ids di
left join used_count uc on  di.signature = uc.signature
order by di.object_name, di.object_type, di.name, di.type
;