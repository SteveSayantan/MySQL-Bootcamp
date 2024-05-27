A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in the same or another table.

The following SQL creates a FOREIGN KEY on the "PersonID" column which points to the "PersonID" column in the "Persons" table :

```sql

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int REFERENCES Persons(PersonID),
    PRIMARY KEY (OrderID),

    /* 
        or,
        FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
    */
);
```

To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following :

``` sql
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);
```

To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following:

```sql
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
```

To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

```sql
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
```

To drop a FOREIGN KEY constraint, use the following SQL:

```sql
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;
```

