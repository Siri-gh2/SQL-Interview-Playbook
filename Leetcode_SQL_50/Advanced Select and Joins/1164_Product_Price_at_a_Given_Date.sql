-- ==========================================================
-- Problem      : Product Price at a Given Date
-- LeetCode ID  : 1164
-- Difficulty   : Medium
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + MAX() + LEFT JOIN + COALESCE()
-- Concepts     : MAX(), GROUP BY, LEFT JOIN, COALESCE(), Date Filtering
-- Time         : O(n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
Find the price of every product on the given date:
2019-08-16.

Rules:

1. If the product had one or more price changes on or
   before 2019-08-16, use the latest price.

2. If the product had no price changes before or on
   2019-08-16, its price is 10.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Products
--------
product_id    INT
new_price     INT
change_date   DATE
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Find the latest change_date for every product
   on or before 2019-08-16.

2. Join it back with the Products table to retrieve
   the corresponding price.

3. LEFT JOIN with all distinct products so every
   product appears in the output.

4. Use COALESCE() to assign the default price (10)
   to products having no previous price changes.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    p.product_id,
    COALESCE(t.new_price, 10) AS price
FROM
(
    SELECT DISTINCT product_id
    FROM Products
) p
LEFT JOIN
(
    SELECT
        p1.product_id,
        p1.new_price
    FROM Products p1
    JOIN
    (
        SELECT
            product_id,
            MAX(change_date) AS last_date
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    ) p2
    ON p1.product_id = p2.product_id
    AND p1.change_date = p2.last_date
) t
ON p.product_id = t.product_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• MAX(change_date) finds the latest price update
  before or on 2019-08-16.

• Joining back retrieves the corresponding new_price.

• LEFT JOIN ensures every product appears,
  even if it has no valid price update.

• COALESCE(new_price, 10) replaces NULL with
  the default price of 10.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Latest Record Before a Given Date

Step 1:
Find the latest date.

SELECT
    product_id,
    MAX(change_date)
FROM Products
WHERE change_date <= target_date
GROUP BY product_id;

Step 2:
Join back to retrieve the remaining columns.

Step 3:
Use COALESCE() for default values.

Common Interview Questions:

✓ Latest Product Price
✓ Latest Employee Salary
✓ Latest Customer Status
✓ Last Login Before Date
✓ Effective Price
✓ Slowly Changing Dimensions (SCD)

Remember:

MAX(date)
→ Finds the latest record.

LEFT JOIN
→ Keeps all products.

COALESCE(value, default)
→ Replaces NULL with a default value.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(n)
*/
