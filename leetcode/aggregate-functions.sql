-- @block

-- Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50

SELECT id,movie,description,rating FROM Cinema 
WHERE MOD(id,2)<>0 AND description<>'boring' 
ORDER BY rating DESC;

-- @block

-- Average Selling Price
-- https://leetcode.com/problems/average-selling-price/?envType=study-plan-v2&envId=top-sql-50

SELECT P.product_id, ROUND(IFNULL(SUM(P.price*U.units)/SUM(U.units),0),2) AS average_price FROM Prices P LEFT JOIN UnitsSold U 
ON (P.product_id = U.product_id AND U.purchase_date BETWEEN P.start_date AND P.end_date )
GROUP BY P.product_id;

-- @block
-- Project Employees 1
-- https://leetcode.com/problems/project-employees-i/description/

SELECT P.project_id, ROUND(IFNULL(AVG(E.experience_years),0),2) as average_years 
FROM Project P LEFT JOIN Employee E ON P.employee_id = E.employee_id 
GROUP BY P.project_id;

-- @block
-- Percentage of Users Attended a Contest
-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/

SELECT contest_id,ROUND(COUNT(user_id)/(SELECT COUNT(*) FROM Users)*100,2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC,contest_id;

-- @block
-- Queries Quality and Percentage
-- https://leetcode.com/problems/queries-quality-and-percentage/description/

SELECT query_name,ROUND(AVG(rating/position),2) AS quality, ROUND(AVG(rating<3)*100,2) AS poor_query_percentage 
FROM Queries
WHERE query_name IS NOT NULL 
GROUP BY query_name;

-- @block
-- Monthly Transactions I
-- https://leetcode.com/problems/monthly-transactions-i/description/

SELECT DATE_FORMAT(trans_date,'%Y-%m') as month,country, 
COUNT(id) AS trans_count,SUM(state='approved') AS approved_count,
SUM(amount) AS trans_total_amount, SUM(IF(state='approved',amount,0)) as approved_total_amount
FROM Transactions 
GROUP BY YEAR(trans_date),MONTH(trans_date),country;

-- @block
-- Immediate Food Delivery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/description

SELECT ROUND(AVG(customer_pref_delivery_date=order_date)*100,2) AS immediate_percentage FROM Delivery 
WHERE (customer_id,order_date) IN
(SELECT customer_id,MIN(order_date) FROM Delivery GROUP BY customer_id);

-- @block
-- Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/description

SELECT ROUND(COUNT(player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction  
FROM Activity 
WHERE (player_id,event_date-INTERVAL 1 DAY) IN
(SELECT player_id,MIN(event_date) FROM Activity GROUP BY player_id);
