-- ==========================================================
-- Problem      : Number of Unique Subjects Taught by Each Teacher
-- LeetCode ID  : 2356
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + COUNT(DISTINCT)
-- Concepts     : GROUP BY, COUNT(), DISTINCT
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For each teacher, count the number of unique subjects
they teach.

Return the result table in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Teacher
-------
teacher_id   INT
subject_id   INT
dept_id      INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. GROUP BY teacher_id.
2. Count the distinct subject_id values
   for each teacher.
3. Return the teacher ID and the number
   of unique subjects taught.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• GROUP BY teacher_id creates one group
  for each teacher.
• COUNT(DISTINCT subject_id) counts only
  unique subjects taught by that teacher.
• Duplicate subject entries are ignored.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
COUNT(DISTINCT column)

Counts only unique values within each group.

General Pattern:

SELECT
    grouping_column,
    COUNT(DISTINCT value_column)
FROM table
GROUP BY grouping_column;

Common Interview Questions:

✓ Unique Subjects per Teacher
✓ Unique Customers per Product
✓ Unique Visitors per Day
✓ Distinct Employees per Department
✓ Different Categories Sold

Remember:

COUNT(column)
→ Counts all non-NULL rows.

COUNT(DISTINCT column)
→ Counts unique non-NULL values only.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
