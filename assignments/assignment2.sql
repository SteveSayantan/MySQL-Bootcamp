-- @block
CREATE TABLE customer (
    cust_id VARCHAR(3),
    cust_fname VARCHAR(20),
    cust_lname VARCHAR(20),
    territory VARCHAR(15),
    cred_lmt INT UNSIGNED,
    marital_status VARCHAR(8),
    sex CHAR(1),
    income INT UNSIGNED,
    mngr_id VARCHAR(3)
);

-- @block
DESCRIBE CUSTOMER;

-- @block
SELECT * FROM customer;

-- @block
INSERT INTO customer VALUES ("C54","Leila","Todd","South Africa",1691,"single","M",15188,"M2");

-- @block
INSERT INTO customer VALUES ("C31","Myles","Blankenship","Italy",4250,"single","F",9388,"M4"),

("C37","Garrett","Haney","France",4119,"married","F",5835,"M2"),

("C87","Jillian","Avila","Philippines",3078,"married","F",1509,"M1"),

("C52","Madonna","Padilla","India",3552,"single","M",20039,"M5"),

("C22","Slade","Hooper","Netherlands",4573,"single","M",6049,"M3");

-- @block
INSERT INTO customer VALUES ("C88","Diana","Chan","Vietnam",4125,"married","F",6698,"M3"),

("C55","Dante","Cohen","Spain",2104,"married","M",4470,"M1"),

("C41","Nero","Pacheco","Spain",1467,"single","M",18444,"M2"),

("C47","Rogan","Wong","America",4069,"single","F",11502,"M3"),

("C39","Chase","Baxter","Colombia",4153,"married","F",14250,"M4");

-- @block
ALTER TABLE customer ADD stay_from_year YEAR;

-- @block
UPDATE customer SET stay_from_year=2001 WHERE territory IN ('Italy','America');
UPDATE customer SET stay_from_year=2003 WHERE territory NOT IN ('Italy','America');

-- @block
UPDATE customer SET cred_lmt=7000 WHERE territory = 'INDIA' AND marital_status='single';

-- @block 
ALTER TABLE customer RENAME COLUMN cust_fname to first_name;
ALTER TABLE customer RENAME COLUMN cust_lname to last_name;

-- @block
CREATE TABLE cust1 AS SELECT * FROM customer;

-- @block
CREATE TABLE cust2 AS SELECT * FROM customer WHERE 1=0; -- “where 1=0” is not found in customers. Hence only the table structure of customers without the data

-- @block
CREATE TABLE cust3 AS SELECT cust_id,first_name AS cust_fname,last_name AS cust_lname,income FROM customer ORDER BY first_name LIMIT 5;

-- @block
ALTER TABLE cust1 DROP income;

-- @block
RENAME TABLE cust1 TO cust_one;

-- @block
INSERT INTO cust2 SELECT * FROM customer;

-- @block
INSERT INTO cust3 SELECT cust_id,first_name,last_name,income FROM customer WHERE income>10000;


-- @block
ALTER TABLE cust3 MODIFY COLUMN cust_id VARCHAR(4);

-- @block
SELECT * from cust3;
DESCRIBE cust3;

-- @block
DROP TABLE cust1;

