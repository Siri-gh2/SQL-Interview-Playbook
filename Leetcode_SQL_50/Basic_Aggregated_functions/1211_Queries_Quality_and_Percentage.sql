-- ==========================================================
-- Problem      : Queries Quality and Percentage
-- LeetCode ID  : 1211
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + Conditional Aggregation
-- Concepts     : GROUP BY, AVG(), COUNT(), CASE WHEN, ROUND()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For each query_name, calculate:

1. Quality
   = Average of (rating / position)

2. Poor Query Percentage
   = Percentage of queries having rating < 3

Round both values to 2 decimal places.

Return the result in any order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Queries
-------
query_name   VARCHAR
result       VARCHAR
position     INT
rating       INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. GROUP BY query_name.
2. Compute the average quality using:
      AVG(rating / position)
3. Count poor queries (rating < 3) using CASE WHEN.
4. Divide by total queries in that group.
5. Multiply by 100 to get the percentage.
6. Round both values to 2 decimal places.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(
        AVG(
            CASE
                WHEN rating < 3 THEN 100
                ELSE 0
            END
        ),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• AVG(rating / position) calculates the query quality.
• CASE converts:
      rating < 3 → 100
      otherwise  → 0
• AVG() then computes the percentage of poor queries.
• GROUP BY ensures calculations are performed
  separately for each query_name.
• ROUND(...,2) formats the results.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Conditional Aggregation Pattern:

AVG(
    CASE
        WHEN condition THEN value1
        ELSE value2
    END
)

or

SUM(
    CASE
        WHEN condition THEN 1
        ELSE 0
    END
)

Common Interview Questions:

✓ Success Rate
✓ Pass Percentage
✓ Conversion Rate
✓ Poor Query Percentage
✓ Acceptance Rate
✓ Delivery Rate

Tip:

Instead of writing:

SUM(CASE WHEN condition THEN 1 ELSE 0 END)
/
COUNT(*)

You can often simplify it as:

AVG(CASE WHEN condition THEN 1 ELSE 0 END)

or, for percentages:

AVG(CASE WHEN condition THEN 100 ELSE 0 END)
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
