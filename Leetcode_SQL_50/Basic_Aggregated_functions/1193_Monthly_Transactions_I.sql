-- ==========================================================
-- Problem      : Monthly Transactions I
-- LeetCode ID  : 1193
-- Difficulty   : Medium
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + Conditional Aggregation
-- Concepts     : DATE_FORMAT(), GROUP BY, SUM(), COUNT(), CASE WHEN
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For each month and country, calculate:

1. Number of transactions
2. Number of approved transactions
3. Total transaction amount
4. Total approved transaction amount

Return the result ordered by month and country.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Transactions
------------
id          INT
country     VARCHAR
state       ENUM('approved', 'declined')
amount      INT
trans_date  DATE
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Extract the month from trans_date.
2. GROUP BY month and country.
3. COUNT all transactions.
4. Use CASE WHEN to count approved transactions.
5. Use CASE WHEN to sum approved transaction amounts.
6. Return the required metrics.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE
            WHEN state = 'approved' THEN 1
            ELSE 0
        END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE
            WHEN state = 'approved' THEN amount
            ELSE 0
        END) AS approved_total_amount
FROM Transactions
GROUP BY
    DATE_FORMAT(trans_date, '%Y-%m'),
    country;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• DATE_FORMAT(trans_date, '%Y-%m') extracts the month.
• COUNT(*) counts all transactions.
• SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END)
  counts approved transactions.
• SUM(amount) calculates the total transaction amount.
• SUM(CASE WHEN state='approved' THEN amount ELSE 0 END)
  calculates the total approved transaction amount.
• GROUP BY month and country computes results for
  each month-country combination.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Conditional Aggregation Pattern:

COUNT:
SUM(CASE WHEN condition THEN 1 ELSE 0 END)

Conditional Sum:
SUM(CASE WHEN condition THEN amount ELSE 0 END)

Date Grouping:

DATE_FORMAT(date_column, '%Y-%m')

Common Interview Questions:

✓ Monthly Sales Report
✓ Monthly Revenue
✓ Approved Transactions
✓ Order Statistics
✓ Sales Dashboard
✓ Financial Reports

Remember:

COUNT(*) → Counts all rows

SUM(CASE WHEN condition THEN 1 ELSE 0 END)
→ Counts rows satisfying a condition

SUM(CASE WHEN condition THEN value ELSE 0 END)
→ Sums values satisfying a condition
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
