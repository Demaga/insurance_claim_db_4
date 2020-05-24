INSERT INTO
education_type(education_type)
VALUES
('PhD');
INSERT INTO
education_type(education_type)
VALUES
('MD');
INSERT INTO
education_type(education_type)
VALUES
('High School');

INSERT INTO
incident_type(incident_type)
VALUES
('Single Vehicle Collision');
INSERT INTO
incident_type(incident_type)
VALUES
('Multi-vehicle Collision');
INSERT INTO
incident_type(incident_type)
VALUES
('Vehicle Theft');

INSERT INTO
collision_type(collision_type)
VALUES
('Side Collision');
INSERT INTO
collision_type(collision_type)
VALUES
('Front Collision');
INSERT INTO
collision_type(collision_type)
VALUES
('Rear Collision');

INSERT INTO
customer(cust_id, cust_name, age, sex, education_type)
VALUES
(1,'John',123, 'Female', 'PhD');
INSERT INTO
customer(cust_id, cust_name, age, sex, education_type)
VALUES
(2, 'Jack', 23, 'Male', 'MD');
INSERT INTO
customer(cust_id, cust_name, age, sex, education_type)
VALUES
(3, 'Alice', 63, 'Female', 'High School');

INSERT INTO
auto(cust_id, license_plate, manufacturer, model, year)
VALUES
(1, 'ab2020ba', 'Lexus', 'IS', 2020);
INSERT INTO
auto(cust_id, license_plate, manufacturer, model, year)
VALUES
(1, 'ca1523pb', 'Mercedes', 'CSV', 2020);
INSERT INTO
auto(cust_id, license_plate, manufacturer, model, year)
VALUES
(3, 'kr1701vs', 'Ford', 'Endeavour', 2018);


INSERT INTO
incident(incident_id, incident_date, collision_type, incident_type)
VALUES
(1, TO_DATE('2012-07-18', 'YYYY-MM-DD'), 'Rear Collision', 'Single Vehicle Collision');
INSERT INTO
incident(incident_id, incident_date, collision_type, incident_type)
VALUES
(2, TO_DATE('2013-07-18', 'YYYY-MM-DD'), 'Side Collision', 'Single Vehicle Collision');
INSERT INTO
incident(incident_id, incident_date, collision_type, incident_type)
VALUES
(3, TO_DATE('2014-07-18', 'YYYY-MM-DD'), 'Front Collision', 'Multi-vehicle Collision');

INSERT INTO
policy(policy_number, license_plate, annual_premium, umbrella_limit)
VALUES
(1001, 'ab2020ba', 105.42, 1000000);
INSERT INTO
policy(policy_number, license_plate, annual_premium, umbrella_limit)
VALUES
(1002, 'kr1701vs', 1145.42, 2000000);
INSERT INTO
policy(policy_number, license_plate, annual_premium, umbrella_limit)
VALUES
(1003, 'ca1523pb', 5055.12, 3000500);

INSERT INTO
insurance_claim(incident_id, capital_gains, capital_loss, policy_number)
VALUES
(1, 42044, -41242, 1003);
INSERT INTO
insurance_claim(incident_id, capital_gains, capital_loss, policy_number)
VALUES
(2, 1514, -42, 1002);
INSERT INTO
insurance_claim(incident_id, capital_gains, capital_loss, policy_number)
VALUES
(3, 4344, -1242, 1001);