USE mca;

==========================================================
--                     SELECT STATEMENT
-- ==========================================================

/*
Definition
----------
SELECT is used to retrieve data from a table.

Syntax:

SELECT column_name
FROM table_name;

OR

SELECT *
FROM table_name;
*/


-- Display all columns.

SELECT *
FROM students;


-- Display only the name column.

SELECT name
FROM students;



-- ==========================================================
-- ALIAS (AS)
-- ==========================================================

/*
Definition
----------
Alias provides a temporary name to a column or table.

It makes the output easier to read.

Alias exists only for the current query.
It does NOT change the actual column name.
*/


-- Alias using AS

SELECT name AS student_name
FROM students;


SELECT
    name AS student_name,
    age AS student_age,
    branch AS student_branch,
    marks AS student_marks
FROM students;


-- Alias without using AS

SELECT name student_name
FROM students;


SELECT gender student_gender
FROM students;



-- ==========================================================
-- WHERE CLAUSE
-- ==========================================================

/*
Definition
----------
WHERE is used to filter rows based on a condition.

Only rows satisfying the condition are returned.
*/


-- ==========================================================
-- Comparison Operators
-- ==========================================================

/*
=
!=
<
>
<=
>=
*/


-- Male students

SELECT *
FROM students
WHERE gender = 'male';


-- Female students

SELECT *
FROM students
WHERE gender = 'female';


-- Students who are NOT female

SELECT *
FROM students
WHERE gender != 'female';


-- Students who are NOT male

SELECT *
FROM students
WHERE gender != 'male';



-- ==========================================================
-- Filtering by Branch
-- ==========================================================

SELECT *
FROM students
WHERE branch = 'data science';


SELECT *
FROM students
WHERE branch = 'blockchain';


SELECT *
FROM students
WHERE branch = 'devops';


SELECT *
FROM students
WHERE branch = 'cloud';



-- ==========================================================
-- Filtering by Marks
-- ==========================================================

-- Marks greater than or equal to 90

SELECT *
FROM students
WHERE marks >= 90;


-- Marks less than or equal to 40

SELECT *
FROM students
WHERE marks <= 40;



-- ==========================================================
-- Filtering by Age
-- ==========================================================

SELECT *
FROM students
WHERE age = 30;



-- ==========================================================
-- IN and NOT IN
-- ==========================================================

/*
IN is used to match multiple values.

NOT IN excludes multiple values.
*/


-- Students whose id is 2 or 3

SELECT *
FROM students
WHERE id IN (2,3);


-- Students except id 2 and 3

SELECT *
FROM students
WHERE id NOT IN (2,3);



-- ==========================================================
-- BETWEEN and NOT BETWEEN
-- ==========================================================

/*
BETWEEN is inclusive.

It includes both starting and ending values.
*/


-- IDs between 5 and 15

SELECT *
FROM students
WHERE id BETWEEN 5 AND 15;


-- IDs NOT between 50 and 100

SELECT *
FROM students
WHERE id NOT BETWEEN 50 AND 100;


-- Marks between 70 and 90

SELECT *
FROM students
WHERE marks BETWEEN 70 AND 90;



-- ==========================================================
-- AND Operator
-- ==========================================================

/*
AND returns rows only if ALL conditions are TRUE.
*/


-- DevOps students whose age is 20

SELECT *
FROM students
WHERE branch = 'devops'
AND age = 20;



-- ==========================================================
-- OR Operator
-- ==========================================================

/*
OR returns rows if ANY condition is TRUE.
*/


SELECT *
FROM students
WHERE age = 31
OR branch = 'cloud';



-- ==========================================================
-- Multiple Conditions
-- ==========================================================

-- Cloud or Blockchain students whose age is greater than 23

SELECT *
FROM students
WHERE branch IN ('cloud', 'blockchain')
AND age > 23;



-- ==========================================================
-- Example Using Another Table
-- ==========================================================

USE mca;

SELECT *
FROM student;


-- Female students from Data Science branch

SELECT *
FROM student
WHERE branch = 'data science'
AND gender = 'female';



-- Male students from Cloud branch
-- OR
-- Female students from Data Science branch

SELECT *
FROM student
WHERE (gender = 'male' AND branch = 'cloud')
OR (gender = 'female' AND branch = 'data science');



-- ==========================================================
-- LIMIT
-- ==========================================================

/*
LIMIT restricts the number of rows returned.
*/


-- Display first 4 rows

SELECT *
FROM student
LIMIT 4;


-- Skip first 4 rows and display next 10 rows

SELECT *
FROM student
LIMIT 4,10;



-- ==========================================================
-- IMPORTANT NOTES
-- ==========================================================

/*
WHERE
-----
Filters rows.


Comparison Operators

=
!=
<
>
<=
>=


IN
--
Checks multiple values.

Example:

WHERE branch IN ('cloud','devops')


NOT IN
------
Excludes multiple values.

Example:

WHERE branch NOT IN ('cloud','devops')


BETWEEN
-------
Checks a range.

Example:

WHERE marks BETWEEN 60 AND 90


NOT BETWEEN
-----------
Excludes a range.

Example:

WHERE age NOT BETWEEN 18 AND 25


AND
---
All conditions must be TRUE.

Example:

WHERE branch='cloud'
AND gender='male'


OR
--
At least one condition must be TRUE.

Example:

WHERE branch='cloud'
OR branch='devops'


LIMIT
-----
Restricts the number of rows returned.

LIMIT 5

Returns first 5 rows.

LIMIT 5,10

Skips first 5 rows and returns next 10 rows.
*/



-- ==========================================================
-- SQL EXECUTION ORDER
-- ==========================================================

/*
SQL Execution Order

1. FROM
2. WHERE
3. SELECT
4. ORDER BY
5. LIMIT
*/



-- ==========================================================
-- INTERVIEW TIPS
-- ==========================================================

/*
SELECT
-------
Retrieves data.

WHERE
------
Filters rows.

AS
--
Gives a temporary name.

IN
--
Checks multiple values.

BETWEEN
-------
Checks a range (inclusive).

AND
---
All conditions must be true.

OR
--
Any one condition can be true.

LIMIT
-----
Restricts the number of output rows.
*/




select * from students;

select * from students where gender = "male";

select *  from students where branch = "cloud";

select * from student where age<20;


select * from students where id in (2,3);

select * from students where branch in ("blockchain" , "data science");

select * from students where id not in (2,3);

use mca;

select * from student where branch ="cloud" and gender="male";

select * from student where gender = "male" and marks<60;

select *  from student where branch in ("devops","cloud") and gender = "male";

# cs male or it female

select * from student where (branch = "data science" and gender = "male") or (branch = "cloud" and gender = "female");