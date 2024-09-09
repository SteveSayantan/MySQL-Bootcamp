-- SELECT STATEMENT
---------------------

SELECT * FROM table_name; -- selects all the fields available in the table

SELECT col_1, col_2 FROM table_name; -- we can also specify specific fields like this

SELECT DISTINCT country from customers; -- SELECT DISTINCT selects only the DISTINCT values from the "Country" column in the "Customers" table

SELECT COUNT(DISTINCT Country) FROM Customers; -- it counts and returns the number of different (distinct) countries in the "Customers" table

-- WHERE CLAUSE ( Used to filter records. Ignores NULL values and does not include them in the result )
----------------

SELECT * FROM Customers WHERE Country = 'Mexico';   --selects all the customers from "Mexico" . Since, Mexico is a text value, it is enclosed in quotes

SELECT * FROM Customers WHERE CustomerID = 1;   -- selects the customer whose id is 1 . Numeric values should not be enclosed in quotes

/* 
    Different Operators in WHERE clause

    = -> Equal
    > -> Greater than
    < -> Less than
    >= -> Greater than or equal
    <= -> Less than or equal
    <> -> Not equal

 */

SELECT * FROM Customers WHERE City = 'Berlin' OR City = 'Stuttgart'; --selects all fields from "Customers" where city is "Berlin" OR "Stuttgart"

SELECT * FROM Customers WHERE NOT Country = 'Germany'; --selects all fields from "Customers" where country is NOT "Germany"

SELECT * FROM Customers WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Stuttgart'); --selects all fields from "Customers" where country is "Germany" AND city must be "Berlin" OR "Stuttgart" 

SELECT * FROM Customers WHERE NOT Country = 'Germany' AND NOT Country = 'USA';  --selects all fields from "Customers" where country is NOT "Germany" and NOT "USA"

-- ORDER BY Keyword (used to sort the result-set in ascending or descending order)

SELECT * FROM Customers ORDER BY Country DESC; --selects all customers from the "Customers" table, sorted DESCENDING by the "Country" (Without DESC, it sorts the records in ascending order by default)

SELECT * FROM Customers ORDER BY Country, CustomerName; -- it orders by Country first, but if some rows have the same Country, it orders them by CustomerName

SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC; --sorted ascending by the "Country" first and descending by the "CustomerName" if some rows have the same "Country" (ASC is optional)

-- LIMIT Clause

SELECT * FROM Customers LIMIT 3;    -- selects the first three records from the "Customers" table

SELECT * FROM Customers LIMIT 3 OFFSET 3; -- return only 3 records, start on record 4 (OFFSET 3)

SELECT * FROM Customers WHERE Country='Germany' LIMIT 3;    --selects the first three records from the "Customers" table, where the country is "Germany"

-- IN Operator

SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'France', 'UK'); --selects all customers that are NOT located in "Germany", "France" or "UK"

SELECT * FROM Customers WHERE Country IN (SELECT Country FROM Suppliers); -- selects all customers that are from the same countries as retrieved from the Suppliers table

-- BETWEEN Operator (It selects values within a given range. The values can be numbers, text, or dates. The BETWEEN operator is inclusive: begin and end values are included.)

SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;  --Selects all products with a price between 10 and 20:

SELECT * FROM Products WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName; --It selects all products with a ProductName alphabetically between Carnarvon Tigers and Mozzarella di Giovanni

SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'; -- It selects all orders with an OrderDate between '01-July-1996' and '31-July-1996'

-- IS NULL and IS NOT NULL ( to test for NULL values, we will have to use the IS NULL and IS NOT NULL operators )

SELECT * FROM Customers WHERE Address IS NULL;  -- it lists all customers with a NULL value in the "Address" field

SELECT * FROM Customers WHERE Address IS NOT NULL;  -- it lists all customers with non-empty value in the "Address" field


