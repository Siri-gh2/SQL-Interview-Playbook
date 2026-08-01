-- ==========================================================
-- Problem      : Immediate Food Delivery II
-- LeetCode ID  : 1174
-- Difficulty   : Medium
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + MIN() + Conditional Aggregation
-- Concepts     : GROUP BY, MIN(), CASE WHEN, ROUND(), CTE
-- Time         : O(n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
The first order of a customer is called their first order.

An order is considered immediate if:
order_date = customer_pref_delivery_date.

Calculate the percentage of customers whose first order
was delivered immediately.

Round the answer to 2 decimal places.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Delivery
--------
delivery_id                  INT
customer_id                  INT
order_date                   DATE
customer_pref_delivery_date  DATE
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Find the first order date for every customer.
2. Join it back with the Delivery table.
3. Check whether the first order was immediate.
4. Compute the percentage of immediate first orders.
5. Round the result to 2 decimal places.
*/

-- ==========================================================
-- Solution
-- ==========================================================

WITH first_order AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT
    ROUND(
        AVG(
            CASE
                WHEN d.order_date = d.customer_pref_delivery_date
                THEN 100
                ELSE 0
            END
        ),
        2
    ) AS immediate_percentage
FROM Delivery d
JOIN first_order f
ON d.customer_id = f.customer_id
AND d.order_date = f.first_order_date;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• MIN(order_date) finds the first order for each customer.
• JOIN retrieves the complete record of that first order.
• CASE identifies whether the first order was immediate.
• AVG(100,0,100,...) directly computes the percentage.
• ROUND(...,2) formats the answer.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern 1: Find the first record per group

SELECT
    customer_id,
    MIN(order_date)
FROM Delivery
GROUP BY customer_id;

Pattern 2: Conditional Percentage

AVG(
    CASE
        WHEN condition THEN 100
        ELSE 0
    END
)

Common Interview Questions:

✓ First Order
✓ First Purchase
✓ First Login
✓ First Transaction
✓ Immediate Delivery
✓ First Visit Analysis

Remember:

To retrieve additional columns from the first row,
first find MIN()/MAX(), then JOIN back to the original table.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(n)
*/
