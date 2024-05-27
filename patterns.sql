-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

-- The percent sign % represents zero, one, or multiple characters

-- The underscore sign _ represents one, single character


SELECT * FROM Customers
WHERE CustomerName LIKE 'a%' OR CustomerName LIKE '%b'; -- Return all customers that starts with 'a' or ends with 'b'


SELECT * FROM Customers WHERE CustomerName LIKE '%or%'; -- all customers that contains the phrase 'or' 


SELECT * FROM Customers WHERE CustomerName LIKE '_r%';  -- Return all customers that have "r" in the second position


SELECT * FROM Customers WHERE Country LIKE 'Spain'; -- Return all customers from Spain (no wildcard is specified, the phrase has to have an exact match to return a result) 

