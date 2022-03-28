set define off

create or replace force view v_ast_apex_valid_list_links as
with tapps as (
        select
        le.application_id, 
        le.application_name,
        le.list_name,
        le.list_id, 
        le.list_entry_parent_id,
        le.list_entry_id,
        le.display_sequence,
        le.entry_target, 
        substr(et.column_value, 5) target_app_id,
        le.entry_text
        from apex_application_list_entries le
        cross join table(apex_string.split(le.entry_target,':')) et 
        where et.column_value like 'f?p=%'
        and et.column_value not like 'f?p=&%'
        )
select
case when aa2.availability_status = 'Unavailable'
     then 'N'
     when aa2.availability_status is null 
     then 'N'
     else 'Y'
     end as pass_fail,
apex_string.format('%0:%1:%2', t.application_id, t.list_id, t.list_entry_id) reference_code,
t.application_id, 
t.entry_target, 
t.target_app_id, 
aa2.availability_status target_app_status, 
t.list_name,
t.list_id, 
t.list_entry_id,
t.entry_text
from tapps t
inner join apex_applications aa1 on t.application_id = aa1.application_id
                                 and aa1.availability_status != 'Unavailable'
left join apex_applications aa2 on t.target_app_id = aa2.application_id
;