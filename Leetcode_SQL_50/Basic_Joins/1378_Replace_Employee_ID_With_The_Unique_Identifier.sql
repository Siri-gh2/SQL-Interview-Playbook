-- ==========================================================
-- Problem      : Replace Employee ID With The Unique Identifier
-- LeetCode ID  : 1378
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : LEFT JOIN
-- Concepts     : JOIN, LEFT JOIN, NULL Handling
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Write a solution to show the unique ID of each employee.

If an employee does not have a unique ID, return NULL.

Return the result table in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employees
---------
id      INT
name    VARCHAR

EmployeeUNI
-----------
id          INT
unique_id   INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Start with the Employees table because every employee
   must appear in the result.
2. LEFT JOIN EmployeeUNI using the employee ID.
3. Retrieve:
      - unique_id
      - employee name
4. If an employee has no matching unique ID,
   LEFT JOIN automatically returns NULL.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    eu.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• LEFT JOIN keeps all rows from the Employees table.
• Matching unique IDs are fetched from EmployeeUNI.
• If no match exists, unique_id becomes NULL.
• This satisfies the problem requirement to include
  every employee.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use LEFT JOIN whenever you need:

✓ All records from the left table
✓ Matching records from the right table
✓ NULL for missing matches

General Pattern:

SELECT columns
FROM Table1 t1
LEFT JOIN Table2 t2
ON t1.key = t2.key;

Remember:

INNER JOIN → Only matching rows
LEFT JOIN  → All left rows + matching right rows
RIGHT JOIN → All right rows + matching left rows
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
