-- Example of Applying PLScope_Helper Package
-- Note the ALTER SESSION to turn on the PL/Scope feature!
CREATE OR REPLACE PACKAGE BODY great_package 
IS 
   TYPE emprec IS RECORD 
   ( 
      l_name   VARCHAR2 (20) 
    ,  job      VARCHAR2 (20) 
   ); 
 
   g_emp      emprec; 
   global_1   POSITIVE; 
 
   PROCEDURE wonderful_program ( 
      input_param1_in   IN     NUMBER 
    ,  p_param2          IN OUT DATE) 
   IS 
      name       VARCHAR2 (100) := 'LUCAS'; 
      v_salary   NUMBER (10, 2); 
      b_job      VARCHAR2 (20); 
      hiredate   DATE; 
   BEGIN 
      GOTO all_done; 

      some_public_global_variable := 5;
      g_and_another_one := true;

      v_salary := 5432.12; 
      DBMS_OUTPUT.put_line ('My Name is ' || name); 
      DBMS_OUTPUT.put_line ('My Job is ' || b_job); 
      v_salary := v_salary * 2; 
      hiredate := SYSDATE - 1; 
 
     <<all_done>> 
      DBMS_OUTPUT.put_line ( 
         'I started this job on ' || hiredate); 
   END wonderful_program; 
END great_package; 
/