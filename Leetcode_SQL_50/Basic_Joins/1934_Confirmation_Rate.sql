-- ==========================================================
-- Problem      : Confirmation Rate
-- LeetCode ID  : 1934
-- Difficulty   : Medium
-- Category     : Basic Joins
-- Pattern      : LEFT JOIN + Conditional Aggregation
-- Concepts     : LEFT JOIN, AVG(), CASE WHEN, IFNULL(), ROUND()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
The confirmation rate of a user is the number of confirmed
messages divided by the total number of confirmation requests.

If a user has no confirmation requests, their confirmation
rate is 0.

Return the confirmation rate for every user rounded to
2 decimal places.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Signups
-------
user_id         INT
time_stamp      DATETIME

Confirmations
-------------
user_id         INT
time_stamp      DATETIME
action          ENUM('confirmed','timeout')
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Start with the Signups table because every user
   must appear in the result.
2. LEFT JOIN Confirmations using user_id.
3. Assign:
      - 1 for confirmed
      - 0 for timeout
4. AVG() computes:
      confirmed / total requests
5. Replace NULL with 0 for users having no requests.
6. Round the result to 2 decimal places.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    s.user_id,
    ROUND(
        IFNULL(
            AVG(CASE
                    WHEN c.action = 'confirmed' THEN 1
                    ELSE 0
                END),
            0
        ),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• LEFT JOIN keeps all users from Signups.
• CASE converts:
      confirmed → 1
      timeout   → 0
• AVG() computes:
      (sum of 1's) / (total confirmations)
• IFNULL() changes NULL to 0 for users with no
  confirmation records.
• ROUND(...,2) formats the answer.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use Conditional Aggregation whenever counting only
specific records.

General Pattern:

AVG(CASE
        WHEN condition THEN 1
        ELSE 0
    END)

or

SUM(CASE
        WHEN condition THEN 1
        ELSE 0
    END)

Common Interview Questions:

✓ Confirmation Rate
✓ Pass Percentage
✓ Success Rate
✓ Delivery Rate
✓ Acceptance Rate
✓ Conversion Rate

Remember:

AVG(1,0,1,1) = 3/4 = 0.75

This is often simpler than writing:
SUM(...) / COUNT(...)
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
