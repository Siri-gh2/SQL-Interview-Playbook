-- ==========================================================
-- Problem      : Article Views I
-- LeetCode ID  : 1148
-- Difficulty   : Easy
-- Category     : SELECT
-- Pattern      : Filtering Rows + DISTINCT
-- Concepts     : SELECT, DISTINCT, WHERE
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find the IDs of authors who viewed at least one of their own articles.

Return the result table sorted by id in ascending order.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Views
-----
article_id   INT
author_id    INT
viewer_id    INT
view_date    DATE
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Compare the author_id and viewer_id.
2. If both are equal, it means the author viewed
   their own article.
3. Use DISTINCT to avoid duplicate author IDs.
4. Sort the result by id.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT DISTINCT
    author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• WHERE author_id = viewer_id filters only self-views.
• DISTINCT removes duplicate author IDs because an author
  may have viewed multiple articles.
• ORDER BY id returns the result in ascending order.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use DISTINCT whenever duplicate rows should appear only once.

General Pattern:

SELECT DISTINCT column
FROM table
WHERE condition;

Common use cases:
✓ Unique customers
✓ Unique products
✓ Unique authors
✓ Unique employee IDs
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
