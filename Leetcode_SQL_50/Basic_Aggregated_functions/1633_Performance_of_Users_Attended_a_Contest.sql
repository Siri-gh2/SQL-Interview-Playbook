-- ==========================================================
-- Problem      : Percentage of Users Attended a Contest
-- LeetCode ID  : 1633
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : JOIN + GROUP BY + COUNT() + Percentage
-- Concepts     : JOIN, GROUP BY, COUNT(), ROUND(), Subquery
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Calculate the percentage of users registered in each contest.

Percentage =
(Number of users registered for the contest / Total number of users) × 100

Round the result to 2 decimal places.

Order the result by:
1. percentage (descending)
2. contest_id (ascending)
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Users
-----
user_id    INT
user_name  VARCHAR

Register
--------
contest_id INT
user_id    INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Join Register with Users using user_id.
2. GROUP BY contest_id.
3. Count the number of registered users.
4. Divide by the total number of users.
5. Multiply by 100 to get the percentage.
6. Round the result to 2 decimal places.
7. Sort by percentage (DESC) and contest_id (ASC).
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    r.contest_id,
    ROUND(
        COUNT(r.user_id) * 100.0 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register r
JOIN Users u
ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY
    percentage DESC,
    r.contest_id ASC;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• JOIN ensures only valid registered users are counted.
• COUNT(r.user_id) gives the number of participants
  in each contest.
• The subquery calculates the total number of users.
• Multiplying by 100 converts the ratio into a percentage.
• ROUND(...,2) formats the answer.
• ORDER BY sorts by percentage (descending), then
  contest_id (ascending).
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Percentage Formula:

COUNT(group_rows) * 100.0
-------------------------
COUNT(total_rows)

Common Interview Questions:

✓ Contest Participation Rate
✓ Employee Attendance Percentage
✓ Customer Conversion Rate
✓ Product Purchase Percentage
✓ Department Contribution Percentage

Remember:

Use 100.0 (or CAST) instead of 100
to avoid integer division.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
