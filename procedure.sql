CREATE OR REPLACE PROCEDURE ChangePolicyLimit(policy_n IN integer, new_limit IN integer)
IS
    counter integer;
    exception_flag exception;
BEGIN
    SELECT COUNT(policy_number) 
        INTO counter 
        FROM policy 
        WHERE policy_number = policy_n;
        
    IF counter = 0 then
        RAISE exception_flag;
        
    ELSE
        UPDATE policy 
        SET policy.umbrella_limit = new_limit
        WHERE policy.policy_number = policy_n;
    
    END IF;
    
    EXCEPTION WHEN exception_flag then
        dbms_output.put_line('Policy record doesnt exist.');
END;


BEGIN
    ChangePolicyLimit(policy_n=>10051, new_limit=>11000000);
END;

BEGIN
    ChangePolicyLimit(policy_n=>1001, new_limit=>3000000);
END;