CREATE OR REPLACE PACKAGE BODY assert  
IS  
   PROCEDURE this_condition (  
      condition_in IN BOOLEAN  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
    , null_means_failure_in IN BOOLEAN DEFAULT TRUE  
   )  
   IS  
   BEGIN  
      IF NOT condition_in  
         OR (null_means_failure_in AND condition_in IS NULL)  
      THEN  
         IF display_call_stack_in  
         THEN  
            DBMS_OUTPUT.put_line ('ASSERTION VIOLATION! ' || msg_in);  
            DBMS_OUTPUT.put_line ('Path taken to assertion violation:');  
             
            /* Uncomment when you install in your own environment;  
               DBMS_UTILITY currently unavailable in LiveSQL  
              DBMS_OUTPUT.put_line (DBMS_UTILITY.format_call_stack); */ 
         END IF;  
  
         raise_application_error (-20000, 'ASSERTION VIOLATION! ' || msg_in);  
      END IF;  
   END;  
  
   PROCEDURE is_null (  
      val_in IN VARCHAR2  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   )  
   IS  
   BEGIN  
      this_condition (val_in IS NULL  
               , msg_in  
               , display_call_stack_in  
               , null_means_failure_in      => FALSE  
                );  
   END is_null;  
  
   PROCEDURE is_not_null (  
      val_in IN VARCHAR2  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   )  
   IS  
   BEGIN  
      this_condition (val_in IS NOT NULL, msg_in, display_call_stack_in);  
   END is_not_null;  
  
   PROCEDURE is_true (  
      condition_in IN BOOLEAN  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   )  
   IS  
   BEGIN  
      this_condition (condition_in, msg_in, display_call_stack_in);  
   END is_true;  
  
   PROCEDURE is_false (  
      condition_in IN BOOLEAN  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   )  
   IS  
   BEGIN  
      this_condition (NOT condition_in, msg_in, display_call_stack_in);  
   END is_false;  
  
   PROCEDURE is_in_range (  
      date_in IN DATE  
    , low_date_in IN DATE  
    , high_date_in IN DATE  
    , msg_in IN VARCHAR2  
    , display_call_stack_in IN BOOLEAN DEFAULT FALSE  
   )  
   IS  
   BEGIN  
      this_condition (TRUNC (date_in) BETWEEN TRUNC (low_date_in)  
                                     AND TRUNC (high_date_in)  
               , msg_in  
               , display_call_stack_in  
                );  
   END is_in_range;  
END assert; 
/