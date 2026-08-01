-- ==========================================================
-- Problem      : Patients With a Condition
-- LeetCode ID  : 1527
-- Difficulty   : Easy
-- Category     : String Functions
-- Pattern      : LIKE + String Matching
-- Concepts     : LIKE, CONCAT(), WHERE
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the patients who have Type I Diabetes.

A patient has Type I Diabetes if the condition string
contains the code 'DIAB1' as a separate condition.

The code may appear:
- at the beginning of the string, or
- after a space.

Return all columns of such patients.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Patients
--------
patient_id     INT
patient_name   VARCHAR
conditions     VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
A patient qualifies if:

1. conditions starts with 'DIAB1'
OR
2. conditions contains ' DIAB1'
   (preceded by a space)

Use LIKE to check both cases.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';

-- ==========================================================
-- Explanation
-- ==========================================================

/*
Examples:

'DIAB100 MYOP'
✓ Starts with DIAB1

'ASTHMA DIAB100'
✓ Contains ' DIAB1'

'DIAB2'
✗ Not Type I Diabetes

'XDIAB100'
✗ DIAB1 is not a separate condition code

LIKE Patterns:

'DIAB1%'
→ Starts with DIAB1

'% DIAB1%'
→ DIAB1 appears after a space
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Pattern Matching using LIKE

General Pattern:

WHERE column LIKE 'text%'

WHERE column LIKE '%text'

WHERE column LIKE '%text%'

Common Interview Questions:

✓ Search Prefix
✓ Search Suffix
✓ Keyword Search
✓ Disease Codes
✓ Product Codes
✓ Email Domains

Remember:

%
→ Any number of characters

_
→ Exactly one character

Use LIKE for simple pattern matching.

Use REGEXP for more advanced matching.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
