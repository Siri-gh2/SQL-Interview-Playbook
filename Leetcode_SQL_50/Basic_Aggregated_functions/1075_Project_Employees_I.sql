-- ==========================================================
-- Problem      : Project Employees I
-- LeetCode ID  : 1075
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : JOIN + GROUP BY + AVG()
-- Concepts     : JOIN, GROUP BY, AVG(), ROUND()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For each project, calculate the average experience
years of all employees working on that project.

Round the average to 2 decimal places.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Project
-------
project_id   INT
employee_id  INT

Employee
--------
employee_id       INT
name              VARCHAR
experience_years  INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. JOIN Project and Employee tables using employee_id.
2. GROUP BY project_id.
3. Compute the average experience of employees
   in each project.
4. ROUND the result to 2 decimal places.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• JOIN matches each project with its employees.
• AVG(experience_years) computes the average
  experience for every project.
• GROUP BY project_id ensures one result
  per project.
• ROUND(...,2) formats the answer to
  two decimal places.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use JOIN + GROUP BY + AVG() whenever an aggregate
needs to be calculated across related tables.

General Pattern:

SELECT
    grouping_column,
    AVG(value_column)
FROM Table1
JOIN Table2
ON Table1.key = Table2.key
GROUP BY grouping_column;

Common Interview Questions:

✓ Average Salary by Department
✓ Average Experience by Project
✓ Average Rating by Product
✓ Average Marks by Class
✓ Average Price by Category

Remember:

AVG() ignores NULL values automatically.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
