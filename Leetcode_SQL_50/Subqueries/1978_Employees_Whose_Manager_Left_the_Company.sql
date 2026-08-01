-- ==========================================================
-- Problem      : Employees Whose Manager Left the Company
-- LeetCode ID  : 1978
-- Difficulty   : Easy
-- Category     : Basic Subqueries
-- Pattern      : NOT IN + Filtering
-- Concepts     : WHERE, NOT IN, Subquery, ORDER BY
-- Time         : O(n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
Find the IDs of employees whose:

1. Salary is less than 30000.
2. Manager has left the company
   (manager_id does not exist as an employee_id).

Return the employee IDs in ascending order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employees
---------
employee_id    INT
name           VARCHAR
manager_id     INT
salary         INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Filter employees whose salary is less than 30000.
2. Ignore employees without a manager (manager_id IS NULL).
3. Check whether manager_id is absent from employee_id.
4. Sort the result by employee_id.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
        SELECT employee_id
        FROM Employees
  )
ORDER BY employee_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• salary < 30000 selects low-salary employees.
• manager_id IS NOT NULL ignores employees
  who do not have a manager.
• NOT IN checks whether the manager's ID
  does not exist in the Employees table,
  meaning the manager has left the company.
• ORDER BY sorts employee IDs in ascending order.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Find Missing References

General Pattern:

SELECT columns
FROM table
WHERE foreign_key NOT IN (
    SELECT primary_key
    FROM table
);

Common Interview Questions:

✓ Employees whose manager left
✓ Orders with missing customers
✓ Products without categories
✓ Students without departments
✓ Invalid foreign key references

Remember:

NOT IN
→ Finds values that do not exist
  in another set.

Always handle NULL values carefully
when using NOT IN.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(n)
*/
