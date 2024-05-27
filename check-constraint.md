The CHECK constraint is used to limit the value range that can be placed in a column.

If CHECK constraint is not provided with any name, MySQL generates a name itself.

## Usage

We can define a CHECK constraint on a column and it can refer only to that column.

```sql
    CREATE TABLE Persons (
    ID int NOT NULL,
    FirstName varchar(255) NOT NULL CONSTRAINT min_len CHECK (LENGTH(FirstName)>1) , -- defined on column, with name   
    LastName varchar(255) ,
    Age int CHECK (Age>=18)  -- defined on Age, w/o name
    );
```

We define a CHECK constraint on a table (i.e. outside any column definition) so  it can refer to multiple table columns. It may contain forward references to columns not defined yet.

```sql
CREATE TABLE Persons (
    CONSTRAINT CHK_Age CHECK (Age>=18), -- defined on table, with name
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CHECK (City='Sandnes')  -- defined on table, w/o name
);

```

## To add a CHECK constraint to an existing table

```sql
ALTER TABLE Persons
ADD CHECK (Age>=18);

```

or, 

```sql
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');

```
## DROP a CHECK constraint

```sql
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;

```
