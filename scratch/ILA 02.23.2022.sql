begin
 --EXEC DBMS_DDL.alter_compile('PACKAGE', 'MY_SCHEMA', 'MY_PACKAGE');
 dbms_utility.compile_schema(schema => user, compile_all => true);
end;
/
select * 
from user_identifiers
where type in ('VARIABLE')
and name = 'G_AND_ANOTHER_ONE'
/
select * 
from ast_unusued_identifiers
where pass_fail = 'N'
/
with declared_ids  
        AS (select object_name  
                 , object_type  
                 , name
                 , type
                 , signature
              from user_identifiers  
             where     usage = 'DECLARATION'),  
     used_ids
        as (select object_name  
                 , object_type  
                 , name
                 , type
                 , signature
              from user_identifiers with_rh  
             where     usage = 'REFERENCE')  
select 
case when ui.name is not null
     then 'Y'
     else 'N'
     end as pass_fail,
    di.object_name, di.object_type, di.name
  from declared_ids di
  left join used_ids ui on  di.signature = ui.signature
/
REM   Script: PL/Scope Helper Package
REM   PL/Scope is a powerful code analysis tool built into the PL/SQL compiler. This package helps you get started with PL/Scope. When you download and use in your own environment, you may want to replace USER_IDENTIFIERS with ALL_IDENTIFIERS, so that you can analyze code across schemas (but only code on which you have EXECUTE privileges, of course!).

-- Create the Package Specification







set serveroutput on
-- Example of Applying PLScope_Helper Package
-- Note the ALTER SESSION to turn on the PL/Scope feature!
BEGIN 
   plscope_helper.show_identifiers_in (USER 
                                     ,  'GREAT_PACKAGE'); 
 
   plscope_helper.all_changes_to (USER 
                                ,  'GREAT_PACKAGE' 
                                ,  'V_SALARY'); 
 
   plscope_helper.should_start_with ( 
      USER 
    ,  'GREAT_PACKAGE' 
    ,  q'['FORMAL IN', 'FORMAL IN OUT', 'FORMAL OUT']' 
    ,  'p_'); 
 
   plscope_helper.should_end_with (USER 
                                 ,  'GREAT_PACKAGE' 
                                 ,  q'['FORMAL IN OUT']' 
                                 ,  '_io'); 
 
   plscope_helper.exposed_package_data_in ( 
      USER 
    ,  'GREAT_PACKAGE'); 
END; 
/

/
select * 
from ast_duplicate_statements
/
select sql_id, text, count (*) 
    from user_statements 
   where sql_id is not null 
group by sql_id, text 
  having count (*) > 1  
;
/
WITH subprograms_with_exception  
        AS (SELECT object_name  
                 , object_type  
                 , name  
              FROM user_identifiers has_exc  
             WHERE     has_exc.usage = 'DECLARATION'  
                   AND has_exc.TYPE = 'EXCEPTION'),  
     subprograms_with_raise_handle  
        AS (SELECT object_name  
                 , object_type  
                 , name  
              FROM user_identifiers with_rh  
             WHERE     with_rh.usage = 'REFERENCE'  
                   AND with_rh.TYPE = 'EXCEPTION')  
SELECT 
case when swrh.name is not null
     then 'Y'
     else 'N'
     end as pass_fail,
    swe.object_name, swe.object_type, swe.name
  FROM subprograms_with_exception swe
  left join subprograms_with_raise_handle swrh on swe.object_name = swrh.object_name
                                               and swe.object_type = swrh.object_type
                                               and swe.name = swrh.name
/
union  
SELECT *  
  FROM subprograms_with_raise_handle 
/

/
select * 
from (
select
case when ui.type = 'CONSTANT' and (ui.name like 'G_%' or ui.name like 'K_%')
            then 'Y'
            when ui.type = 'VARIABLE' and ui.name like 'L_%'
            then 'Y'
            when ui.type = 'FORMAL IN' and ui.name like 'P_%'
            then 'Y'
            when ui.type = 'FORMAL OUT' and ui.name like 'X_%'
            then 'Y'
            when ui.type = 'TRIGGER' and (ui.name like '%_BIU' or ui.name like '%_BI' or ui.name like '%_BU') 
            then 'Y'
            when ui.type = 'SEQUENCE' and ui.name like '%_SEQ'
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
and ui.type  not in ('PROCEDURE', 'PACKAGE', 'TABLE', 'COLUMN', 'FUNCTION', 'ITERATOR', 'SYNONYM') --this view doesn't look for naming conventions issues with these types
and ui.name not in ('GC_SCOPE_PREFIX') --exception permitted for logger convention
and ui.usage = 'DECLARATION'
and ui.object_name not like 'AOP%' -- AOP packages have a different convention
and ui.object_name not like 'EBA%' -- AOP packages have a different convention
and ui.object_name not like 'BIN$%' --this is junk
and ui.object_name not like 'UC_%' --United Codes has a different convention
order by ui.object_name, ui.object_type, ui.name, ui.type, ui.line
)
where pass_fail = 'N';
/

