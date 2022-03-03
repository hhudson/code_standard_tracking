create or replace force view v_ast_db_plsql_identifier_naming as
with proc_start as (
    select ui.object_name, min(UI.line) start_line
        from user_identifiers ui
        where 1=1
        AND object_type = 'PACKAGE BODY'
        and type in ('FUNCTION', 'PROCEDURE')
        and usage in ('DEFINITION')
        group by ui.object_name)
select
case when ui.type = 'CONSTANT' 
        then case when ui.object_type = 'PACKAGE'
                  then case when (ui.name not like 'G_%' or ui.name not like 'GC_%') 
                            then 'Package spec constants must begin with g_ or gc_'
                            end
                  when ui.object_type = 'PACKAGE BODY' 
                    then case when ui.line < ps.start_line
                              then case when (ui.name not like 'G_%' or ui.name not like 'GC_%') 
                                        then 'Package body global constants must begin with g_ or gc_'
                                        end
                              when (ui.name not like 'C_%' or ui.name not like 'K_%')
                              then 'Package body local constants must begin with c_ or k_'
                              end
                 end
     when ui.type = 'VARIABLE'
     then case when ui.object_type = 'PACKAGE'
               then 'Variables in the package spec are forbidden'
               when ui.name not like 'L_%'
               then 'Local variables must begin with l_'
               end
     when ui.type in ('CURSOR','REFCURSOR') 
     then case when ui.name not like 'CUR_%'
               then 'Cursor names must begin with cur_'
               end 
     when ui.type in ('INDEX TABLE', 'NESTED TABLE', 'ASSOCIATIVE ARRAY') 
     then case when ui.name not like 'T_%'
               then 'Table types must begin with t_'
               end
     when ui.type in ('FORMAL IN','FORMAL OUT', 'FORMAL IN OUT') 
     then case when ui.name not like 'P_%'
               then 'Procedure parameters must begin with p_'
               end
     when ui.type = 'RECORD'
     then case when ui.name not like 'R_%'
               then 'Record types must begin with r_'
               end 
     when ui.type in ('BLOB DATATYPE','BOOLEAN DATATYPE','CHARACTER DATATYPE','CLOB DATATYPE','DATE DATATYPE','NUMBER DATATYPE', 'SUBTYPE','TIMESTAMP DATATYPE')
     then case when ui.name not like 'TY_%'
               then 'Datatypes must begin with ty_'
               end
     when ui.type = 'EXCEPTION'
     then case when ui.name not like 'E_%'
               then 'Exceptions must begin with e_'
               end
     end as issue,
ui.object_name, 
ui.name code, 
ui.type object_type, 
ui.line,
'Enforcing identifier naming conventions' check_type
from   user_identifiers ui
left join proc_start ps on  ui.object_name = ps.object_name
                        and ui.object_type = 'PACKAGE BODY'
where  ui.usage = 'DECLARATION'
order by ui.object_name, ui.object_type, ui.name, ui.type, ui.line  
;