CREATE OR REPLACE PROCEDURE CustomerInsureCar(customer_id IN integer,
                                              customer_name IN varchar,
                                              auto_license_plate IN varchar,
                                              auto_manufacturer IN varchar,
                                              auto_model IN varchar,
                                              auto_year in integer)
IS
    policy_n integer;
    cust_n integer;
    counter integer;
BEGIN
    SELECT COUNT(cust_id) 
        INTO counter 
        FROM customer 
        WHERE cust_id = customer_id;

    IF counter = 0 then
        SELECT MAX(cust_id)
            INTO cust_n
            FROM customer;
        
        INSERT INTO customer(cust_id, cust_name, age, sex, education_type)
        VALUES(cust_n + 1, customer_name, (null), (null), (null));    
        
        INSERT INTO auto(cust_id, license_plate, manufacturer, model, year)
        VALUES(cust_n + 1, auto_license_plate, auto_manufacturer, auto_model, auto_year);
    
    ELSE
        INSERT INTO auto(cust_id, license_plate, manufacturer, model, year)
        VALUES(customer_id, auto_license_plate, auto_manufacturer, auto_model, auto_year);
    
    END IF;    
    
    SELECT MAX(policy_number)
        INTO policy_n
        FROM policy;
    
    INSERT INTO policy(policy_number, license_plate, annual_premium, umbrella_limit)
    VALUES(policy_n + 1, auto_license_plate, 1000, 1000000);    
        
END;