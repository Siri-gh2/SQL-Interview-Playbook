-- ==========================================================
-- Problem      : Managers with at Least 5 Direct Reports
-- LeetCode ID  : 570
-- Difficulty   : Medium
-- Category     : Basic Joins
-- Pattern      : SELF JOIN + GROUP BY + HAVING
-- Concepts     : SELF JOIN, GROUP BY, HAVING, COUNT()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the names of managers who have at least five
employees reporting directly to them.

Return the result table in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employee
--------
id          INT
name        VARCHAR
department  VARCHAR
managerId   INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. SELF JOIN the Employee table.
2. Match each employee with their manager using:
      employee.managerId = manager.id
3. GROUP BY the manager.
4. COUNT the number of direct reports.
5. Return managers having at least 5 direct reports.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    m.name
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
GROUP BY
    m.id,
    m.name
HAVING COUNT(e.id) >= 5;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SELF JOIN pairs each employee with their manager.
• GROUP BY groups employees under each manager.
• COUNT(e.id) calculates the number of direct reports.
• HAVING filters managers with at least 5 reports.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use SELF JOIN when a table references itself.

General Pattern:

SELECT ...
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
GROUP BY m.id
HAVING COUNT(*) >= value;

Common Interview Questions:

✓ Employee → Manager
✓ Parent → Child
✓ Category → Parent Category
✓ Friends / Followers
✓ Organization Hierarchies

Remember:

WHERE  → Filters rows before grouping.
HAVING → Filters groups after aggregation.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
