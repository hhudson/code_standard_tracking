create or replace force view ast_db_identifier_naming_vw as
select
case when ui.type = 'CONSTANT' and (ui.name like 'G_%' or ui.name like 'GC_%' or ui.name like 'C_%') 
     then 'Y'
     when ui.type = 'VARIABLE' and ui.name like 'L_%'
     then 'Y'
     when ui.type in ('CURSOR','REFCURSOR') and ui.name like 'CUR_%'
     then 'Y'
     when ui.type = 'LABEL' and ui.name like 'LP_%'
     then 'Y'
     when ui.type in ('INDEX TABLE', 'NESTED TABLE', 'ASSOCIATIVE ARRAY') and ui.name like 'T_%'
     then 'Y'
     when ui.type in ('FORMAL IN','FORMAL OUT', 'FORMAL IN OUT') and ui.name like 'P_%'
     then 'Y'
     when ui.type = 'RECORD' and ui.name like 'R_%'
     then 'Y'
     when ui.type in ('BLOB DATATYPE','BOOLEAN DATATYPE','CHARACTER DATATYPE','CLOB DATATYPE','DATE DATATYPE','NUMBER DATATYPE', 'SUBTYPE','TIMESTAMP DATATYPE') and ui.name like 'TY_%'
     then 'Y'
     when ui.type = 'RECORD' and ui.name like 'R_%'
     then 'Y'
     when ui.type = 'EXCEPTION' and ui.name like 'E_%'
     then 'Y'
     when ui.type in ('PROCEDURE', 'PACKAGE', 'TABLE', 'COLUMN', 'FUNCTION', 'ITERATOR', 'SYNONYM', 'TRIGGER', 'SEQUENCE', 'VIEW')
     then 'Y'
     else 'N'
     end as pass_fail,
apex_string.format('%0:%1:%2', ui.object_name, ui.type, ui.line) reference_code,
ui.object_name, 
ui.name, 
ui.type, 
ui.usage, 
ui.line
from   user_identifiers ui
where  ui.usage = 'DECLARATION'
order by ui.object_name, ui.object_type, ui.name, ui.type, ui.line  
;