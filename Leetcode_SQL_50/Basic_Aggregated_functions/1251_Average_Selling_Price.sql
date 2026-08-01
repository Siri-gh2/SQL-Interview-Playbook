-- ==========================================================
-- Problem      : Average Selling Price
-- LeetCode ID  : 1251
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : JOIN + GROUP BY + Weighted Average
-- Concepts     : JOIN, SUM(), ROUND(), IFNULL(), GROUP BY
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Calculate the average selling price for each product.

The average selling price is computed as:

    Total Revenue / Total Units Sold

where:
- Revenue = price × units

If a product has no units sold, return 0 as the average price.

Round the result to 2 decimal places.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Prices
------
product_id   INT
start_date   DATE
end_date     DATE
price         INT

UnitsSold
---------
product_id   INT
purchase_date DATE
units         INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. LEFT JOIN Prices with UnitsSold.
2. Match records where:
      - product_id is the same.
      - purchase_date lies between
        start_date and end_date.
3. Compute total revenue:
      SUM(price × units)
4. Compute total units sold:
      SUM(units)
5. Calculate:
      Revenue / Units Sold
6. If no units were sold, return 0.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    p.product_id,
    ROUND(
        IFNULL(
            SUM(p.price * u.units) / SUM(u.units),
            0
        ),
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date
                        AND p.end_date
GROUP BY p.product_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• LEFT JOIN ensures every product appears in the result.
• purchase_date BETWEEN start_date AND end_date
  selects the valid price for each purchase.
• SUM(price × units) calculates total revenue.
• SUM(units) calculates total units sold.
• Revenue ÷ Units Sold gives the weighted average price.
• IFNULL() returns 0 for products with no sales.
• ROUND(...,2) formats the answer.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Weighted Average Formula:

SUM(value × weight)
--------------------
SUM(weight)

Common Interview Questions:

✓ Average Selling Price
✓ Weighted GPA
✓ Stock Average Cost
✓ Average Product Price
✓ Revenue Per Unit

Remember:

Simple Average:
AVG(price)

Weighted Average:
SUM(price * units) / SUM(units)

These two are NOT the same.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
