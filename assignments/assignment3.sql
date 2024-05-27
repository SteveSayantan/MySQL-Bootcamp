-- @block
CREATE TABLE dept (
    dept_id DECIMAL(3) PRIMARY KEY,
    dept_name VARCHAR(15)
);

-- @block
INSERT INTO dept values(90,"Economics");
INSERT INTO dept values(69,"CSE");
INSERT INTO dept values(100,"ECE");
INSERT INTO dept values(110,"EEE");

-- @block
CREATE TABLE cust_100(
    emp_id DECIMAL(3) PRIMARY KEY,
    first_name VARCHAR(10), 
    last_name VARCHAR(10) NOT NULL,
    email  VARCHAR(20),
    ph_no VARCHAR(15),
    hire_date DATE CHECK (hire_date > '1980-01-01'),
    job_id VARCHAR(10) CHECK (job_id LIKE 'FI%' OR job_id LIKE 'AD%' OR job_id LIKE 'IT%' ),
    salary DECIMAL(8,2) CHECK (salary BETWEEN 4000 AND 25000),
    mgr_id DECIMAL(3),
    dept_id DECIMAL(3) REFERENCES dept(dept_id),

    CONSTRAINT initial_letter_captial CHECK (  -- ASCII function The character to return the ASCII value for. If more than one character is entered, it will only return the value for the first character
        (ASCII(first_name)>=65 AND ASCII(first_name)<=90)
        AND
        (ASCII(last_name)>=65 AND ASCII(last_name)<=90)
    )
);


-- @block
INSERT INTO cust_100 values( 449, 'Peter','Griffin','abc@xyz.com','7193406380','2023-04-13','FI98',4200,453,90);

-- @block
ALTER TABLE cust_100 DROP COLUMN mgr_id;

-- @block
ALTER TABLE cust_100 ADD mgr_id DECIMAL(3) REFERENCES cust_100(emp_id);

-- @block
UPDATE cust_100 SET mgr_id=449 WHERE emp_id=449;

