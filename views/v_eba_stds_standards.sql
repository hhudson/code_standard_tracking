create or replace force view v_eba_stds_standards as
select std.id,
    std.name standard,
    count( distinct t.id ) tests,
    floor(avg(ss.pass_fail_pct)) completion_std
from eba_stds_standards std
left join eba_stds_standard_tests t on t.standard_id = std.id
left join eba_stds_standard_statuses ss on ss.standard_id = t.standard_id
                                        and ss.test_id    = t.id
group by std.id, std.name
order by 4 asc, upper(std.name) 
/