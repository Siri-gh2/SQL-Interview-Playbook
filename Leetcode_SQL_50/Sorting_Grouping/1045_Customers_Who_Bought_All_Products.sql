-- ==========================================================
-- Problem      : Customers Who Bought All Products
-- LeetCode ID  : 1045
-- Difficulty   : Medium
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + COUNT(DISTINCT) + Subquery
-- Concepts     : GROUP BY, COUNT(DISTINCT), HAVING, Subquery
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the customer IDs of customers who purchased
every product listed in the Product table.

Return the result in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Customer
--------
customer_id   INT
product_key   INT

Product
-------
product_key   INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. GROUP BY customer_id.
2. Count the number of distinct products
   purchased by each customer.
3. Count the total number of products.
4. Keep only customers whose purchased product
   count equals the total number of products.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*)
    FROM Product
);

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• GROUP BY creates one group for each customer.
• COUNT(DISTINCT product_key) counts the unique
  products purchased by each customer.
• The subquery counts the total number of products.
• HAVING compares the two counts.
• If they are equal, the customer has purchased
  every available product.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Compare Group Count with Total Count

General Pattern:

SELECT grouping_column
FROM table1
GROUP BY grouping_column
HAVING COUNT(DISTINCT column) =
(
    SELECT COUNT(*)
    FROM table2
);

Common Interview Questions:

✓ Customers Who Bought All Products
✓ Students Enrolled in All Courses
✓ Employees Assigned to Every Project
✓ Users Who Visited Every Page
✓ Suppliers Providing All Parts

Remember:

COUNT(DISTINCT ...)
→ Counts unique values only.

A scalar subquery is useful when comparing
each group against an overall total.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
