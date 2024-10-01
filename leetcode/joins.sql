-- @block

--Rising Temperature
-- https://leetcode.com/problems/rising-temperature/?envType=study-plan-v2&envId=top-sql-50

SELECT B.id
FROM Weather A INNER JOIN Weather B ON A.recordDate = B.recordDate - INTERVAL 1 DAY
WHERE B.temperature > A.temperature

-- @block
-- Average Time of Process per Machine
-- https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50

SELECT A.machine_id,ROUND(AVG(A.timestamp - B.timestamp),3) AS processing_time 
FROM Activity A INNER JOIN Activity B 
ON (A.machine_id = B.machine_id AND A.process_id = B.process_id AND A.activity_type= 'end' AND B.activity_type='start')
GROUP BY A.machine_id;

/* 
    1. Performing a join. The first table contains 'end' type and the second type contains 'start'.
    2. Group by machine_id
    3. Inside a group, take average of the difference of timestamps
    4. Round it off to 3 decimal places
 */

-- @block

-- Students and Examinations
-- https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50

SELECT A.student_id,A.student_name,B.subject_name,COUNT(C.subject_name) AS attended_exams FROM 
((Students A CROSS JOIN Subjects B) LEFT JOIN Examinations C ON A.student_id=C.student_id AND B.subject_name=C.subject_name) 
GROUP BY A.student_id,B.subject_name ORDER BY A.student_id,B.subject_name;

-- @block

-- Managers with at Least 5 Direct Reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

SELECT B.name FROM Employee A INNER JOIN Employee B 
ON A.managerId=B.id  
GROUP BY A.managerId HAVING COUNT(A.id)>=5;

-- @block

-- Confirmation Rate
-- https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50

SELECT A.user_id, ROUND(IFNULL(AVG(action='confirmed'),0),2) AS confirmation_rate 
FROM Signups A LEFT JOIN Confirmations B ON A.user_id = B.user_id
GROUP BY A.user_id; 

/* 
    Breakdown of ROUND(IFNULL(AVG(action='confirmed'),0),2):

     -  First we take average of the 'confirmed' actions (wrt the total actions) in a group, using AVG aggregate function.

     -  For some signups, there are no actions, in that case, AVG function will give NULL. We handle that using IFNULL in-built function. 
    
     - Finally, we round the value to two decimal places.
 */

