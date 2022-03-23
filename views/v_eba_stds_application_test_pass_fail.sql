create or replace force view v_eba_stds_application_test_pass_fail as
select 
    nf.id standard_id,
    na.id application_id,
    na.apex_app_id,
    na.apex_app_id||'. '||aa.application_name application_name,
    nt.name application_type,
    aa.last_updated_on,
    sss.test_id,
    sst.name test_name,
    case when stv.false_positive_yn = 'Y' or stv.legacy_yn = 'Y'
         then 100
         else sss.pass_fail_pct
         end as pass_fail_pct,
    stv.false_positive_yn,
    stv.legacy_yn
from eba_stds_standards nf
    inner join eba_stds_standard_type_ref nftr on nf.id = nftr.standard_id
    inner join eba_stds_applications na on nftr.type_id = na.type_id
    inner join apex_applications aa on aa.application_id = na.apex_app_id
    inner join eba_stds_standard_statuses sss on sss.standard_id = nf.id
                                              and sss.application_id = na.id
    inner join eba_stds_standard_tests sst on sss.test_id  = sst.id
    left  join eba_stds_types nt on nt.id = na.type_id
    left  join eba_stds_test_validations stv on stv.test_id = sss.test_id
                                             and stv.application_id = na.apex_app_id 
order by na.apex_app_id
/