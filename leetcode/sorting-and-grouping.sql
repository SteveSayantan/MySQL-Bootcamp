-- @block
-- Number of Unique Subjects Taught by Each Teacher
-- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt FROM Teacher
GROUP BY teacher_id;

-- @block
-- User Activity for the Past 30 Days I
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users FROM Activity
WHERE activity_date BETWEEN DATE('2019-07-27')-INTERVAL 29 DAY AND DATE('2019-07-27')
GROUP BY activity_date;

-- @block
-- Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/description

SELECT product_id, year as first_year, quantity,price FROM 
Sales 
WHERE (product_id,year) IN (SELECT product_id,MIN(year) FROM Sales GROUP BY product_id);

-- @block
-- Classes More Than 5 Students
-- https://leetcode.com/problems/classes-more-than-5-students/description/

SELECT class from Courses GROUP BY class HAVING COUNT(student)>=5;

-- @block
-- Find Followers Count
-- https://leetcode.com/problems/find-followers-count/description

SELECT user_id, COUNT(follower_id) AS followers_count FROM Followers GROUP BY user_id ORDER BY user_id;

-- @block
-- Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/description

SELECT MAX(num) AS num FROM MyNumbers WHERE num IN (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num)=1);

-- @block
-- Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/description

SELECT customer_id FROM Customer 
GROUP BY customer_id 
HAVING COUNT( DISTINCT product_key)=(SELECT COUNT(product_key) FROM product);