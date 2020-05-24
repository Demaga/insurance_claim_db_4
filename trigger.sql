CREATE OR REPLACE TRIGGER AutoInsurance
AFTER INSERT
ON
    auto
FOR EACH ROW
DECLARE
    policy_n integer;
    license varchar(50);
BEGIN
    SELECT MAX(policy.policy_number)
        INTO policy_n
        FROM policy;
        
    license := :new.license_plate;
    
    INSERT INTO policy(policy_number, license_plate, annual_premium, umbrella_limit)
        VALUES(policy_n + 1, license, (null), (null));
        
END;