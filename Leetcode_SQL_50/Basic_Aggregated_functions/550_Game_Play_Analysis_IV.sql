-- ==========================================================
-- Problem      : Game Play Analysis IV
-- LeetCode ID  : 550
-- Difficulty   : Medium
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + MIN() + Conditional Aggregation
-- Concepts     : GROUP BY, MIN(), DATE_ADD(), ROUND(), AVG(), CTE
-- Time         : O(n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
Find the fraction of players who logged in again exactly
one day after their first login.

Round the result to 2 decimal places.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Activity
--------
player_id     INT
device_id     INT
event_date    DATE
games_played  INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Find the first login date for every player.
2. Join it back with the Activity table.
3. Check whether the player logged in exactly
   one day after their first login.
4. Count such players.
5. Divide by the total number of players.
6. Round the answer to 2 decimal places.
*/

-- ==========================================================
-- Solution
-- ==========================================================

WITH first_login AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(
        AVG(
            CASE
                WHEN a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
                THEN 1
                ELSE 0
            END
        ),
        2
    ) AS fraction
FROM first_login f
LEFT JOIN Activity a
ON f.player_id = a.player_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• MIN(event_date) finds each player's first login.
• LEFT JOIN retrieves all login records for that player.
• DATE_ADD(first_login_date, INTERVAL 1 DAY)
  calculates the expected next-day login.
• CASE returns:
      1 → Logged in the next day
      0 → Otherwise
• AVG() computes:
      qualifying players / total players
• ROUND(...,2) formats the answer.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern 1: First Record Per Group

SELECT
    player_id,
    MIN(event_date)
FROM Activity
GROUP BY player_id;

Pattern 2: Date Arithmetic

DATE_ADD(date_column, INTERVAL 1 DAY)

Pattern 3: Fraction / Percentage

AVG(
    CASE
        WHEN condition THEN 1
        ELSE 0
    END
)

Common Interview Questions:

✓ Day-1 Retention
✓ Repeat Customers
✓ Next-Day Login
✓ User Retention
✓ First Purchase Analysis
✓ Customer Return Rate

Remember:

AVG(1,0,1,1)
=
Successful Cases / Total Cases

This is often cleaner than:

SUM(CASE ...)/COUNT(*)
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(n)
*/
