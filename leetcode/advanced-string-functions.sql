-- @block
-- Fix Names in a Table
-- https://leetcode.com/problems/fix-names-in-a-table

SELECT user_id, CONCAT(UCASE(LEFT(name, 1)),LOWER(SUBSTRING(name, 2))) AS name FROM Users ORDER BY user_id;

-- @block
-- Patients With a Condition
-- https://leetcode.com/problems/patients-with-a-condition

SELECT * FROM PATIENTS WHERE
CONDITIONS LIKE '% DIAB1%' OR -- the space after wildcard '%' matches the ' DIAB1' sub-string that occurs in the 'ACNE DIAB100' and does not match a string like 'SADIAB100'
CONDITIONS LIKE 'DIAB1%';

-- @block
-- Delete duplicate email
-- https://leetcode.com/problems/delete-duplicate-emails

-- Remember: You cannot delete from a table and select from the same table in a subquery. Hence, using subquery won't work
DELETE B FROM Person A INNER JOIN Person B ON A.id<B.id AND A.email=B.email -- we delete all the matching rows from the table B i.e. the Person table itself


-- @block
-- Users with valid emails
-- https://leetcode.com/problems/find-users-with-valid-e-mails/

-- [[:alnum:]_.-] is equivalent to [a-zA-Z0-9_.-]
SELECT user_id, name, mail FROM Users WHERE REGEXP_LIKE (mail,'^[:alpha:][[:alnum:]_.-]*@leetcode\\.com$') -- . is a special character in regular expression, hence it needs to be skipped

-- @block
-- https://leetcode.com/problems/employees-whose-manager-left-the-company

SELECT A.employee_id FROM 
Employees A LEFT JOIN Employees B ON A.manager_id = B.employee_id 
WHERE A.manager_id IS NOT NULL AND A.salary<30000 AND B.employee_id IS NULL 
ORDER BY A.employee_id

-- @block
-- https://leetcode.com/problems/group-sold-products-by-the-date/

-- Details about GROUP_CONCAT : https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html#function_group-concat

SELECT sell_date, COUNT(DISTINCT product) AS num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product) AS products -- This function returns a string result with the concatenated non-NULL values from a group, default separator is comma
FROM Activities 
GROUP BY sell_date ORDER BY sell_date;

