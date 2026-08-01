-- ==========================================================
-- Problem      : Product Sales Analysis I
-- LeetCode ID  : 1068
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : INNER JOIN
-- Concepts     : JOIN, SELECT
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Report the product name, year, and price for each sale.

Return the result table in any order.
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

Product
-------
product_id   INT
product_name VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Join the Sales and Product tables using product_id.
2. Retrieve:
      - product_name
      - year
      - price
3. Since every sale has a valid product, use INNER JOIN.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales s
JOIN Product p
ON s.product_id = p.product_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• JOIN combines rows from Sales and Product.
• product_id is the common key between the tables.
• The query returns the product name along with
  the corresponding sale year and price.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use INNER JOIN when:

✓ Matching records exist in both tables.
✓ You only want rows with matching keys.

General Pattern:

SELECT columns
FROM Table1 t1
JOIN Table2 t2
ON t1.common_key = t2.common_key;

Examples:
✓ Employee ↔ Department
✓ Orders ↔ Customers
✓ Sales ↔ Products
✓ Students ↔ Courses
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
