USE mca;

-- ==========================================================
--                 REGULAR EXPRESSIONS (REGEXP)
-- ==========================================================

/*
Definition
----------
REGEXP (Regular Expression) is used for advanced pattern matching.

It is more powerful than the LIKE operator.

Common Meta Characters

^      -> Beginning of a string
$      -> End of a string
.      -> Matches exactly one character
[]     -> Matches any one character inside brackets
[^]    -> Matches any character except those inside brackets
[a-z]  -> Matches any lowercase letter from a to z
[0-9]  -> Matches any digit from 0 to 9
{n}    -> Matches exactly n occurrences
|      -> OR operator
*/


-- ==========================================================
-- NAMES STARTING WITH A PARTICULAR LETTER
-- ==========================================================

-- Names starting with C

SELECT *
FROM student
WHERE name REGEXP "^[c]";



-- ==========================================================
-- NAMES ENDING WITH A PARTICULAR LETTER
-- ==========================================================

-- Names ending with K

SELECT *
FROM student
WHERE name REGEXP "[k]$";



-- ==========================================================
-- EXCLUDING FIRST LETTER
-- ==========================================================

-- Names NOT starting with A

SELECT *
FROM student
WHERE name NOT REGEXP "^[a]";


-- Another way

SELECT *
FROM student
WHERE name REGEXP "^[^a]";


-- Names starting ONLY with A

SELECT *
FROM student
WHERE name NOT REGEXP "^[^a]";



-- ==========================================================
-- EXCLUDING LAST LETTER
-- ==========================================================

-- Names NOT ending with A

SELECT *
FROM student
WHERE name NOT REGEXP "[a]$";


-- Another way

SELECT *
FROM student
WHERE name REGEXP "[^a]$";



-- ==========================================================
-- MULTIPLE STARTING LETTERS
-- ==========================================================

-- Names starting with A, P or T

SELECT *
FROM student
WHERE name REGEXP "^[apt]";



-- ==========================================================
-- CHARACTER RANGE
-- ==========================================================

-- Names starting from A to E

SELECT *
FROM student
WHERE name REGEXP "^[a-e]";



-- ==========================================================
-- STARTING WITH A PARTICULAR WORD
-- ==========================================================

-- Names starting with "ar"

SELECT *
FROM student
WHERE name REGEXP "^[a][r]";



-- ==========================================================
-- MULTIPLE CHARACTER COMBINATIONS
-- ==========================================================

-- Starts with P
-- Second letter is R or A

SELECT *
FROM student
WHERE name REGEXP "^[p][ra]";


-- Starts with P or T
-- Second letter is R or A

SELECT *
FROM student
WHERE name REGEXP "^[pt][ra]";



-- ==========================================================
-- FIXED NUMBER OF CHARACTERS
-- ==========================================================

-- Starts with P
-- Ends with A
-- Exactly 10 characters between them

SELECT *
FROM student
WHERE name REGEXP "^[p]..........[a]$";


-- Same query using {9}

SELECT *
FROM student
WHERE name REGEXP "^[p].{9}[a]$";



-- ==========================================================
-- USING OR
-- ==========================================================

-- Starts with A OR P

SELECT *
FROM student
WHERE name REGEXP "^[a|p]";



-- ==========================================================
-- FIXED LENGTH
-- ==========================================================

-- Starts with A
-- Followed by exactly 3 more characters

SELECT *
FROM student
WHERE name REGEXP "^[a].{3}";



-- ==========================================================
-- IMPORTANT NOTES
-- ==========================================================

/*
^
Matches the beginning of a string.

Example:
^a
Starts with 'a'.


$
Matches the end of a string.

Example:
a$
Ends with 'a'.


.
Matches exactly one character.

Example:
a.c

Matches:
abc
axc
a9c


[]
Matches any one character inside brackets.

Example:
^[abc]

Starts with:
a
b
c


[^]
Matches any character except those inside brackets.

Example:
^[^abc]

Starts with anything except:
a
b
c


[a-z]
Matches any lowercase letter.

Example:
^[a-z]


[0-9]
Matches any numeric digit.

Example:
^[0-9]


{n}
Matches exactly n characters.

Example:
.{5}


|
Represents OR.

Example:
(a|p)

Matches:
a
or
p
*/



-- ==========================================================
-- REGEXP vs LIKE
-- ==========================================================

/*
LIKE
-----

Simple pattern matching.

Examples

LIKE 'a%'

LIKE '%a'

LIKE '_a%'



REGEXP
-------

Advanced pattern matching.

Examples

REGEXP '^a'

REGEXP 'a$'

REGEXP '^[abc]'

REGEXP '^[a-z]'

REGEXP '^a.{3}'
*/