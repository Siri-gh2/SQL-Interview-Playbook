-- ==========================================================
-- Problem      : Recyclable and Low Fat Products
-- LeetCode ID  : 1757
-- Difficulty   : Easy
-- Category     : SELECT
-- Pattern      : Filtering Rows with WHERE
-- Concepts     : SELECT, WHERE, AND
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the IDs of products that are both low fat and recyclable.

Return the result table in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Products
--------
product_id   INT
low_fats     ENUM('Y','N')
recyclable   ENUM('Y','N')
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Retrieve the product IDs.
2. Filter products where:
      - low_fats = 'Y'
      - recyclable = 'Y'
3. Return the matching product IDs.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SELECT retrieves the required column (product_id).
• WHERE filters rows based on conditions.
• AND ensures both conditions are satisfied.
• Only products that are recyclable and low fat are returned.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Whenever a problem asks to filter records based on multiple
conditions, use:

SELECT columns
FROM table
WHERE condition1
  AND condition2;

Common filters:
✓ status = 'Active'
✓ salary > 50000
✓ country = 'India'
✓ recyclable = 'Y'
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
