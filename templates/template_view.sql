create or replace force view CHANGEME as
select 
'Y' pass_fail,
apex_string.format('%0', aa.application_id) reference_code,
aa.application_id
from  apex_applications aa 
where aa.availability_status != 'Unavailable'
order by aa.application_id
;

/* No need to :
 * - add application_name
 * - add application status
 * - add application type
 * - join on eba_stds_applications
 */