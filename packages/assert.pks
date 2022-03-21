CREATE OR REPLACE PACKAGE assert  
/*  
   Assertion Package  
     Provides a set of procedures you can use to *assert*  
     that a required condition is met. If not, an   
     error is raised, stopping execution of the block.  
     
   Author: Steven Feuerstein, steven.feuerstein@oracle.com 
   Source: https://livesql.oracle.com/apex/livesql/file/content_CFLUGC2RAJKP3RAF5XYUMTXE8.html  
     
   Example:  
     
instead of this:  
  
PROCEDURE calc_totals (  
   dept_in   IN   INTEGER,  
   date_in   IN   DATE  
)  
IS   
   bad_date   EXCEPTION;  
BEGIN  
   IF dept_in IS NULL  
   THEN  
      RAISE_APPLICATION_ERROR (-20000, 'Department ID cannot be null.');  
   END IF;  
     
   IF date_in NOT BETWEEN ADD_MONTHS (SYSDATE, -60) AND SYSDATE  
   THEN  
      RAISE_APPLICATION_ERROR (-20000, 'Date is out of range.');  
   END IF; 
 
   -- Program logic  
END; 
     
Do this:  
     
PROCEDURE calc_totals (  
   dept_in   IN   INTEGER,  
   date_in   IN   DATE  
)  
IS   
   bad_date   EXCEPTION;  
 
   PROCEDURE validate_assumptions 
   IS 
   BEGIN 
      assert.is_null (dept_in, 'Department ID');  
     
      assert.is_in_range (  
         date_in,  
         ADD_MONTHS (SYSDATE, -60),  
         SYSDATE  
      );  
   END;   
BEGIN  
 
   validate_assumptions; 
 
   -- Everything's fine. Code in confidence...  
 
   -- Program logic  
END;    
     
*/     
IS  
   PROCEDURE this_condition (  
      condition_in IN BOOLEAN  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
    , null_means_failure_in IN BOOLEAN DEFAULT TRUE  
   );   
  
   PROCEDURE is_null (  
      val_in IN VARCHAR2  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   );  
  
   PROCEDURE is_not_null (  
      val_in IN VARCHAR2  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   );  
  
   PROCEDURE is_true (  
      condition_in IN BOOLEAN  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   );  
  
   PROCEDURE is_false (  
      condition_in IN BOOLEAN  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   );  
  
   PROCEDURE is_in_range (  
      date_in IN DATE  
    , low_date_in IN DATE  
    , high_date_in IN DATE  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   );  
END assert; 
/