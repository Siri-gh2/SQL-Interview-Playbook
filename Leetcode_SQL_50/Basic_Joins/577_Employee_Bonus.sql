-- ==========================================================
-- Problem      : Employee Bonus
-- LeetCode ID  : 577
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : LEFT JOIN + NULL Handling
-- Concepts     : LEFT JOIN, WHERE, IS NULL, Filtering
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Report the name and bonus amount of each employee whose
bonus is less than 1000.

Employees who have not received a bonus should also be
included in the result.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employee
--------
empId      INT
name       VARCHAR
supervisor INT
salary     INT

Bonus
-----
empId      INT
bonus      INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Start with the Employee table since every employee
   should be considered.
2. LEFT JOIN the Bonus table using empId.
3. Keep employees whose:
      - bonus < 1000, OR
      - bonus is NULL (no bonus assigned).
4. Return the employee's name and bonus.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• LEFT JOIN ensures every employee appears in the result.
• Employees without a bonus receive NULL after the join.
• WHERE bonus < 1000 selects employees with small bonuses.
• OR bonus IS NULL includes employees with no bonus.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use LEFT JOIN when all rows from the left table
must be preserved.

General Pattern:

SELECT ...
FROM Table1 t1
LEFT JOIN Table2 t2
ON t1.id = t2.id
WHERE t2.column < value
   OR t2.column IS NULL;

Common Interview Questions:

✓ Employees without bonuses
✓ Customers without orders
✓ Students without enrollments
✓ Products without sales
✓ Visits without transactions
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
