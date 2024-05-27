A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

Supported Types of Joins in MySQL:

- INNER JOIN: Returns records that have matching values in both tables. It is aka Natural Join.

- LEFT JOIN: Returns all records from the left table, and the matched records from the right table. NULL is used if no match is found from the right table.

- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table.  NULL is used if no match is found found from the left table. 

- CROSS JOIN: Returns the cartesian product of both tables

- FULL Join is not natively supported in MySQL, but it can be emulated by performing union of left and right join.


#### Important:

The problem with natural join or inner join is only those values that appears in both relations will manage to reach final table, but if some value is explicitly in table
one or two, that information will be lost, and that will be loss of information.

The different outer joins (i.e. LEFT,RIGHT,FULL) preserve those tuples that would be lost in a join, by creating tuples containing NULL values.


### INNER JOIN

```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```
e.g., SQL statement selects all orders with customer and shipper information (also shows the syntax for nested joins)

```sql
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);
```

### LEFT JOIN

```sql
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```

### RIGHT JOIN

```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
```

### CROSS JOIN

```sql
SELECT column_name(s)
FROM table1
CROSS JOIN table2;
```

### SELF JOIN

A self join is a regular join, but the table is joined with itself.

```sql
SELECT column_name(s)
FROM table1 AS T1, table1 AS T2
WHERE condition;
```

### UNION 

- Every SELECT statement within UNION must have the same number of columns
- The columns must also have similar data types
- The columns in every SELECT statement must also be in the same order

```sql
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2
UNION
... ;

```

Use `UNION ALL` to allow duplicate values.

### INTERSECT AND EXCEPT

Syntax is the same as UNION.



