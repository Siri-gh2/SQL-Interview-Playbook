-- ==========================================================
-- Problem      : Not Boring Movies
-- LeetCode ID  : 620
-- Difficulty   : Easy
-- Category     : Basic Joins / Filtering
-- Pattern      : WHERE + MOD() + ORDER BY
-- Concepts     : WHERE, MOD(), ORDER BY
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Report all movies with:
- an odd-numbered ID, and
- a description that is not "boring".

Return the result ordered by rating in descending order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Cinema
------
id            INT
movie         VARCHAR
description   VARCHAR
rating        FLOAT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Select all movie details.
2. Keep only movies where:
      - id is odd.
      - description is not 'boring'.
3. Sort the result by rating in descending order.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    *
FROM Cinema
WHERE id % 2 = 1
  AND description <> 'boring'
ORDER BY rating DESC;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• id % 2 = 1 selects only odd-numbered movie IDs.
• description <> 'boring' removes boring movies.
• ORDER BY rating DESC sorts the movies from
  highest rating to lowest.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use the modulo operator (%) to filter even or odd numbers.

General Pattern:

-- Odd numbers
WHERE column % 2 = 1

-- Even numbers
WHERE column % 2 = 0

Common Interview Questions:

✓ Odd / Even IDs
✓ Alternate Rows
✓ Every nth Record
✓ Filtering Numeric Patterns

Remember:

ORDER BY column DESC
→ Highest to Lowest

ORDER BY column ASC
→ Lowest to Highest (default)
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
