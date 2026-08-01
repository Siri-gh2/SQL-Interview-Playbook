-- ==========================================================
-- Problem      : Group Sold Products By The Date
-- LeetCode ID  : 1484
-- Difficulty   : Easy
-- Category     : String Aggregation
-- Pattern      : GROUP BY + COUNT(DISTINCT) + GROUP_CONCAT()
-- Concepts     : GROUP BY, COUNT(DISTINCT), GROUP_CONCAT(), ORDER BY
-- Time         : O(n log n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
For each sell date:

1. Find the number of different products sold.
2. List the product names in alphabetical order,
   separated by commas.

Return the result ordered by sell_date.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Activities
----------
sell_date    DATE
product      VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. GROUP BY sell_date.
2. COUNT(DISTINCT product) to count unique products.
3. GROUP_CONCAT() to concatenate product names.
4. Sort product names alphabetically inside GROUP_CONCAT().
5. Order the final result by sell_date.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(
        DISTINCT product
        ORDER BY product
        SEPARATOR ','
    ) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• GROUP BY creates one group for each sell date.

• COUNT(DISTINCT product)
  counts unique products sold on that day.

• GROUP_CONCAT()
  combines product names into a single string.

• ORDER BY product
  sorts product names alphabetically.

• SEPARATOR ','
  joins product names using commas.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: String Aggregation

General Pattern:

GROUP_CONCAT(
    DISTINCT column
    ORDER BY column
    SEPARATOR ','
)

Common Interview Questions:

✓ Products Sold Per Day
✓ Skills Per Employee
✓ Courses Per Student
✓ Tags Per Post
✓ Cities Per Country
✓ Roles Per User

Remember:

COUNT(DISTINCT column)
→ Counts unique values.

GROUP_CONCAT()
→ Combines multiple rows into one string.

ORDER BY inside GROUP_CONCAT()
→ Controls the order of concatenated values.

SEPARATOR
→ Specifies the delimiter.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n log n)
(due to sorting inside GROUP_CONCAT)

Space Complexity: O(n)
*/
