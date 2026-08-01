-- ==========================================================
-- Problem      : Product Sales Analysis III
-- LeetCode ID  : 1070
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + MIN() + JOIN
-- Concepts     : GROUP BY, MIN(), JOIN, Aggregate Functions
-- Time         : O(n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
For each product, find its first year of sale along with
the corresponding quantity and price.

Return:
- product_id
- first_year
- quantity
- price
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Sales
-----
sale_id      INT
product_id   INT
year         INT
quantity     INT
price        INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Find the earliest year each product was sold
   using MIN(year).
2. Join the result back with the Sales table.
3. Retrieve the quantity and price corresponding
   to that first year.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) t
ON s.product_id = t.product_id
AND s.year = t.first_year;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• MIN(year) finds the earliest sale year for each product.
• The subquery returns:
      product_id | first_year
• Joining it back with Sales retrieves the remaining
  columns (quantity and price) for that first sale.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: First Record Per Group

Step 1:
Find the minimum (or maximum) value.

SELECT
    key,
    MIN(column)
FROM table
GROUP BY key;

Step 2:
Join it back to retrieve the remaining columns.

Common Interview Questions:

✓ First Sale
✓ First Order
✓ First Login
✓ Earliest Transaction
✓ Latest Purchase
✓ First Employee Hire

Remember:

Aggregate functions (MIN/MAX) return only the grouped
column and aggregate value.

To retrieve other columns from the same row,
JOIN back with the original table.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(n)
*/
