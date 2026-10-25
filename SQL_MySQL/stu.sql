-- 1) CREATE TABLE

create table Student 
(
Roll_no int primary key,
firstName varchar(255),
lastName varchar(255),
mark int,
class int
);


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


-- 3) AND , OR
select * FROM student where mark=80 AND mark>=80;
SELECT * FROM student where firstName = "Anil" OR Mark > 80;

-- 4) Where (clause)
select * from student where mark >= 85;
select * from Student where Roll_no >=24;
select * from student where lastName like 'k%';
select * from student where firstName like '%l';
select * from student where class = 10;

-- 5) Order By 
select * from student order by mark ;
select * from student order by mark DESC;
select * from student order by firstName;

-- 6) Distinct (statement)
select distinct(class) from student;

-- 7) Delete (Statement)                       --------------------------------------------
delete from student where Roll_no = 22;
delete from student where class = 10;

-- 8) Date and Time
select now(), curdate(), curtime();
select now() Date_and_Time ,curdate() Date ,curtime() Time;

-- 9) Functions 
select count(firstName) from student;
select sum(mark) from student;
select avg(mark) from student;
select max(mark) from student;
select min(mark) , avg(mark)from student;
select ucase(firstName), lcase(lastName) from student;
select lcase(lastName) from student;
select substr(firstName,1,3) from student;
select replace(firstName, 'Anil', 'Deepak') from student;

-- 10) Group by (statement)
select sum(class) from student group by class;

-- 11) Having  (clause) --> Having used because, where key can not be used with aggregat functions(sum,avg,..)
select sum(class) from student group by class having sum(class)>15;

-- 12) Alter table  --> TO add, delete (Drop), change data type of column in table
alter table student add location varchar(255);
alter table student add fee int;
alter table student drop column fee ;
alter table student modify fee varchar(255);

-- 13) as (Alias)  --> you can give another name by using alias (as)
select firstName as Name_of_student from student;
select firstName as "Name of student" from student;
select firstName as 'Name_of_student' from student;

-- 14) Drop  --> Drop is used to drop existing SQL Table, Database,..
drop table company;

create table company (
Num int auto_increment primary key,
Name varchar(255),
Location varchar(155),
Type varchar(255),
Salery int
); 

select * from company;

-- 15) Between  --> Use in where clause,   to select Range of data b/w two two values
select * from student where mark between 80 and 90;

-- 16 in  (Operater) --> Use in where clause, to specify multiple value
select * from student where firstName in ('Rahul', 'Abhisak');

-- 17) Like --> Use in where clause, to search specified Pattern in column
select * from student where firstName like 'A%';

-- 18) Truncate  --> Use to Delet complete data from existing table

-- 19) Update  --> update records in a table
update student set firstName = "Pawan" where Roll_no = 1;   

-- 20) Constraint --> not null, unique, check, primary key, foreign key, auto_increment, default 
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

-- 21) Join (Operation)  -- Combine 'Rows' from two or more table based on related 'Column' b/w them
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
 
 
 -- 22) Limit (Top Clause)  -->  Specify the no of recorf to return
select * from student limit 2;
select * from student limit 2,4;








create table company 
(
Num int auto_increment primary key,
Name varchar(255),
Location varchar(155),
Type varchar(255),
Salery int
); 