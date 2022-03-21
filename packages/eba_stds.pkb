create or replace package body eba_stds as
    -------------------------------------------------------------------------
    -- Generates a unique Identifier
    -------------------------------------------------------------------------
    function gen_id return number is
    begin
        return to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end gen_id;
    -------------------------------------------------------------------------
    -- Handle the process of registering the scheduled job.
    -------------------------------------------------------------------------
    procedure register_job is
        c_workspace_id constant number := apex_application.get_security_group_id();
        l_app_id number;
        l_stmt varchar2(1000);
    begin
        l_app_id := nvl(wwv_flow_application_install.get_application_id,v('FB_FLOW_ID'));
        l_stmt := q'[begin #PKG#.create_job( job_name => 'EBA_STDS_TEST_UPD_JOB', ]'
            ||q'[job_type => 'PLSQL_BLOCK', job_action => 'eba_stds_parser.update_standard_status;', ]'
            ||q'[repeat_interval => 'FREQ=DAILY;interval=1', enabled => TRUE); end;]';
        for c1 in ( select object_name
                    from sys.all_objects
                    where object_name in ('DBMS_SCHEDULER', 'CLOUD_SCHEDULER')
                        and object_type = 'PACKAGE'
                    order by object_name desc ) loop
            execute immediate replace(l_stmt, '#PKG#',
                sys.dbms_assert.enquote_name(c1.object_name, false));
            return;
        end loop;
    end register_job;
end eba_stds;
/