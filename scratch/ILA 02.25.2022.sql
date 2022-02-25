select id, text, scope, extra, time_stamp, user_name
from logger_logs
where 1=1
and id > 769531
and scope like 'eba_stds_parser%'
and time_stamp > trunc(sysdate)
order by id desc
/