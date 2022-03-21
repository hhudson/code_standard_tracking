create or replace package eba_stds is
    -------------------------------------------------------------------------
    -- Generates a unique Identifier
    -------------------------------------------------------------------------
    function gen_id return number;
    -------------------------------------------------------------------------
    -- Handle the process of registering the scheduled job.
    -------------------------------------------------------------------------
    procedure register_job;
end eba_stds;
/