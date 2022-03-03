create or replace package eba_stds_data is
    procedure load_initial_data;
    function is_initial_data_loaded return boolean;
    procedure load_sample_data;
    procedure remove_sample_data;
    function is_sample_data_loaded return boolean;
end eba_stds_data;
/