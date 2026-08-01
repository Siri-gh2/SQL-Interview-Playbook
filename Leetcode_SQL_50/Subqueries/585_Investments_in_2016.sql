-- ==========================================================
-- Problem      : Investments in 2016
-- LeetCode ID  : 585
-- Difficulty   : Medium
-- Category     : Aggregation
-- Pattern      : GROUP BY + HAVING + EXISTS
-- Concepts     : GROUP BY, HAVING, EXISTS, SUM(), ROUND()
-- Time         : O(n log n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
Find the total investment value in 2016 (tiv_2016) for
policyholders who satisfy BOTH conditions:

1. Their tiv_2015 value is shared with at least one
   other policyholder.

2. Their location (lat, lon) is unique.

Return the sum rounded to 2 decimal places.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Insurance
---------
pid         INT
tiv_2015    DECIMAL
tiv_2016    DECIMAL
lat         DECIMAL
lon         DECIMAL
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
A policyholder qualifies if:

✓ tiv_2015 appears more than once.
✓ (lat, lon) appears exactly once.

Steps:

1. Find duplicated tiv_2015 values.
2. Find unique (lat, lon) locations.
3. Sum tiv_2016 for records satisfying both.
4. Round the result to 2 decimal places.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT
        lat,
        lon
    FROM Insurance
    GROUP BY
        lat,
        lon
    HAVING COUNT(*) = 1
);

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• The first subquery finds duplicated tiv_2015 values.

• The second subquery finds locations that occur
  exactly once.

• Only rows satisfying both conditions are included.

• SUM(tiv_2016) computes the required investment total.

• ROUND(...,2) formats the result.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Filter Groups using HAVING

General Pattern:

SELECT ...
FROM table
WHERE column IN (
    SELECT column
    FROM table
    GROUP BY column
    HAVING COUNT(*) > 1
);

Pattern: Composite Key Filtering

(col1, col2) IN (
    SELECT col1, col2
    FROM table
    GROUP BY col1, col2
    HAVING COUNT(*) = 1
)

Common Interview Questions:

✓ Duplicate Values
✓ Unique Locations
✓ Duplicate Emails
✓ Repeated Transactions
✓ Composite Key Filtering
✓ Insurance Analysis

Remember:

HAVING COUNT(*) > 1
→ Duplicate values

HAVING COUNT(*) = 1
→ Unique values

MySQL supports tuple comparisons like:

(col1, col2) IN (...)
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n log n)
Space Complexity: O(n)
*/
