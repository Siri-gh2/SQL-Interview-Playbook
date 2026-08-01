-- ==========================================================
-- Problem      : List the Products Ordered in a Period
-- LeetCode ID  : 1327
-- Difficulty   : Easy
-- Category     : Joins + Aggregation
-- Pattern      : JOIN + GROUP BY + HAVING
-- Concepts     : JOIN, GROUP BY, SUM(), HAVING, Date Filtering
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the products that were ordered at least
100 units during February 2020.

Return:
- product_name
- unit
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Products
--------
product_id     INT
product_name   VARCHAR

Orders
------
product_id     INT
order_date     DATE
unit           INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. JOIN Products with Orders using product_id.
2. Filter orders placed during February 2020.
3. GROUP BY product.
4. Calculate the total units ordered.
5. Keep only products with at least 100 units.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY
    p.product_id,
    p.product_name
HAVING SUM(o.unit) >= 100;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• JOIN combines product details with order records.

• WHERE filters only February 2020 orders.

• GROUP BY creates one group for each product.

• SUM(unit) calculates the total units sold.

• HAVING filters products with total units
  greater than or equal to 100.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: JOIN + GROUP BY + HAVING

General Pattern:

SELECT
    table1.column,
    SUM(table2.value)
FROM table1
JOIN table2
ON table1.id = table2.id
WHERE date_column BETWEEN start_date AND end_date
GROUP BY table1.column
HAVING SUM(table2.value) >= value;

Common Interview Questions:

✓ Products Sold Over Threshold
✓ Customers Spending Over Limit
✓ Departments with Large Budgets
✓ Monthly Sales Report
✓ Inventory Analysis
✓ Revenue by Product

Remember:

WHERE
→ Filters rows before grouping.

GROUP BY
→ Creates groups.

SUM()
→ Calculates totals.

HAVING
→ Filters aggregated results.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
