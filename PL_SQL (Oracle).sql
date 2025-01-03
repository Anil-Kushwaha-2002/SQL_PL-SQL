-- Basic PL/SQL Block Structure

--1). PL/SQL program consists of three sections:

-- Declaration Section:- Defines variables, constants, and cursors.
-- Execution Section:- Contains the procedural code (mandatory).
-- Exception Section:- Handles runtime errors (optional).

DECLARE
   -- Declaration section (optional)
   variable_name datatype [NOT NULL] := initial_value;
BEGIN
   -- Execution section (mandatory)
   -- Write the logic here.
   DBMS_OUTPUT.PUT_LINE('Hello, Oracle PL/SQL!');
EXCEPTION
   -- Exception handling section (optional)
   WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;
/

-- Example

DECLARE
    v_name VARCHAR2(50);

BEGIN
    v_name := 'Anil';
    DBMS_OUTPUT.PUT_LINE('Hello, ' || v_name || '!');

END;

-- =======================================================================================================================
-- =======================================================================================================================
-- 2.) Applications / Features of PL/SQL 

-- 1.) Variables and Data Types:- Variables are declared in the DECLARE section.

DECLARE
    v_name VARCHAR2(50) := 'Oracle PL/SQL';
    v_salary NUMBER(10,2) := 50000.50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Salary: ' || v_salary);
END;
/


-- ======================================================================================================================
--2.) Control Structures:- IF...ELSE, LOOPS,...

-- IF...ELSE:

DECLARE
    v_age NUMBER := 25;
BEGIN
    IF v_age < 18 THEN
        DBMS_OUTPUT.PUT_LINE('Minor');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Adult');
    END IF;
END;
/
-- Loops:

BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
    END LOOP;
END;
/

-- ======================================================================================================================
-- 3.) Exception Handling

DECLARE
    v_num NUMBER := 0;
BEGIN
    v_num := 10 / 0;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Division by zero is not allowed.');
END;
/

-- =====================================================================================================================================
-- 4.) Triggers (INSERT, UPDATE, DELETE) :- Automatically execute code in response to database events.(e.g., logging, validations).
-- 1.) Based on Event
-- INSERT Trigger:- Fires when a new row is inserted into a table.
-- UPDATE Trigger:- Fires when an existing row in a table is updated.
-- DELETE Trigger:- Fires when a row is deleted from a table.

-- 2.) Based on Timing
-- BEFORE Trigger:-
-- Executes before the triggering event (INSERT, UPDATE, DELETE).
-- Commonly used for data validation or modification before an operation.
-- Example: Automatically setting default values or checking constraints.

-- AFTER Trigger:-
-- Executes after the triggering event has occurred.
-- Commonly used for logging or auditing changes.

-- INSTEAD OF Trigger (Oracle only):-
-- Executes instead of the triggering event.
-- Used with views to enable DML operations like INSERT, UPDATE, DELETE on non-updatable views.

-- 3.) Based on Scope
-- Row-Level Trigger:-
-- Executes once for each row affected by the triggering event.
-- Requires the FOR EACH ROW clause.
-- You can access :OLD (before the event) and :NEW (after the event) in Oracle or OLD and NEW in MySQL.

-- Statement-Level Trigger:-
-- Executes once per triggering SQL statement, regardless of the number of rows affected.
-- Does not use :OLD or :NEW.
-- Note: MySQL does not support statement-level triggers.
                
CREATE OR REPLACE TRIGGER trg_after_insert            --  -------------------------------------------------------
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('New Employee Added: ' || :NEW.emp_name);
END;

-- This trigger prints the name of the new employee whenever a row is inserted into the employees table.


-- ==============================================================================================================================
-- 5.) Cursors:- Cursors allow you to fetch and manipulate query results row by row.

DECLARE
    CURSOR emp_cursor IS SELECT first_name, salary FROM employees;
    v_name employees.first_name%TYPE;
    v_salary employees.salary%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Salary: ' || v_salary);
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- ====================================================================================================================================
-- Stored Program Units:- You can define procedures, functions, packages, and triggers.
-- Stored Procedures and Functions:- Modularize code to reuse across applications
-- 6.) Stored Procedures:- Does not return a value but can perform multiple actions.(Encapsulate reusable logic)

