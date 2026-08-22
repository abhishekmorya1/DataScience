USE mca;

==========================================================
--                SQL AGGREGATE FUNCTIONS
-- ==========================================================

/*
Aggregate Functions
-------------------
Aggregate functions perform calculations on multiple rows
and return a single value.

Functions:
1. MAX()   -> Returns the highest value.
2. MIN()   -> Returns the lowest value.
3. AVG()   -> Returns the average value.
4. SUM()   -> Returns the total sum.
5. COUNT() -> Counts rows.
*/

SELECT * FROM student;

-- ==========================================================
-- MAX()
-- ==========================================================

-- Find the highest marks.

SELECT MAX(marks) AS highest_marks
FROM student;

-- Find the maximum age.

SELECT MAX(age) AS maximum_age
FROM student;

-- Highest marks among Female students.

SELECT MAX(marks) AS highest_marks
FROM student
WHERE gender = 'female';

-- Maximum age in Cloud branch.

SELECT MAX(age) AS maximum_age
FROM student
WHERE branch = 'cloud';



-- ==========================================================
-- MIN()
-- ==========================================================

-- Find the minimum age.

SELECT MIN(age) AS minimum_age
FROM student;

-- Lowest marks among Male students.

SELECT MIN(marks) AS lowest_marks
FROM student
WHERE gender = 'male';

-- Minimum age in Cybersecurity branch.

SELECT MIN(age) AS minimum_age
FROM student
WHERE branch = 'cybersecurity';



-- ==========================================================
-- AVG()
-- ==========================================================

-- Find average marks.

SELECT AVG(marks) AS average_marks
FROM student;



-- ==========================================================
-- SUM()
-- ==========================================================

-- Find total marks.

SELECT SUM(marks) AS total_marks
FROM student;



-- ==========================================================
-- COUNT()
-- ==========================================================

-- Count non-NULL values of marks column.

SELECT COUNT(marks) AS total_marks_entries
FROM student;

-- Count total rows.

SELECT COUNT(*) AS total_students
FROM student;



-- ==========================================================
-- DISTINCT
-- ==========================================================

/*
DISTINCT removes duplicate values from the result.

UNIQUE is a constraint.
DISTINCT is used while retrieving data.
*/

-- Display unique branches.

SELECT DISTINCT branch
FROM student;

-- Count unique branches.

SELECT COUNT(DISTINCT branch) AS total_branches
FROM student;

-- Display unique names.

SELECT DISTINCT name
FROM student;

-- Count unique names.

SELECT COUNT(DISTINCT name) AS unique_names
FROM student;



-- ==========================================================
-- GROUP BY
-- ==========================================================

/*
Definition
----------
GROUP BY groups rows having the same values into one group
so that aggregate functions can be applied to each group.

Common Aggregate Functions:
COUNT()
SUM()
AVG()
MAX()
MIN()
*/

-- Count students by gender.

SELECT gender,
       COUNT(*) AS total_students
FROM student
GROUP BY gender;


-- Count students by branch and gender.

SELECT branch,
       gender,
       COUNT(*) AS total_students
FROM student
GROUP BY branch, gender;


-- Count students for each age.

SELECT age,
       COUNT(*) AS total_students
FROM student
GROUP BY age;


-- Highest marks in each branch.

SELECT branch,
       MAX(marks) AS highest_marks
FROM student
GROUP BY branch;


-- Count students only in Cybersecurity and Cloud branches.

SELECT branch,
       COUNT(*) AS total_students
FROM student
WHERE branch IN ('cybersecurity', 'cloud')
GROUP BY branch;



-- ==========================================================
-- HAVING
-- ==========================================================

/*
HAVING filters groups after GROUP BY.

WHERE  -> Filters rows.
HAVING -> Filters groups.
*/

-- Display branches having more than 41 students.

SELECT branch,
       COUNT(*) AS total_students
FROM student
GROUP BY branch
HAVING COUNT(*) > 41;


-- Ignore Cybersecurity branch.

SELECT branch,
       COUNT(*) AS total_students
FROM student
WHERE branch != 'cybersecurity'
GROUP BY branch
HAVING COUNT(*) > 41;


-- Ignore multiple branches.

SELECT branch,
       COUNT(*) AS total_students
FROM student
WHERE branch NOT IN ('cybersecurity', 'cloud')
GROUP BY branch
HAVING COUNT(*) > 14;



-- ==========================================================
-- ORDER BY
-- ==========================================================

/*
ORDER BY sorts the result.

ASC  -> Ascending (Default)
DESC -> Descending
*/

-- Sort by name.

SELECT *
FROM student
ORDER BY name;


-- Sort by marks.

SELECT *
FROM student
ORDER BY marks;


-- Sort by marks in descending order.

SELECT *
FROM student
ORDER BY marks DESC;


-- Sort by age (ascending) and marks (descending).

SELECT *
FROM student
ORDER BY age,
         marks DESC;



-- ==========================================================
-- LIMIT
-- ==========================================================

/*
LIMIT restricts the number of rows returned.
*/

SELECT branch,
       COUNT(*) AS total_students
FROM student
WHERE branch != 'blockchain'
GROUP BY branch
HAVING COUNT(*) > 40
ORDER BY total_students DESC
LIMIT 4;



-- ==========================================================
-- SQL EXECUTION ORDER
-- ==========================================================

/*
SQL executes queries in this order:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT
*/



