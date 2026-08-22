USE mca;

-- ==========================================================
--                 SQL PRACTICE - AGGREGATE FUNCTIONS
-- ==========================================================

/*
Aggregate Functions
-------------------
Aggregate functions perform calculations on multiple rows
and return a single value.

Functions:

MAX()   -> Returns the highest value.
MIN()   -> Returns the lowest value.
AVG()   -> Returns the average value.
SUM()   -> Returns the total sum.
COUNT() -> Counts rows.
*/


-- ==========================================================
-- LEVEL 1 (EASY)
-- ==========================================================


-- Display all students.

SELECT *
FROM student;


-- Display only the name and marks columns.

SELECT name, marks
FROM student;


-- Find the maximum marks.

SELECT MAX(marks)
FROM student;


-- Find the minimum age.

SELECT MIN(age)
FROM student;


-- Find the average marks.

SELECT AVG(marks)
FROM student;


-- Find the total marks of all students.

SELECT SUM(marks)
FROM student;


-- Count the total number of students.

SELECT COUNT(*)
FROM student;


-- Count the number of unique branches.

SELECT COUNT(DISTINCT branch)
FROM student;



-- ==========================================================
-- LEVEL 2 (WHERE + AGGREGATE FUNCTIONS)
-- ==========================================================

/*
WHERE filters rows before applying
aggregate functions.
*/


-- Find the highest marks among Male students.

SELECT MAX(marks)
FROM student
WHERE gender = "male";


-- Find the lowest marks among Female students.

SELECT MIN(marks)
FROM student
WHERE gender = "female";


-- Find the average marks of students in the Cloud branch.

SELECT AVG(marks)
FROM student
WHERE branch = "cloud";


-- Count the students whose marks are greater than 80.

SELECT COUNT(*)
FROM student
WHERE marks > 80;


-- Find the total marks of students whose age is greater than 22.

SELECT SUM(marks)
FROM student
WHERE age > 22;


-- Find the maximum age of students in the DevOps branch.

SELECT MAX(age)
FROM student
WHERE branch = "devops";


-- Count students whose branch is either Cloud or DevOps.

SELECT COUNT(*)
FROM student
WHERE branch = "cloud"
OR branch = "devops";



-- ==========================================================
-- LEVEL 3 (GROUP BY)
-- ==========================================================

/*
GROUP BY groups rows having the same value
so aggregate functions can be applied
to each group separately.
*/


-- Count students in each branch.

SELECT branch,
       COUNT(*)
FROM student
GROUP BY branch;


-- Count male and female students separately.

SELECT gender,
       COUNT(*)
FROM student
GROUP BY gender;


-- Find the highest marks in each branch.

SELECT branch,
       MAX(marks)
FROM student
GROUP BY branch;


-- Find the lowest marks in each branch.

SELECT branch,
       MIN(marks)
FROM student
GROUP BY branch;


-- Find the average marks in each branch.

SELECT branch,
       AVG(marks)
FROM student
GROUP BY branch;


-- Find the total marks in each branch.

SELECT branch,
       SUM(marks)
FROM student
GROUP BY branch;


-- Find the number of students for each age.

SELECT age,
       COUNT(*)
FROM student
GROUP BY age;


-- Find the average marks of Male and Female students separately.

SELECT gender,
       AVG(marks)
FROM student
GROUP BY gender;



-- ==========================================================
-- LEVEL 4 (GROUP BY + WHERE)
-- ==========================================================

/*
Execution Order

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
*/


-- Count students in Cloud and DevOps branches only.

SELECT branch,
       COUNT(*)
FROM student
WHERE branch IN ("cloud", "devops")
GROUP BY branch;


-- Find the average marks of students
-- whose marks are greater than 60,
-- grouped by branch.

SELECT branch,
       AVG(marks) AS average_marks
FROM student
WHERE marks > 60
GROUP BY branch;


-- Find the highest marks of students
-- whose age is greater than 22,
-- grouped by branch.

SELECT branch,
       MAX(marks) AS highest_marks
FROM student
WHERE age > 22
GROUP BY branch;


-- Count Female students in each branch.

SELECT branch,
       COUNT(*)
FROM student
WHERE gender = "female"
GROUP BY branch;


-- Find the total marks of Male students
-- in each branch.

SELECT branch,
       SUM(marks)
FROM student
WHERE gender = "male"
GROUP BY branch;



-- ==========================================================
-- IMPORTANT NOTES
-- ==========================================================

/*
MAX()
------
Returns the highest value.

Example:
MAX(marks)



MIN()
------
Returns the lowest value.

Example:
MIN(age)



AVG()
------
Returns the average value.

Example:
AVG(marks)



SUM()
------
Returns the total value.

Example:
SUM(marks)



COUNT()
--------
Counts rows.

COUNT(*)
Counts all rows.

COUNT(column_name)
Counts only non-NULL values.

COUNT(DISTINCT column_name)
Counts unique values only.



WHERE
------
Filters individual rows
before grouping or aggregation.



GROUP BY
---------
Creates groups based on
common values.

Example:

GROUP BY branch

Each branch becomes one group.



Execution Order

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
*/



-- ==========================================================
-- INTERVIEW TIPS
-- ==========================================================

/*
Question contains:

"Highest"
Use MAX()

"Lowest"
Use MIN()

"Average"
Use AVG()

"Total"
Use SUM()

"Count"
Use COUNT()

"In each branch"
Use GROUP BY

"Whose marks..."
Use WHERE

"Groups having..."
Use HAVING
*/