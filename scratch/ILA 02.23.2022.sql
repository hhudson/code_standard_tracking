select id, text, scope, extra
from logger_logs
where id > 767067
order by id desc
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