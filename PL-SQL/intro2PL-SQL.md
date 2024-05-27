PL/SQL, in simple terms, is a programming language used for managing data in ORACLE databases. It combines SQL for data manipulation and procedural features for building programs as per requirement.

Note:

- *%* (Modulo) Operator is not available in Oracle. Hence can't be used in PL/SQL code.

- `**` is used as exponentiation operator (PL/SQL only)

### Steps to run a PL/SQL code
1. First create a file named program.sql
1. Then write the code and save the file
1. Then open terminal in the same directory where you have saved your program file.
1. Run `sqlplus` Enter your username and password to login to oracle database server.
1. Then write `set serveroutput on` command otherwise you will not able to see any output.
1. To execute the file just put `@` before file name, e.g.
```sql
    SQL>@program
```

### Structure of PL/SQL Block

```sql
    DECLARE -- Optional

    BEGIN   -- script execution starts from this point.

    EXCEPTION   -- Optional (for error handling)

    END;
    /   -- To run the code from the SQL command line, we need / at the beginning of the first blank line after the last line.
```

e.g. The following script prints Hello World on console.

```sql

    BEGIN   

        DBMS_OUTPUT.PUT_LINE('Hello World!!');  -- use single quotes for string

    END;
    /
```

There are two types of blocks/programs in PL/SQL, **Anonymous** and **Named**.

### Anonymous Block

1. It is a collection of statements to perform some task.
1. Not saved in db.
1. Only used for one-time activities.

There are two types of Anonymous block,

- STATIC Anonymous Block/Program : Consists of hard-coded values, does not take runtime input.

- DYNAMIC Anonymous Block/Program : Takes runtime input from the user.


### Example of STATIC Anonymous Block

```sql
    DECLARE 
        val1 NUMBER;    -- declaring variables
        val2 NUMBER;
        total NUMBER;

    BEGIN
        val1 := 10;     -- initializing the declared variables
        val2 := 10;

        total := val1+val2;

        DBMS_OUTPUT.PUT_LINE('Adding we get');
        DBMS_OUTPUT.PUT_LINE(total);

        -- or

        DBMS_OUTPUT.PUT_LINE('Total ' || total);     -- using || operator, we can concatenate and display the value in the same line

    END;
    /
```

### Example of DYNAMIC Anonymous Block

```sql
    DECLARE
        val1 NUMBER;
        val2 NUMBER;
        total NUMBER := 0 ;     -- we can initialize variables in DECLARE section

    BEGIN

        total := &val1+&val2;        -- we can also reassign initialized variables like this. & is used to take user i/p 

        DBMS_OUTPUT.PUT_LINE('Adding we get');
        DBMS_OUTPUT.PUT_LINE(total);

        
    END;
    /
```
### Named Block

1. This is somewhat similar to Anonymous block.
1. It is saved in db for future usage.

e.g., the following is used to create a procedure named *ADD_PROC* in db :

```sql
    CREATE OR REPLACE PROCEDURE ADD_PROC AS     -- no need of DECLARE; ADD_PROC is the name of the procedure

        val1 NUMBER;
        val2 NUMBER;
        total NUMBER;

    BEGIN
        val1 := 10;
        val2 := 10;

        total := val1+val2;

        DBMS_OUTPUT.PUT_LINE('Adding we get');
        DBMS_OUTPUT.PUT_LINE(total);

    END;
    /
```
To call the created procedure,

```sql
    BEGIN
    ADD_PROC;
    END;
    /
```

### INTO operator

This is used to assign value to a variable, but it can't be used in DECLARE section.

e.g.,
```sql
    DECLARE
        name VARCHAR2(10);
        amount number;
    BEGIN
        SELECT emp_name INTO name FROM employee WHERE emp_id=101;      -- emp_name will be stored in name variable

        SELECT emp_name,salary INTO name,amount FROM employee WHERE emp_id=101 ; -- emp_name, salary will be stored in name,amount variables respectively

        DBMS_OUTPUT.PUT_LINE('Name is ' || name || ', Salary is ,' || amount);
    END;
    /
```

### IF-ELSIF-ELSE statement

