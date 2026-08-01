-- ==========================================================
-- Problem      : The Number of Employees Which Report to Each Employee
-- LeetCode ID  : 1731
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : SELF JOIN + GROUP BY + AVG()
-- Concepts     : SELF JOIN, GROUP BY, COUNT(), AVG(), ROUND()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For every employee who has at least one direct report,
return:

- employee_id
- name
- reports_count
- average_age (rounded down to the nearest integer)

Order the result by employee_id.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employees
---------
employee_id   INT
name          VARCHAR
reports_to    INT
age           INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. SELF JOIN the Employees table.
2. Match each employee with their manager using:
      employee.reports_to = manager.employee_id
3. GROUP BY the manager.
4. COUNT the number of direct reports.
5. Compute the average age of the direct reports.
6. Round the average age to the nearest integer.
7. Sort by employee_id.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age), 0) AS average_age
FROM Employees e
JOIN Employees m
ON e.reports_to = m.employee_id
GROUP BY
    m.employee_id,
    m.name
ORDER BY m.employee_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SELF JOIN links each employee to their manager.
• GROUP BY creates one group for each manager.
• COUNT(employee_id) counts the number of direct reports.
• AVG(age) calculates the average age of the reports.
• ROUND(...,0) rounds the average age to the nearest integer.
• ORDER BY employee_id sorts the final output.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: SELF JOIN + GROUP BY + Aggregate

General Pattern:

SELECT
    manager.id,
    COUNT(employee.id),
    AVG(employee.column)
FROM Employee employee
JOIN Employee manager
ON employee.manager_id = manager.id
GROUP BY manager.id;

Common Interview Questions:

✓ Manager and Employee Hierarchy
✓ Reports per Manager
✓ Average Salary of Team
✓ Average Age of Team
✓ Team Size Analysis

Remember:

SELF JOIN
→ Used when rows in the same table are related.

GROUP BY
→ Creates one group per manager.

COUNT()
→ Counts direct reports.

AVG()
→ Computes statistics for each manager's team.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
