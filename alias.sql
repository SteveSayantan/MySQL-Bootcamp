
-- SQL aliases are used to give a table, or a column in a table, a temporary name. Aliases are often used to make column names more readable.

-- An alias only exists for the duration of that query.

-- An alias is created with the AS keyword.

-- Syntax when alias is used on column:
SELECT col1_name AS alias_1, col2_name AS alias_2,... FROM table_name;


-- Syntax when alias is used on table:
SELECT column_name(s) FROM table_name AS alias_name;


-- Examples:

SELECT ProductName AS "My Great Products" FROM Products;    --Using "double quotes" for aliases with space characters

SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;   -- selects all the orders from the customer "Around the Horn". We give the tables aliases of "c" and "o" respectively to shorten the query