### Database Management Systems
A special software program that helps users create and maintain a database. Basically, it makes handling databases a breeze.

- Makes it easy to manage large amounts of information.
- Handles security
- Backups
- Importing/Exporting Data
- Concurrency
- Interacts with software applications

A RDBMS helps users create and maintain a relational databases, e.g. mySQL, Oracle, PostgreSQL, mariaDB etc.

- SQL is a standardized language for interacting with RDBMS. It is used to create and manage databases, define tables and structures, perform CRUD operations, as well as other administrative tasks e.g. user management, security, backup etc. **However, the implementation of SQL varies among different RDBMS. Most of the RDBMS have their own proprietary extensions in addition to the SQL standard.** 


A Non-Relational Database Management System helps users create and maintain a non-relational database, e.g. mongoDB, dynamoDB, firebase etc.
- In case of non-relatinal databases, there is no standard language. Most of them implement their own language for performing different operations on the database.


### Types of Databases

- Relational (SQL) Databases : It organizes data into one or more tables. Each table has columns and rows, a unique key identifies each row.

- Non-Relational (No-SQL) Databases : It organizes data into anything but a traditional table e.g. using key-value pairs, JSON, XML, Graphs etc. 

### Database Queries

Queries are requests made to the database management system for specific information. The goal is to only get the data we need.

### Structured Query Language (SQL)

It is actually a hybrid language because it consists of four types of languages:

- Data Query Language (DQL)
  - Used to query the db for information.

- Data Definition Language (DDL)
  - Used to define database schemas.

- Data Control Language (DCL)
  - Used to control access to the data in the database.
  - User and permissions management.

- Data Manipulation Language (DML)
  - Used for inserting, updating and deleting data from the database.

SQL keywords, table/column names are NOT case sensitive. Semicolon is the standard way to separate each SQL statement.

### Common Datatypes in MySQL

- Numeric Data Types

  - INT(size) : Signed range is from -2147483648 to 2147483647. Unsigned range is from 0 to 4294967295. The **size** argument (optional) specifies the display width. Read more about the **size** parameter [here](https://dev.mysql.com/doc/refman/8.3/en/numeric-type-attributes.html)

  - DECIMAL(precision,scale) :  The precision represents the number of significant digits that are stored for values, and the scale represents the number of digits that can be stored following the decimal point. If the scale is 0, DECIMAL values contain no decimal point or fractional part. The maximum number of digits for DECIMAL is 65, but the actual range for a given DECIMAL column can be constrained by the precision or scale for a given column. E.g.  DECIMAL(5,2) be able to store any value with five digits and two decimals, so values that can be stored in the salary column range from -999.99 to 999.99. If **precision** is omitted, the default is 10, if **scale** is omitted, the default is 0.

  - FLOAT(p) : A floating point number. MySQL uses the p (i.e. precision) value to determine whether to use FLOAT or DOUBLE for the resulting data type. If p is from 0 to 24, the data type becomes FLOAT(). If p is from 25 to 53, the data type becomes DOUBLE().

    - A single-precision floating-point number is accurate to approximately 7 decimal places.

    - A double-precision floating-point number is accurate to approximately 15 decimal places.

    - For range, checkout [this](https://dev.mysql.com/doc/refman/8.3/en/numeric-type-syntax.html)

  - TINYINT(size): A very small integer. The signed range is -128 to 127. The unsigned range is 0 to 255. The **size** argument (optional) specifies the display width.

  - BOOL,BOOLEAN : These types are synonyms for TINYINT(1). A value of zero is considered false. Nonzero values are considered true. 

- String Data Types

  - CHAR(M) : A fixed-length string that is always right-padded with spaces to the specified length when stored. M represents the column length in characters. The range of M is 0 to 255. If M is omitted, the length is 1.

  - VARCHAR(M) : A variable-length string. M represents the maximum column length in characters. The range of M is 0 to 65,535. For more details on CHAR and VARCHAR, checkout [this](https://dev.mysql.com/doc/refman/8.3/en/char.html). 

 - TEXT : The four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. For details about syntax, checkout [this](https://dev.mysql.com/doc/refman/8.3/en/string-type-syntax.html)

- Date and Time Data Types

  - DATE : A date. The supported range is '1000-01-01' to '9999-12-31'. MySQL displays DATE values in 'YYYY-MM-DD' format, but permits assignment of values to DATE columns using either strings or numbers, e.g.  it interprets any of **'2015-07-21'**, **'20150721'**, and **20150721** as a date.

  - YEAR: The YEAR type is a 1-byte type used to represent year values.

  - For any other detail, checkout [this](https://dev.mysql.com/doc/refman/8.3/en/date-and-time-types.html)

  - For date calculations, checkout [this](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html#function_date-add) and [this](https://dev.mysql.com/doc/refman/8.4/en/date-calculations.html)

