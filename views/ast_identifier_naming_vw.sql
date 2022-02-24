create or replace force view ast_identifier_naming_vw as
select
case when ui.type = 'CONSTANT' and (ui.name like 'G_%' or ui.name like 'K_%')
            then 'Y'
            when ui.type = 'VARIABLE' and ui.name like 'L_%'
            then 'Y'
            when ui.type = 'FORMAL IN' and ui.name like 'P_%'
            then 'Y'
            when ui.type = 'FORMAL OUT' and ui.name like 'X_%'
            then 'Y'
            else 'N'
            end as pass_fail,
ui.object_name, 
ui.name, 
ui.type, 
ui.usage, 
ui.line
from   user_identifiers ui
where  1=1
and ui.type  not in ('PROCEDURE', 'PACKAGE', 'TABLE', 'COLUMN', 'FUNCTION', 'ITERATOR', 'SYNONYM', 'TRIGGER', 'SEQUENCE') --this view doesn't look for naming conventions issues with these types
and ui.name not in ('GC_SCOPE_PREFIX') -- exception permitted for logger convention
and ui.usage = 'DECLARATION'
and ui.object_name not like 'AOP%' -- AOP packages have a different convention
and ui.object_name not like 'EBA%' -- EBA packages have a different convention
and ui.object_name not like 'BIN$%' -- this is junk
and ui.object_name not like 'UC_%' -- United Codes has a different convention
order by ui.object_name, ui.object_type, ui.name, ui.type, ui.line  
;