drop trigger 'BIN$yFfdFeMnEQvgU5cUAArp3Q==$0'
/
from user_statements
/
alter package ait_debug compile package;
/
begin
 --EXEC DBMS_DDL.alter_compile('PACKAGE', 'MY_SCHEMA', 'MY_PACKAGE');
 dbms_utility.compile_schema(schema => user, compile_all => true);
end;
/
alter session set current_schema = ILA
/
SELECT object_name, object_type, line --, count(*)
FROM user_statements
/
having count(*) > 1
group by object_name, object_type, line;
/
select name, type, text, trim(lower(text)) blb, line
from all_source
where owner = 'ILA'
and text != lower(text)
and trim(lower(text)) in (':new.created_by := coalesce(sys_context(''apex$session'',''app_user''),user);')
order by name, type, line
/
drop package dropme
/
select id, text, scope, extra
from logger_logs
where id > 767067
order by id desc
/
select * 
from all_objects
where object_name like 'EBA%'
and 
/
select * 
from ila.eba_stds_standard_tests
/
select *
from all_tables
where table_name = 'eba_stds_standard_tests' collate binary_ci
/
select aai.*, case when aai.inline_help_text is null
            and  aai.item_help_text is null
            and  aai.display_as not in ('Hidden')
            then 'N'
            else 'Y'
            end as pass_fail, 
            aai.page_id, 
            aai.item_name, 
            aai.inline_help_text, 
            aai.item_help_text
from
apex_application_page_items aai
where aai.application_id = :APP_ID
--and (aai.inline_help_text is null and aai.item_help_text is null)
--and (aai.inline_help_text is not null or aai.item_help_text is not null)
--and display_as not in ('Text Field', 
/
select case when aap.help_text is null
            then 'N'
            else 'Y'
            end as pass_fail,
        aap.page_id, 
        aap.page_name,
        aap.help_text
from apex_application_pages aap
where aap.application_id = :APP_ID
--AND help_text is null
/
select case when aap.page_requires_authentication = 'Yes'
            and aap.authorization_scheme is null
            then 'N'
        else 'Y'
        end as pass_fail, 
        aap.page_id, 
        aap.page_name, 
        aap.page_access_protection, 
        aap.page_mode,
        aap.page_requires_authentication
from apex_application_pages aap
where application_id = :APP_ID
and page_requires_authentication = 'Yes'
--and page_access_protection = 'Unrestricted'
--and page_mode = 'Normal'
/
select case
        when pi.item_label_template_id is null then 'N'
        when not exists ( select null
                          from apex_application_temp_label tl
                          where pi.item_label_template_id = tl.label_template_id
                              and pi.application_id = tl.application_id ) then 'N'
        else 'Y'
    end as pass_fail,
    pi.item_id,
    pi.page_id||'. '||pi.page_name page,
    pi.region,
    pi.item_name,
    pi.label,
    pi.display_as item_type,
    pi.item_label_template
from apex_application_page_items pi
where pi.application_id = :APP_ID
    and pi.display_as_code not in
        ( 'NATIVE_DISPLAY_ONLY',
           'NATIVE_HIDDEN',
           'NATIVE_STOP_AND_START_HTML_TABLE' )
/
select case when upper(tl.theme_class) like '%WITH HELP%' then 'N'
        else 'Y'
    end as pass_fail,
    pi.item_id,
    pi.page_id||'. '||pi.page_name page,
    pi.region,
    pi.item_name,
    pi.label,
    pi.display_as item_type,
    pi.item_label_template,
    tl.theme_class
from apex_application_page_items pi,
    apex_application_temp_label tl
where pi.application_id = :APP_ID 
    and pi.display_as_code != 'NATIVE_HIDDEN'
    and pi.item_help_text is null
    and pi.item_label_template_id = tl.label_template_id
    and pi.application_id = tl.application_id
/
select * from apex_application_temp_label
where application_id  = :APP_ID