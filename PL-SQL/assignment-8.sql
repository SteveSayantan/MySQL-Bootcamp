-- Program 1
DECLARE
    -- Declare variables
    marks NUMBER;
    grade VARCHAR2(10);
BEGIN
    -- Prompt the user to enter marks
    marks := &Enter_Marks;

    -- Use if-else ladder to determine the grade
    IF marks >= 90 THEN
        grade := 'A+';
    ELSIF marks >= 80 THEN
        grade := 'A';
    ELSIF marks >= 70 THEN
        grade := 'B';
    ELSIF marks >= 60 THEN
        grade := 'C';
    ELSIF marks >= 50 THEN
        grade := 'D';
    ELSE
        grade := 'Fail';
    END IF;

    -- Display the grade
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
END;
/

-- Program 2
-- Create a PL/SQL block
DECLARE
    -- Declare variables
    num NUMBER;
    factorial NUMBER := 1;
BEGIN
    -- Prompt the user to enter a number
    num :=5;

    -- Check if the number is non-negative
    IF num < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Factorial is not defined for negative numbers.');
    ELSE
        -- Calculate factorial using a FOR loop
        FOR i IN 1..num LOOP
            factorial := factorial * i;
        END LOOP;

        -- Display the factorial
        DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is: ' || factorial);
    END IF;
END;
/

