-- ==========================================================
-- Problem      : User Activity for the Past 30 Days I
-- LeetCode ID  : 1141
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + COUNT(DISTINCT)
-- Concepts     : GROUP BY, COUNT(DISTINCT), WHERE, Date Filtering
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the number of active users for each day during the
30-day period ending on 2019-07-27 (inclusive).

A user is considered active if they performed at least
one activity on that day.

Return the result table in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Activity
--------
user_id         INT
session_id      INT
activity_date   DATE
activity_type   ENUM(...)
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Filter records between:
      2019-06-28 and 2019-07-27.
2. GROUP BY activity_date.
3. Count distinct users for each day.
4. Return the date and active user count.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• WHERE limits the records to the required 30-day period.
• GROUP BY activity_date creates one group for each day.
• COUNT(DISTINCT user_id) counts each active user only once,
  even if they performed multiple activities that day.
• The result contains one row per day.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Daily Active Users (DAU) Pattern

SELECT
    date_column,
    COUNT(DISTINCT user_id)
FROM table
WHERE date_column BETWEEN start_date AND end_date
GROUP BY date_column;

Common Interview Questions:

✓ Daily Active Users (DAU)
✓ Monthly Active Users (MAU)
✓ Weekly Active Users (WAU)
✓ Daily Visitors
✓ Daily Customers
✓ Login Statistics

Remember:

COUNT(user_id)
→ Counts every activity.

COUNT(DISTINCT user_id)
→ Counts each user only once per day.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
