create or replace force view ast_unusued_identifiers_vw as
  with declared_ids  
        AS (select object_name  
                 , object_type  
                 , name
                 , type
                 , signature
                 , line
              from user_identifiers  
             where     usage = 'DECLARATION'
             and type in ('VARIABLE', 'EXCEPTION')
             and object_name not like 'AOP%'
             and object_name not like 'EBA%'
             and declared_owner = 'ILA'),  
     used_count
        as (select signature, count(*) refcount
              from user_identifiers   
             where usage = 'REFERENCE'
             group by signature)  
select 
case when uc.signature is not null
     then 'Y'
     else 'N'
     end as pass_fail,
    apex_string.format('%0:%1:%2', di.object_name, di.object_type, di.line) reference_code,
    di.object_name, 
    di.object_type, 
    di.name, 
    di.type,
    di.line
  from declared_ids di
  left join used_count uc on  di.signature = uc.signature
  order by di.object_name, di.object_type, di.name, di.type
;