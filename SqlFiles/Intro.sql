-- ==========================================================
--                  SQL - FIRST CLASS NOTES
-- ==========================================================

/*
Useful Shortcut
---------------
Ctrl + Enter
Executes the current SQL query.
*/


-- ==========================================================
-- CREATE DATABASE
-- ==========================================================

/*
CREATE DATABASE is used to create a new database.
*/

CREATE DATABASE new1;


-- ==========================================================
-- SHOW DATABASES
-- ==========================================================

/*
Displays all databases available in MySQL.
*/

SHOW DATABASES;


-- ==========================================================
-- USE DATABASE
-- ==========================================================

/*
Select the database in which you want to work.
*/

USE new1;



-- ==========================================================
-- CREATE TABLE
-- ==========================================================

/*
CREATE TABLE creates a new table.

Syntax:

CREATE TABLE table_name(
    column_name datatype,
    column_name datatype
);
*/

CREATE TABLE student(
    id INT,
    name VARCHAR(30),
    marks INT
);



-- ==========================================================
-- DESCRIBE TABLE
-- ==========================================================

/*
DESCRIBE (DESC) displays the table structure.
*/

DESCRIBE student;



-- ==========================================================
-- VIEW TABLE DATA
-- ==========================================================

/*
SELECT * displays all records.
*/

SELECT *
FROM student;



-- ==========================================================
-- INSERT DATA
-- ==========================================================

/*
Insert complete rows into a table.
*/

INSERT INTO student
VALUES
(1,'Abhishek',60),
(2,'Krrish',70),
(3,'Karan',80),
(4,'Kunal',90),
(5,'Himanshu',100);


SELECT *
FROM student;



-- ==========================================================
-- INSERT INTO SPECIFIC COLUMNS
-- ==========================================================

/*
If values are inserted into selected columns,
column names must be mentioned.
*/

INSERT INTO student(name)
VALUES
('Jatin'),
('Kapil');


SELECT *
FROM student;


INSERT INTO student(id,marks)
VALUES
(8,90),
(9,99);


SELECT *
FROM student;



-- ==========================================================
-- CONSTRAINTS
-- ==========================================================

/*
Constraints are rules applied while creating a table.

Common Constraints

1. UNIQUE
   -> Does not allow duplicate values.

2. NOT NULL
   -> Does not allow NULL values.

3. CHECK
   -> Validates a condition before inserting data.

4. DEFAULT
   -> Assigns a default value if no value is provided.

5. AUTO_INCREMENT
   -> Automatically generates sequential values.
*/



-- ==========================================================
-- CREATE TABLE WITH CONSTRAINTS
-- ==========================================================

CREATE TABLE stud1(

    id INT UNIQUE NOT NULL,

    name VARCHAR(30) NOT NULL,

    age INT CHECK(age > 18),

    branch VARCHAR(30) DEFAULT 'mca'

);


DESCRIBE stud1;



-- ==========================================================
-- INSERT DATA
-- ==========================================================

INSERT INTO stud1
VALUES
(1,'Abhishek',25,'bca');


SELECT *
FROM stud1;



-- ==========================================================
-- CHECK CONSTRAINT
-- ==========================================================

/*
Age must be greater than 18.

The following query will produce an error.

INSERT INTO stud1
VALUES
(2,'Prince',16,'bsc');
*/


INSERT INTO stud1
VALUES
(2,'Prince',19,'bsc');


SELECT *
FROM stud1;



-- ==========================================================
-- UNIQUE CONSTRAINT
-- ==========================================================

/*
Duplicate IDs are not allowed.

The following query will produce an error.

INSERT INTO stud1
VALUES
(1,'Ayush',20,'bca');
*/


INSERT INTO stud1
VALUES
(3,'',20,'bca');


SELECT *
FROM stud1;



-- ==========================================================
-- DEFAULT CONSTRAINT
-- ==========================================================

/*
DEFAULT inserts the default value if no value is provided.
*/

INSERT INTO stud1
VALUES
(4,'Abhishek',25,DEFAULT);


SELECT *
FROM stud1;



-- ==========================================================
-- INSERT WITHOUT DEFAULT COLUMN
-- ==========================================================

/*
Branch will automatically become 'mca'.
*/

INSERT INTO stud1(id,name,age)
VALUES
(5,'Varun',19);


SELECT *
FROM stud1;



-- ==========================================================
-- AUTO_INCREMENT
-- ==========================================================

/*
AUTO_INCREMENT automatically generates IDs.

Every new record gets the next available number.
*/

CREATE TABLE stud2(

    id INT UNIQUE AUTO_INCREMENT,

    name VARCHAR(30)

);


INSERT INTO stud2(name)
VALUES
('Nishu'),
('Saurabh'),
('Dhruv');


SELECT *
FROM stud2;



-- ==========================================================
-- START AUTO_INCREMENT FROM A CUSTOM VALUE
-- ==========================================================

/*
AUTO_INCREMENT can start from any value.
*/

CREATE TABLE stud3(

    id INT UNIQUE AUTO_INCREMENT,

    name VARCHAR(30)

)

AUTO_INCREMENT = 101;



INSERT INTO stud3(name)
VALUES
('Nishu'),
('Saurabh'),
('Dhruv');


SELECT *
FROM stud3;



-- ==========================================================
-- IMPORTANT NOTES
-- ==========================================================

/*
CREATE DATABASE
---------------
Creates a new database.


SHOW DATABASES
--------------
Displays all databases.


USE
---
Selects the current database.


CREATE TABLE
------------
Creates a new table.


DESCRIBE
--------
Displays table structure.


SELECT *
--------
Displays all rows.


INSERT INTO
-----------
Inserts new data into a table.


CONSTRAINTS
-----------

UNIQUE
-------
No duplicate values allowed.

NOT NULL
---------
NULL values are not allowed.

CHECK
------
Validates data before insertion.

DEFAULT
--------
Assigns a default value if no value is supplied.

AUTO_INCREMENT
--------------
Automatically generates sequential values.
*/



-- ==========================================================
-- INTERVIEW TIPS
-- ==========================================================

/*
Difference Between UNIQUE and PRIMARY KEY

UNIQUE
------
• Does not allow duplicate values.
• Allows one NULL value (in MySQL).

PRIMARY KEY
-----------
• Does not allow duplicate values.
• Does NOT allow NULL values.
• Only one PRIMARY KEY is allowed per table.


Difference Between NULL and NOT NULL

NULL
----
Column can contain no value.

NOT NULL
--------
Column must always contain a value.


Difference Between DEFAULT and AUTO_INCREMENT

DEFAULT
--------
Supplies a predefined value.

AUTO_INCREMENT
--------------
Automatically generates numeric values.

CHECK 
------------
we can check any condition before inserting values in a table


*/


create table stud
(id int unique not null,
name varchar(30) not null,
age int check (age>=18),
branch varchar(30) default "civil") ;

describe stud;

insert into stud values
(1,"abhishek morya",24 , "cs");





