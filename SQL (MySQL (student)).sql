-- SQL ( MySQL Database )
-- 1) CREATE TABLE

create table Student (
Roll_no int primary key,
firstName varchar(255),
lastName varchar(255),
mark int,
class int
);

show databases;
show tables;
desc student;
select current_user();
select char_length('anil');

select * from student;
truncate table student;
-- drop table student;  
-- delete table student;
select now(), curdate(), curtime();
select now() Date_and_Time ,curdate() Date ,curtime() Time;

-- 2) Insert INTO 

insert into student(Roll_no, firstName, lastName, mark, class)
values(1, "Anil", "Maurya", 85, 10);
insert into student(Roll_no, firstName, lastName, mark, class)
values(2, "Rahul", "Kumar", 80, 12);
insert into student(Roll_no, firstName, lastName, mark, class)
values(3, "Abhisak", "Shing", 90, 11);
insert into student(Roll_no, firstName, lastName, mark, class)
values(4, "AMAN", "Kushwaha", 95, 11);
insert into student(Roll_no, firstName, lastName, mark, class)
values(5, "Amit", 'Kumar', 75, 10);

select * from student;


-- 3) Alter table  --> TO add, delete, Modifing, change data type of column in table
alter table student add location varchar(255);
alter table student add fee int;
alter table student drop column fee ;
alter table student modify fee varchar(255);

-- 4) Update  --> update records in a table
update student set firstName = "Pawan" where Roll_no = 1; 

--  ========================================================================================================
-- 5) Delete (Statement) --> Use to remove(Delete) 'rows' from table based on a condition                   --------------------------------------------
delete from student where Roll_no = 22;
delete from student where class = 10;

-- 6) Truncate  --> Use to delete All 'rows' (complete data. but, not table) from table and is faster but cannot be rolled back -------------------------


-- 7) Drop  --> Used to remove(Delete) whole Database, Table and data existing SQL
drop table company;

create table company (
Num int auto_increment primary key,
Name varchar(255),
Location varchar(155),
Type varchar(255),
Salery int
); 

select * from company;



-- 8) Aggregation Functions   =======================================================================================
-- 1) Numeric function
select count(firstName) from student;
select sum(mark) from student;
select avg(mark) from student;
select max(mark) from student;
select min(mark) , avg(mark)from student;

-- 2) String function
select ucase(firstName), lcase(lastName) from student;
select lcase(lastName) from student;
select substr(firstName,1,3) from student;
select char_length('anil');
select charset('my name is anil' );
select replace(firstName, 'Anil', 'Deepak') from student;

-- 3) DateTime function
select now();
select current_time();
select curtime();
select current_date();



-- 9) Key words  =========================================================================================================
-- 1) Where (clause) --> Use to Filter rows before grouping in a query
select * from student where mark >= 85;
select * from Student where Roll_no >=24;
select * from student where lastName like 'k%';
select * from student where firstName like '%l';
select * from student where class = 10;

-- 2) Having  (clause) --> Having used because, where key can not be used with aggregat functions(sum,avg,..) or Filter groups after they have been formed (Aggregation)
select sum(class) from student group by class having sum(class)>15;

-- 3) Order By --> Arreng the ascending or descinding
select * from student order by mark ;
select * from student order by mark DESC;
select * from student order by firstName;

-- 4) Group by (statement) --> Group 'rows' based on specified columns (Aggregation Key words)
select sum(class) from student group by class;

-- 5) Date and Time 
select now(), curdate(), curtime();
select now() Date_and_Time ,curdate() Date ,curtime() Time;

 -- 6) Limit (Top Clause)  -->  Specify the no of recorf to return
select * from student limit 2;
select * from student limit 2,4;

-- 7) as (Alias)  --> you can give another name by using alias (as)
select firstName as Name_of_student from student;
select firstName as "Name of student" from student;
select firstName as 'Name_of_student' from student;

 -- 8) Limit (Top Clause)  -->  Specify the no of recorf to return
select * from student limit 2;
select * from student limit 2,4;

-- 9) Distinct (statement) -- Eliminate duplicate records from result set
select distinct(class) from student;

-- 10) values -->  values is used in INSERT INTO statement for inserts a new record
insert into student(Roll_no, firstName, lastName, mark, class)
value(6, 'raj',' ',60, 9);

-- 11) case --> CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement)
SELECT firstName, mark,
CASE
    WHEN mark >= 90 then "1st class"
    when mark >= 80 AND mark < 90 then '2nd class'
    ELSE '3rd class'
END as class from student order by class;

select * from student;


-- 10) Logical, Relational, and Arthmetic Operation =====================================================================================

-- Logical ---------------------------------------------
-- 1) AND , OR , NOT
select * FROM student where mark=80 AND mark>=80;
SELECT * FROM student where firstName = "Anil" OR Mark > 80;

-- Relational -----------------------------------------
-- 2) Between  --> Use in where clause,   to select Range of data b/w two two values
select * from student where mark between 80 and 90;

-- 3) in (Operater) --> Use in where clause, to specify multiple value
select * from student where firstName in ('Rahul', 'Abhisak');

