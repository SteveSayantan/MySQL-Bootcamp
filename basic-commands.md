After connecting to the mySQL server for the first time, we need to create a database using `CREATE DATABASE database_name` on mySQL Command Line Client . Now, we can use our newly created database to store multiple tables.

To drop an existing SQL database we use `DROP DATABASE database_name`

We can also get a list of all the databases currently managed by mySQL using `show databases` on mySQL Command Line Client.

`--` is used to write single-line comments in SQL.
`/*...*/` is used to write multi-line comments in SQL.

For any doubt regarding MYSQL, checkout [this](https://www.w3schools.com/sql/default.asp)

### Creating Table

To create a table, we use `CREATE TABLE` command.
E.g., 

```
    CREATE TABLE table_name (
        col_name datatype constraint-1 constraint-2...,
        ...
    );
```

A copy of an existing table can also be created using CREATE TABLE. All columns or specific columns can be selected.

If we create a new table using an existing table, the new table will be filled with the existing values from the old table

```
    CREATE TABLE new_table_name AS SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;   
```

### Get the list of tables in a DB

`SHOW TABLES IN db_name`

### Describe a Table

`DESCRIBE table_name;`

### Rename a Table

`RENAME TABLE old_table1 TO new_table1,old_table2 TO new_table2,...;`

### Delete a Table

`DROP TABLE table_name;`

### Delete all the data inside a table

`TRUNCATE TABLE table_name;` 

### Add a column to the table

`ALTER TABLE table_name ADD column_name datatype;`

### Rename a column

`ALTER TABLE table_name RENAME COLUMN old_name to new_name;`

### Change the data type in a table

`ALTER TABLE table_name MODIFY COLUMN column_name datatype;`

### Remove a column from the table

`ALTER TABLE table_name DROP COLUMN column_name;`

### Inserting data 

`INSERT INTO table_name VALUES (val_1, val_2, val_3...) , (val_1, val_2, val_3...), ... ;`

or,

`INSERT INTO table_name (attr_1,attr_2,...) VALUES (val_1,val_2,...), (val_1,val_2,...),... ;`

The values provided have to maintain the order of the corresponding attributes mentioned in the schema or the query itself. Make sure to separate each set of values with a **comma ,** in case of inserting multiple rows.

We can also enter NULL as a value in both cases. 


### Update data

`UPDATE table_name SET attr1_name=value,attr2_name=value,...  WHERE condition`

Without **WHERE condition** , all the entries in the table will be updated.

### Delete data

`DELETE FROM table_name WHERE condition `

Without **WHERE condition** , all the entries in the table will be deleted ( but it will not reset the autoincremental id, unlike **TRUNCATE**).


### Constraints

- NOT NULL
- UNIQUE
- DEFAULT
- AUTOINCREMENT
- PRIMARY KEY
- CHECK

PRIMARY KEY constraint combines both NOT NULL and UNIQUE constraint.

CHECK ensures that the values in a column satisfies a specific condition.

