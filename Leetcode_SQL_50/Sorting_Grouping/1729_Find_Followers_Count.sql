-- ==========================================================
-- Problem      : Find Followers Count
-- LeetCode ID  : 1729
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + COUNT()
-- Concepts     : GROUP BY, COUNT(), ORDER BY
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For each user, find the number of followers they have.

Return:
- user_id
- followers_count

Order the result by user_id in ascending order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Followers
---------
user_id       INT
follower_id   INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. GROUP BY user_id.
2. Count the number of follower_id values for each user.
3. Sort the result by user_id.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• GROUP BY creates one group for each user.
• COUNT(follower_id) counts how many followers
  each user has.
• ORDER BY user_id sorts the output in ascending order.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: GROUP BY + COUNT()

General Pattern:

SELECT
    grouping_column,
    COUNT(column)
FROM table
GROUP BY grouping_column;

Common Interview Questions:

✓ Followers per User
✓ Orders per Customer
✓ Employees per Department
✓ Students per Class
✓ Products per Category

Remember:

COUNT(column)
→ Counts non-NULL values.

COUNT(*)
→ Counts all rows.

Use ORDER BY when the problem specifies
the output order.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
