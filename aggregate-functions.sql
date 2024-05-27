-- Aggregate Functions : It is a function that performs a calculation on a set of values, and returns a single value. Aggregate functions ignore null values (except for COUNT()).

-- MIN() and MAX()

SELECT MIN(Price) FROM Products;    --returns the smallest within the selected column respectively

SELECT MAX(Price) FROM Products;    --returns the greatest value within the selected column respectively

SELECT MIN(Price) AS SmallestPrice FROM Products; --When we use MIN() or MAX(), the returned column will not have a descriptive name. To give the column a descriptive name, use the AS keyword

-- COUNT()

SELECT COUNT(*) FROM Products;  -- Find the total number of rows (including NULL values) in the Products table

SELECT COUNT(ProductName) FROM Products; -- Find the number of products where the ProductName is not null (as we have specified a column name)

SELECT COUNT(ProductID) FROM Products WHERE Price > 20; --Find the number of products where Price is higher than 20

SELECT COUNT(*) AS 'Number of records' FROM Products;   -- Name the counted column 'Number of records'

-- SUM()

SELECT SUM(Quantity) FROM OrderDetails; -- Return the sum of all Quantity fields in the OrderDetails table 

SELECT SUM(Quantity) FROM OrderDetails WHERE ProductId = 11; -- Return the sum of the Quantity field for the product with ProductID 11

SELECT SUM(Quantity) AS total FROM OrderDetails;    -- Give the summarized column a name by using the AS keyword

SELECT SUM(Quantity * 10) FROM OrderDetails; -- assuming that each product in the OrderDetails column costs 10 dollars, we can find the total earnings in dollars by multiply each quantity with 10

-- AVG()

SELECT AVG(Price) FROM Products;    -- Find the average price of all products

SELECT AVG(Price) FROM Products WHERE CategoryID = 1;   -- Return the average price of products in category 1

SELECT AVG(Price) AS "average price" FROM Products; -- Name the column "average price"

SELECT * FROM Products WHERE price > (SELECT AVG(price) FROM Products); --Return all products with a higher price than the average price using the AVG() function in a sub query 

