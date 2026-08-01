-- ==========================================================
-- Problem      : Find Customer Referee
-- LeetCode ID  : 584
-- Difficulty   : Easy
-- Category     : SELECT
-- Pattern      : WHERE + NULL Handling
-- Concepts     : SELECT, WHERE, IS NULL, OR
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the names of customers who were not referred by the customer
with id = 2.

Return the result table in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Customer
--------
id          INT
name        VARCHAR
referee_id  INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Select the customer's name.
2. Keep customers whose:
      - referee_id is not equal to 2, OR
      - referee_id is NULL (no referee).
3. Return the names.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT name
FROM Customer
WHERE referee_id <> 2
   OR referee_id IS NULL;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SELECT retrieves the customer's name.
• referee_id <> 2 excludes customers referred by customer 2.
• referee_id IS NULL includes customers who have no referee.
• NULL must be checked using IS NULL because comparisons
  with NULL (e.g., = NULL or <> NULL) always return UNKNOWN.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Whenever a column can contain NULL values:

❌ Incorrect:
WHERE referee_id <> 2

This excludes NULL values because NULL is not equal to
anything, not even another NULL.

✅ Correct:
WHERE referee_id <> 2
   OR referee_id IS NULL

Common NULL operations:

WHERE column IS NULL
WHERE column IS NOT NULL
IFNULL(column, default_value)
COALESCE(column1, column2, ...)
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