-- 4) Like --> Use in where clause, to search specified Pattern in column
select * from student where firstName like 'A%';

-- 5) some, any, all --> returns a boolean value as a result
--    some --> returns TRUE if any of the subquery values meet the condition
--    ANY --> returns TRUE if ANY of the subquery values meet the condition
--    ALL --> returns TRUE if ALL of the subquery values meet the condition

-- 6) exists --> values present
-- 7) unique --> values is unique not repated

-- Arthmetic --> ( +, -, *, / ) ------------------------------
update emp set esal= esal + 7000 wher eid= 5;

 -- ======================================================================================================================

-- 11) Constraint --> not null, unique, check, primary key, foreign key, auto_increment, default 
-- 1) Not null  -->  not accept null values
-- 2) Unique    --> All values in column are different
-- 3) check     --> use to fixed the limit the values range that can placed in column
-- 4) Primary key --> Uniquely identifies each record in table ( Unique + not null) --> (Parent table)
-- 5) Foreign key --> To make relationship b/w two or more then two tables  --> (child table)
-- 5) auto_increment --> auto increment unique no when new record is insert into table 

create table Book (
ID int auto_increment,
Name varchar(255) UNIQUE,
Subject  varchar(155) not null,
Writer varchar(255),
Cost int,
check(cost >= 500),
primary key(ID),
foreign key(ID) references student(Roll_no)
);
                                                       -- ------------------------------------
insert into Book( ID, Name, Subject, Writer, Cost)
value(1, 'Anil','Mathematics', 'XYZ', 950), 
(2, 'Deelak',' Hindi', 'ABC', 500),
(3, 'Rahul', 'English','PQR', 700);

insert into Book( Name, Subject, Writer, Cost)
value( 'Rame', 'Database', 'qwe', 600);

select * from book;
drop table Book;
SHOW tables;


-- =========================================================================================================================
-- 12) Set (Operation) 
-- 1) Union (Operation) --> Combine the result set of two or more SELECT statements (unique value)  ---------------------
select firstName from student union select name from employer;
select * from student UNION select * from employer;

-- 2) Union All --> Duplicate value also present
select * from student UNION ALL select * from employer;

-- 3) Intersect --> Only unique value from both table
select * from student INTERSECT select * from employer;

-- 4) Minus --> 
select * from student MINUS select * from employer;

select * from student;
select * from employer;


-- ==================================================================================================================
-- 13) Join (Operation)  -- Combine 'Rows' from two or more table based on related 'Column' b/w them
-- 1) inner join / join  --> Return roes that have matching values in both tables
select student.Roll_no, student.firstName, student.class from student 
inner join book on student.Roll_no = book.ID;
select * from student inner join book on student.Roll_no = book.ID;

-- 2) left join  --> Return all roes from left table, even if there are no matches in the right table
select student.firstName, student.mark, book.name, book.cost from student
left join book on student.Roll_no = book.ID;
select * from student left join book on student.Roll_no = book.ID;

-- 3) right join --> Return all rows from right table , even if there are no matches in left table
select student.firstName, student.mark, book.name, book.cost from student
right join book on student.Roll_no = book.ID;
select * from student right join book on student.Roll_no = book.ID;

-- 4) full join --> Return rows when there is a match in one of the table   -- ----------------------------------
select student.firstName, student.mark, book.name, book.cost from student
full join book on student.Roll_no = book.ID;
select * from student full join book on student.Roll_no = book.ID;
 
 

-- 14) Database Objects  ============================================================================================
-- 1) Trigger --> Used to specify set of action that are automatically performed (insert,update,delete)
-- 2) view, materialized view -->View is a virtual table derived from one or more tables, while  materialized view is a physical copy of result set of query stored for faster data retrieval
-- 3) database and schema --> Database is collection of table and data, while schema is collection of database objects, including table, viezs and stored procedures
-- 4) index -->  Improves the performance of some queries
-- 5) synonym --> Alternative name for an object


-- 15) Important  ==============================================================================================
-- 1) subquery --> Is a query nested inside another query. 
-- 2) commit --> user save any changes on the current transaction in database table
--   commit() : It is called only when all the operations in a transaction are successful.
-- 3) Rollback --> user undo all the changes that occurred on the current transaction after the last COMMIT ( used in error handling scenarios )
--   rollback() : It is called if any one operation in a transaction fails.
-- 4) Grant --> This DCL command grants permissions to the user on the database objects.
-- 5) Revoke --> removes permissions if any granted to the users on database objects


-- ===============================================================================================================
-- ===============================================================================================================
-- MySQL start Procedure
-- Changing Default Delimiter
-- Creating and Call Stored Procedure
-- Variables
-- Parameters - IN, OUT, INOUT
-- Drop procedure
-- Alter procedure

-- ============================================================================================================
-- ============================================================================================================
-- 1) Trigger --> Used to specify set of action that are automatically performed (insert,update,delete)
-- Before insert
-- After insert
-- Before update
-- After update
-- Before delete
-- After delete


show databases;
SHOW tables;
desc student;

