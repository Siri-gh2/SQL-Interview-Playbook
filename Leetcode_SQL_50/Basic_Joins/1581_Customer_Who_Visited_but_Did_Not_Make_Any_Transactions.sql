-- ==========================================================
-- Problem      : Customer Who Visited but Did Not Make Any Transactions
-- LeetCode ID  : 1581
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : LEFT JOIN + GROUP BY
-- Concepts     : LEFT JOIN, NULL Handling, COUNT(), GROUP BY
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the IDs of customers who visited the mall but did not
make any transactions.

For each such customer, return:
- customer_id
- count_no_trans (number of visits without transactions)

Return the result table in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Visits
------
visit_id      INT
customer_id   INT

Transactions
------------
transaction_id   INT
visit_id         INT
amount           INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Start with the Visits table since every visit should
   be considered.
2. LEFT JOIN Transactions using visit_id.
3. Visits with no matching transaction will have
   transaction_id = NULL.
4. Count such visits for each customer.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• LEFT JOIN keeps all visits.
• Matching transactions are attached using visit_id.
• If a visit has no transaction, transaction_id becomes NULL.
• WHERE transaction_id IS NULL keeps only visits without
  transactions.
• GROUP BY customer_id counts the number of such visits
  for each customer.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use LEFT JOIN + IS NULL to find missing records.

General Pattern:

SELECT ...
FROM Table1 t1
LEFT JOIN Table2 t2
ON t1.id = t2.id
WHERE t2.id IS NULL;

Common Interview Questions:

✓ Customers without orders
✓ Employees without managers
✓ Students without courses
✓ Visits without transactions
✓ Products without sales
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
