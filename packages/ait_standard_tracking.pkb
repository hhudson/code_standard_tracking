create or replace package body ait_standard_tracking as

  gc_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';


  procedure plscope_demo_proc  
  is  
    e_bad_data   exception;  
    pragma exception_init (e_bad_data, -20900);  
    e_bad_data2  exception;  
  begin  
    raise e_bad_data2;  
  exception  
    when e_bad_data2  
    then  
        logger.log_error('Unhandled Exception', l_scope, , l_params); 
        raise;
  end plscope_demo_proc; 


end ait_standard_tracking;
/
