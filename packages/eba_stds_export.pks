create or replace package eba_stds_export as

    procedure export( p_standard_id in number default null, p_test_id in number default null );

end eba_stds_export;
/