-- ==========================================================
-- Problem      : Second Highest Salary
-- LeetCode ID  : 176
-- Difficulty   : Medium
-- Category     : Subqueries
-- Pattern      : DISTINCT + ORDER BY + LIMIT + OFFSET
-- Concepts     : DISTINCT, ORDER BY, LIMIT, OFFSET, IFNULL()
-- Time         : O(n log n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the second highest distinct salary.

If there is no second highest salary,
return NULL.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employee
--------
id      INT
salary  INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Remove duplicate salaries using DISTINCT.
2. Sort salaries in descending order.
3. Skip the highest salary using OFFSET 1.
4. Fetch the next salary using LIMIT 1.
5. If no second highest salary exists,
   return NULL.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET 1
    ) AS SecondHighestSalary;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
Example:

Employee

id   salary
------------
1    100
2    200
3    300
4    300

DISTINCT salary

300
200
100

OFFSET 1 skips:

300

LIMIT 1 returns:

200

If only one distinct salary exists,
the subquery returns NULL automatically.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Nth Highest Value

General Pattern:

SELECT DISTINCT column
FROM table
ORDER BY column DESC
LIMIT 1 OFFSET N-1;

Examples:

Highest Salary
LIMIT 1 OFFSET 0

Second Highest Salary
LIMIT 1 OFFSET 1

Third Highest Salary
LIMIT 1 OFFSET 2

Common Interview Questions:

✓ Second Highest Salary
✓ Third Highest Salary
✓ Top N Salaries
✓ Highest Product Price
✓ Nth Largest Value

Remember:

DISTINCT
→ Removes duplicate values.

OFFSET
→ Skips rows.

LIMIT
→ Returns the required row.

If no row exists,
SQL returns NULL.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n log n)
(due to sorting)

Space Complexity: O(1)
*/
