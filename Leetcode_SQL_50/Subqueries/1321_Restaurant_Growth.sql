-- ==========================================================
-- Problem      : Restaurant Growth
-- LeetCode ID  : 1321
-- Difficulty   : Hard
-- Category     : Window Functions
-- Pattern      : Running Sum + Sliding Window
-- Concepts     : SUM() OVER(), ROWS BETWEEN, CTE, ROUND()
-- Time         : O(n log n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
For each day starting from the 7th day,
calculate:

1. Total revenue of the current day and the
   previous 6 days (7-day rolling sum).

2. Average daily revenue over those 7 days.

Round the average to 2 decimal places.

Return the results ordered by visited_on.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Customer
--------
customer_id   INT
name          VARCHAR
visited_on    DATE
amount        INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Aggregate revenue for each day.
2. Use a window function to calculate the
   rolling 7-day revenue.
3. Use another window function to count
   how many days are included.
4. Keep only windows containing exactly
   7 days.
5. Compute the average by dividing the
   rolling revenue by 7.
*/

-- ==========================================================
-- Solution
-- ==========================================================

WITH daily_sales AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
rolling_sales AS (
    SELECT
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        COUNT(*) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS days
    FROM daily_sales
)

SELECT
    visited_on,
    amount,
    ROUND(amount / 7, 2) AS average_amount
FROM rolling_sales
WHERE days = 7
ORDER BY visited_on;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• The first CTE aggregates total revenue for each day.

• SUM() OVER(...)
  computes the rolling 7-day revenue.

• COUNT() OVER(...)
  checks whether the window contains exactly
  seven days.

• Only complete 7-day windows are returned.

• average_amount = rolling_sum / 7.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Sliding Window (Rolling Aggregate)

General Pattern:

SUM(column)
OVER(
    ORDER BY date_column
    ROWS BETWEEN N PRECEDING
    AND CURRENT ROW
)

Useful Window Frames:

ROWS BETWEEN
6 PRECEDING AND CURRENT ROW
→ Last 7 rows

29 PRECEDING
→ Last 30 rows

Common Interview Questions:

✓ 7-Day Revenue
✓ Moving Average
✓ Rolling Sales
✓ Running Inventory
✓ Weekly Traffic
✓ Stock Analysis

Remember:

Aggregate Function:
SUM(column)
→ One result per group.

Window Function:
SUM(column) OVER(...)
→ Running or rolling value for every row.

ROWS BETWEEN
creates a sliding window.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n log n)
Space Complexity: O(n)
*/
