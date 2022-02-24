create or replace force view ast_duplicate_statements_vw as
select object_name, 
       line, 
       text 
  from user_statements 
 where sql_id in (  select sql_id 
                      from user_statements 
                     where sql_id is not null 
                  group by sql_id 
                    having count (*) > 1) 
 order by object_name, line 
;