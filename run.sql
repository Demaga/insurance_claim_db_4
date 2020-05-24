-- outputs 1 if there is record with given policy_number (passed as parameter)
-- outputs 0 if there is no such record
DECLARE
    c integer;
BEGIN 
   c := customer_policy.DoesPolicyExist(1001); 
   dbms_output.put_line(c); 
   c := customer_policy.DoesPolicyExist(20002); 
   dbms_output.put_line(c); 
END; 


-- outputs all policy numbers (run to check if function above works correctly)
SELECT
    policy_number
    FROM policy;


-------------------------------------------------------------------------------------------


BEGIN 
-- changes umbrella limit of record with policy number = 1001
   customer_policy.ChangePolicyLimit(1001, 5000000);
   
-- DOESN'T change umbrella limit of record with policy number = 20002, because no such record exist (exception handling)
   customer_policy.ChangePolicyLimit(20002, 1000000);
END; 


-- outputs all existing policies with corresponding umbrella limits (run before and after PL/SQL block to check if procedure works correctly
SELECT
    policy_number, umbrella_limit 
    FROM policy;
    

-------------------------------------------------------------------------------------------

-- insures new Bob's car - Lexus (adds a record about car, adds record about customer if there weren't one already, add record about policy - car insured
BEGIN
    customer_policy.CustomerInsureCar(12341, 'Bob', '223444', 'Lexus', 'Very best', 2020);
END;

-- outputs all autos with their owners data and policy number (run this to check if procedure above works correctly)
SELECT customer.cust_id, customer.cust_name, auto.manufacturer, auto.model, auto.year, policy.policy_number FROM auto 
JOIN customer ON auto.cust_id = customer.cust_id
JOIN policy ON auto.license_plate = policy.license_plate;