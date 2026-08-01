-- ==========================================================
-- Problem      : Biggest Single Number
-- LeetCode ID  : 619
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + HAVING + MAX()
-- Concepts     : GROUP BY, HAVING, COUNT(), MAX()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
A single number is a number that appears exactly once
in the table.

Find the largest single number.

If no single number exists, return NULL.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
MyNumbers
---------
num    INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. GROUP BY each number.
2. Keep only numbers appearing exactly once
   using HAVING COUNT(*) = 1.
3. Find the maximum among those numbers.
4. If no such number exists, MAX() returns NULL.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    MAX(num) AS num
FROM (
    SELECT
        num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS single_numbers;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• GROUP BY creates one group for each distinct number.
• HAVING COUNT(*) = 1 keeps only numbers that occur once.
• MAX(num) selects the largest among those numbers.
• If no single numbers exist, MAX() automatically
  returns NULL.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Find Unique Values + Aggregate

General Pattern:

SELECT AGGREGATE(column)
FROM (
    SELECT column
    FROM table
    GROUP BY column
    HAVING COUNT(*) = 1
) AS t;

Common Interview Questions:

✓ Biggest Single Number
✓ Most Expensive Unique Product
✓ Highest Salary with Unique Value
✓ Unique Customer IDs
✓ Non-Repeating Elements

Remember:

GROUP BY
→ Forms groups.

HAVING COUNT(*) = 1
→ Keeps only unique values.

MAX()
→ Finds the largest remaining value.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(n)
*/
