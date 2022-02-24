-- Example of Applying PLScope_Helper Package
-- Note the ALTER SESSION to turn on the PL/Scope feature!
ALTER SESSION SET plscope_settings='identifiers:all' ;

-- Example of Applying PLScope_Helper Package
-- Note the ALTER SESSION to turn on the PL/Scope feature!
CREATE OR REPLACE PACKAGE great_package 
IS 
   some_public_global_variable   NUMBER (10); 
   g_and_another_one             BOOLEAN; 
 
   PROCEDURE wonderful_program ( 
      input_param1_in   IN     NUMBER 
    ,  p_param2          IN OUT DATE); 
END great_package; 
/