-- ==========================================================
-- IMPORTANT NOTES
-- ==========================================================

/*
WHERE
-----
Filters individual rows before grouping.

Example:
WHERE marks > 60


GROUP BY
--------
Creates groups of similar values.

Example:
GROUP BY branch


HAVING
------
Filters groups after aggregation.

Example:
HAVING COUNT(*) > 10

HAVING AVG(marks) > 70

HAVING MAX(marks) > 90


ORDER BY
--------
Sorts the final result.

Example:
ORDER BY marks DESC


LIMIT
-----
Returns only the required number of rows.

Example:
LIMIT 5
*/



-- ==========================================================
-- REMEMBER THIS ORDER
-- ==========================================================

/*
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT


Execution Order:

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
*/
USE mca;

-- ==========================================================
--                      LIKE OPERATOR
-- ==========================================================

/*
Definition
----------
The LIKE operator is used to search for a specific pattern
in a column.

Wildcards used with LIKE:

%  -> Represents zero or more characters.

_  -> Represents exactly one character.
*/


-- ==========================================================
-- Names Starting With a Particular Letter
-- ==========================================================

-- Names starting with 'A'

SELECT *
FROM student
WHERE name LIKE 'a%';


-- Names starting with 'Abhi'

SELECT *
FROM student
WHERE name LIKE 'abhi%';


-- Names NOT starting with 'A'

SELECT *
FROM student
WHERE name NOT LIKE 'a%';



-- ==========================================================
-- Names Ending With a Particular Letter
-- ==========================================================

-- Names ending with 'i'

SELECT *
FROM student
WHERE name LIKE '%i';



-- ==========================================================
-- LIKE with Numeric Values
-- ==========================================================

/*
LIKE can also be used with numeric columns.

Example:
Marks starting with 9
(90, 91, 92, 95, 99...)
*/

SELECT *
FROM student
WHERE marks LIKE '9%';



-- ==========================================================
-- Names Starting and Ending With Specific Letters
-- ==========================================================

-- Starts with P and ends with A

SELECT *
FROM student
WHERE name LIKE 'p%'
AND name LIKE '%a';


-- Starts with A OR ends with I

SELECT *
FROM student
WHERE name LIKE 'a%'
OR name LIKE '%i';


-- Starts with P AND starts with I

/*
Impossible condition.

A name cannot start with both P and I
at the same time.

Result: No rows
*/

SELECT *
FROM student
WHERE name LIKE 'p%'
AND name LIKE 'i%';


-- Starts with P OR starts with A

SELECT *
FROM student
WHERE name LIKE 'p%'
OR name LIKE 'a%';



-- ==========================================================
-- Underscore (_) Wildcard
-- ==========================================================

/*
_ represents exactly ONE character.
*/


-- Second letter is 'a'

-- Example:
-- Rahul
-- Pawan
-- Karan

SELECT *
FROM student
WHERE name LIKE '_a%';


-- Second letter is 'i'

-- Example:
-- Nitin
-- Ritesh

SELECT *
FROM student
WHERE name LIKE '_i%';



-- ==========================================================
-- Second Last Character
-- ==========================================================

-- Second last character is 'a'

-- Example:
-- Kamal
-- Payal

SELECT *
FROM student
WHERE name LIKE '%a_';



-- ==========================================================
-- Character at Third Position
-- ==========================================================

-- Third character is 'a'

-- Example:
-- Aman
-- Rajat

SELECT *
FROM student
WHERE name LIKE '__a%';



-- ==========================================================
-- Character at Third Position From Last
-- ==========================================================

-- Third character from last is 'a'

-- Example:
-- Abhay
-- Rakesh

SELECT *
FROM student
WHERE name LIKE '%a__';



-- ==========================================================
-- Difference Between % and _
-- ==========================================================

/*
%  -> Zero or more characters

Examples

'A%'
'Amit'
'Ankit'
'Abhishek'


_  -> Exactly one character

Examples

'_a%'
Rahul
Karan

Not Match:
Aman
Abhishek
*/



-- ==========================================================
-- Important Notes
-- ==========================================================

/*
LIKE Patterns

'a%'     -> Starts with 'a'

'%a'     -> Ends with 'a'

'%a%'    -> Contains 'a'

'_a%'    -> Second character is 'a'

'__a%'   -> Third character is 'a'

'%a_'    -> Second last character is 'a'

'%a__'   -> Third character from last is 'a'
*/



-- ==========================================================
-- Common Interview Questions
-- ==========================================================

-- Names containing the letter 'a'

SELECT *
FROM student
WHERE name LIKE '%a%';


-- Names containing the word "sh"

SELECT *
FROM student
WHERE name LIKE '%sh%';


-- Names ending with "sh"

SELECT *
FROM student
WHERE name LIKE '%an';


-- Names starting with "ra"

SELECT *
FROM student
WHERE name LIKE 'ra%';


-- Names having exactly four letters

SELECT *
FROM student
WHERE name LIKE '____';


-- Names having exactly five letters

SELECT *
FROM student
WHERE name LIKE '_____';



-- ==========================================================
-- Limitation of LIKE
-- ==========================================================

/*
If you want to search using multiple patterns,
LIKE becomes lengthy.

Example:

WHERE name LIKE 'a%'
OR name LIKE 'b%'
OR name LIKE 'c%'
OR name LIKE 'd%'

For more complex pattern matching,
SQL provides REGEXP (Regular Expressions),
which is more powerful and flexible.
*/