IF statement
```sql
    DECLARE 
        num1 NUMBER := 3; 
        num2 NUMBER := 1; 
    BEGIN  
        IF  num1>num2 THEN  
            DBMS_OUTPUT.PUT_LINE('num1 is greater than num2');  
        END IF;  
    END;
    /
```
IF-ELSE 
```sql
    DECLARE 
        num1 NUMBER := 1; 
        num2 NUMBER := 1; 
    BEGIN  
        IF num1=num2 THEN  
            DBMS_OUTPUT.PUT_LINE('num1 is equal to num2');
        ELSE
            DBMS_OUTPUT.PUT_LINE('num1 is not equal to num2');
        END IF;  
    END;
    /
```
IF-ELSIF-ELSE
```sql
    DECLARE 
        num1 NUMBER := 1; 
        num2 NUMBER := 2; 
    BEGIN  
        IF num1>num2 THEN  
            DBMS_OUTPUT.PUT_LINE('num1 is greater than num2');
        ELSIF num1<num2 THEN
            DBMS_OUTPUT.PUT_LINE('num2 is greater than num1');
        ELSE
            DBMS_OUTPUT.PUT_LINE('num1 is equal to num2');
        END IF;  
    END;
    /
```
### CASE statements

```sql
    DECLARE 
        val CHAR := 'C';  
    BEGIN  
        CASE val
            WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Good');
            WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Considerable');
            WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Poor');
            ELSE DBMS_OUTPUT.PUT_LINE('Invalid Grade');
        END CASE;
    END;
    /
```

### Loops

Basic loop with EXIT

```sql
   DECLARE 
    val NUMBER := 1;  
    BEGIN  
        LOOP 
            DBMS_OUTPUT.PUT_LINE('Current value '|| val);
            val:=val+1;
            IF val>3 THEN   -- w/o this condition, the loop will run for infinite
                EXIT;
            END IF;
        END LOOP;	
    END;
    / 
```
Basic loop with EXIT WHEN

```sql
   DECLARE 
    val NUMBER := 1;  
    BEGIN  
        LOOP 
            DBMS_OUTPUT.PUT_LINE('Current value '|| val);
            val:=val+1;
            EXIT WHEN val>4;
        END LOOP;	
    END;
    / 
```

Basic loop with CONTINUE

```sql
   DECLARE 
    val NUMBER := 1;  
    BEGIN  
        LOOP    -- control comes here if it hits CONTINUE

            EXIT WHEN val>4;
            IF val=2 THEN
                val:=val+1;
                CONTINUE;
            END IF;
            DBMS_OUTPUT.PUT_LINE('Current value '|| val);
            val:=val+1;

        END LOOP;	
    END;
    / 
```
Basic loop with CONTINUE WHEN

```sql
   DECLARE 
    val NUMBER := 1;  
    BEGIN  
        LOOP    -- control comes here if it hits CONTINUE

            val:=val+1;
            EXIT WHEN val>4;
            CONTINUE WHEN val=2;
            DBMS_OUTPUT.PUT_LINE('Current value '|| val);

        END LOOP;	
    END;
    / 
```
WHILE loop

```sql
    DECLARE 
    val NUMBER := 1;  
    BEGIN  
        WHILE val<5 LOOP    

            DBMS_OUTPUT.PUT_LINE('Current value '|| val);
            val:=val+1;

        END LOOP;	
    END;
    /

```
FOR loop

**The upperbound should always be greater than or equal to the lowerbound**

```sql
    BEGIN  
        FOR i IN 1..5 LOOP -- control comes here if it hits CONTINUE

            CONTINUE WHEN i=3;
            DBMS_OUTPUT.PUT_LINE('Current value '|| i);

        END LOOP;   -- here, 1 is lowerbound and 5 is upperbound
    END;
    /   
```

REVERSE FOR loop

**The upperbound should always be greater than or equal to the lowerbound**

```sql
    BEGIN  
        FOR i IN REVERSE 1..5 LOOP -- control comes here if it hits CONTINUE

            CONTINUE WHEN i=3;
            DBMS_OUTPUT.PUT_LINE('Current value '|| i);

        END LOOP;   -- here, 1 is lowerbound and 5 is upperbound
    END;
    /
```