CREATE OR REPLACE PROCEDURE greet_employee (p_name IN VARCHAR2) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, ' || p_name || '!');
END;
/
-- Execute:
BEGIN
    greet_employee('Anil');
END;
/

-- ======================================================================================================================
-- 7.) Functions:- Returns a single value and is used in SELECT statements.(Return values)

CREATE OR REPLACE FUNCTION calculate_bonus (p_salary IN NUMBER) RETURN NUMBER IS
    v_bonus NUMBER;
BEGIN
    v_bonus := p_salary * 0.10;
    RETURN v_bonus;
END;
/
-- Execute:
BEGIN
    DBMS_OUTPUT.PUT_LINE('Bonus: ' || calculate_bonus(5000));
END;
/

-- ======================================================================================================================
-- 8.) Packages:- Group related PL/SQL procedures, functions, variables, and cursors.

CREATE OR REPLACE PACKAGE emp_pkg IS
    PROCEDURE display_greeting(p_name IN VARCHAR2);
END emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_pkg IS
    PROCEDURE display_greeting(p_name IN VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Welcome, ' || p_name || '!');
    END;
END emp_pkg;
/
-- Execute:
BEGIN
    emp_pkg.display_greeting('Anil');
END;
/

-- ======================================================================================================================
-- 9.) Indexes in Oracle:- Indexes improve query performance by reducing the time required to fetch data.
CREATE INDEX idx_salary ON employees (salary);

SELECT emp_name FROM employees WHERE salary > 50000; -- Faster due to index


-- ====================================================================================================================================
-- ====================================================================================================================================

-- Key Not

-- 1.) Constraints:- are used to specify rules for the data in a table.
-- This ensures the accuracy and reliability of the data in the table.
-- 1. PRIMARY KEY Constraint in SQL
-- 2. FOREIGN KEY 
-- 3. UNIQUE
-- 4. NOT NULL 
-- 5. CHECK 
-- 6. DEFAULT
-- 7. CREATE INDEX 

-- =============================================================================================================
-- 2.) Cursor in PL/SQL:- cursor is a pointer to the result set of a query.
-- 1. Implicit Cursor:- Created automatically for single SQL statements.
--    Automatically created by Oracle for SELECT INTO, INSERT, UPDATE, and DELETE operations
-- 2. Explicit Cursor:- Created manually to fetch rows one at a time.
--    Defined by the developer.

-- ===============================================================================================================
-- ===============================================================================================================
-- 3.) Oracle 

-- 1.) Oracle Data Type:-
-- 1 Steing:- char(size), varchar(size), nchar(size), nvarchar2(size)
-- 2 Numeric:- number(), number(P,S) --> (5000.52 --> P=6,S=2)
-- 3 Date:- Date + time
-- 4 LOB (Large Object):- CLOB (character LOB --> Like image,video), BLOB (Binsry LOB ), BFile(file location)

-- 2.) Object of Oracle:-
-- 1. Table
-- 2. View
-- 3. Sequence
-- 4. Index
-- 5. Synongm:- Gives Alternate name to object


-- 3.) Oracle APEX:- Oracle APEX (Application Express) is a low-code development platform that allows developers to build scalable, secure, and responsive web applications using a browser interface and Oracle Database.

-- 4.) key components of Oracle APEX:-
-- Pages:- Building blocks of the application (e.g., Forms, Reports).
-- Regions:- Areas on a page displaying content like tables, charts, or HTML.
-- Items:- Input fields, checkboxes, and dropdowns on a page.
-- Processes:- Logic executed at specific events (e.g., data validation or PL/SQL execution).
-- Dynamic Actions:- Client-side interactivity without requiring JavaScript.

-- 5.) RESTful Web Service in Oracle APEX:- Allow integration between APEX applications and external systems.

-- 6.) Collections in Oracle APEX:- Collections are in-memory tables used to temporarily store data during a session.

-- 7.) Oracle APEX Collection:- collection is a temporary data storage used to manipulate data within an APEX session. It acts like an in-memory table.
