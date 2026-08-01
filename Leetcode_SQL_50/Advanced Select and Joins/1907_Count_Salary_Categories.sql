-- ==========================================================
-- Problem      : Count Salary Categories
-- LeetCode ID  : 1907
-- Difficulty   : Medium
-- Category     : Basic Aggregate Functions
-- Pattern      : CASE WHEN + UNION ALL
-- Concepts     : CASE WHEN, COUNT(), UNION ALL
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Categorize accounts into three salary groups:

1. Low Salary      : income < 20000
2. Average Salary  : 20000 <= income <= 50000
3. High Salary     : income > 50000

Return every category along with the number of accounts
belonging to it.

Even if a category has zero accounts, it must still appear
in the output.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Accounts
--------
account_id   INT
income       INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
Since every category must appear even if its count is zero,
write one query for each category.

1. Count Low Salary accounts.
2. Count Average Salary accounts.
3. Count High Salary accounts.
4. Combine the results using UNION ALL.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    'Low Salary' AS category,
    COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION ALL

SELECT
    'Average Salary',
    COUNT(*)
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION ALL

SELECT
    'High Salary',
    COUNT(*)
FROM Accounts
WHERE income > 50000;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• The first query counts accounts with income < 20000.
• The second query counts accounts with income between
  20000 and 50000 (inclusive).
• The third query counts accounts with income > 50000.
• UNION ALL combines all three rows.
• COUNT(*) returns 0 when no rows match, ensuring every
  category appears in the result.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Fixed Categories using UNION ALL

General Pattern:

SELECT 'Category1', COUNT(*)
FROM table
WHERE condition1

UNION ALL

SELECT 'Category2', COUNT(*)
FROM table
WHERE condition2

UNION ALL

SELECT 'Category3', COUNT(*)
FROM table
WHERE condition3;

Common Interview Questions:

✓ Salary Categories
✓ Age Groups
✓ Grade Distribution
✓ Risk Levels
✓ Customer Segments
✓ Income Classification

Remember:

CASE WHEN groups only existing rows.

If categories with zero records must still appear,
UNION ALL is often the simplest solution.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
