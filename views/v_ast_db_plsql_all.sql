create or replace force view v_ast_db_plsql_all as
with deflt as (
   select eba_stds_parser.default_application_id() application_id
   from dual)
select 
case when a.issue is null 
     then 'Y'
     else 'N'
     end as pass_fail,
apex_string.format('%0:%1:%2:%3', deflt.application_id, a.object_name, a.object_type, a.line) reference_code,
deflt.application_id,
a.issue,
a.object_name, 
a.object_type, 
a.line,
a.code,
a.check_type
from
(select cs.issue, cs.object_name, cs.object_type, cs.line, cs.code, cs.check_type
    from v_ast_db_plsql_1_commented_specs cs
 union all
 select dc.issue, dc.object_name, dc.object_type, dc.line, dc.code, dc.check_type
    from v_ast_db_plsql_2_deprecated_code dc
 union all 
 select ds.issue, ds.object_name, ds.object_type, ds.line, ds.code, ds.check_type
    from v_ast_db_plsql_3_duplicate_statements ds
 union all 
 select inm.issue, inm.object_name, inm.object_type, inm.line, inm.code, inm.check_type
   from v_ast_db_plsql_4_identifier_naming inm
 union all 
 select ui.issue, ui.object_name, ui.object_type, ui.line, ui.code, ui.check_type
   from v_ast_db_plsql_5_unusued_identifiers ui 
) a
cross join deflt
where a.issue is not null
order by a.check_type, a.issue, a.object_name, a.line
;