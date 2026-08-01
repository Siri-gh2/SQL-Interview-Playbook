-- ==========================================================
-- Problem      : Classes More Than 5 Students
-- LeetCode ID  : 596
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + HAVING
-- Concepts     : GROUP BY, COUNT(), HAVING
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find all classes that have at least 5 students.

Return the class names in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Courses
-------
student   VARCHAR
class     VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. GROUP BY class.
2. Count the number of students in each class.
3. Keep only classes having at least 5 students
   using HAVING.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• GROUP BY creates one group for each class.
• COUNT(student) counts the number of students
  in each class.
• HAVING filters grouped results to keep only
  classes with at least 5 students.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: GROUP BY + HAVING

General Pattern:

SELECT
    grouping_column
FROM table
GROUP BY grouping_column
HAVING COUNT(*) >= value;

Common Interview Questions:

✓ Classes with at least N students
✓ Managers with at least N employees
✓ Customers with multiple orders
✓ Products sold more than N times
✓ Departments with more than N employees

Remember:

WHERE
→ Filters individual rows before grouping.

HAVING
→ Filters groups after aggregation.

Rule of Thumb:

Need COUNT(), SUM(), AVG(), MIN(), or MAX()
inside a condition?

Use HAVING, not WHERE.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
