-- ==========================================================
-- Problem      : Movie Rating
-- LeetCode ID  : 1341
-- Difficulty   : Medium
-- Category     : Joins + Aggregation
-- Pattern      : JOIN + GROUP BY + ORDER BY + LIMIT + UNION ALL
-- Concepts     : JOIN, GROUP BY, AVG(), COUNT(), ORDER BY, LIMIT
-- Time         : O(n log n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
Write a query to find:

1. The name of the user who has rated the greatest
   number of movies.
   - If there is a tie, return the lexicographically
     smaller name.

2. The movie name with the highest average rating
   during February 2020.
   - If there is a tie, return the lexicographically
     smaller movie title.

Return both answers in a single column named results.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Movies
------
movie_id     INT
title        VARCHAR

Users
-----
user_id      INT
name         VARCHAR

MovieRating
-----------
movie_id      INT
user_id       INT
rating        INT
created_at    DATE
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
Part 1:
-------
1. JOIN Users with MovieRating.
2. GROUP BY user.
3. Count ratings.
4. Sort by:
      COUNT DESC,
      name ASC.
5. Pick the first row.

Part 2:
-------
1. Filter ratings from February 2020.
2. JOIN Movies.
3. GROUP BY movie.
4. Compute AVG(rating).
5. Sort by:
      AVG DESC,
      title ASC.
6. Pick the first row.

Combine both answers using UNION ALL.
*/

-- ==========================================================
-- Solution
-- ==========================================================

(
SELECT
    u.name AS results
FROM Users u
JOIN MovieRating mr
ON u.user_id = mr.user_id
GROUP BY
    u.user_id,
    u.name
ORDER BY
    COUNT(*) DESC,
    u.name
LIMIT 1
)

UNION ALL

(
SELECT
    m.title AS results
FROM Movies m
JOIN MovieRating mr
ON m.movie_id = mr.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY
    m.movie_id,
    m.title
ORDER BY
    AVG(mr.rating) DESC,
    m.title
LIMIT 1
);

-- ==========================================================
-- Explanation
-- ==========================================================

/*
Part 1:
• COUNT(*) counts ratings submitted by each user.
• ORDER BY COUNT DESC finds the most active user.
• name ASC resolves ties alphabetically.

Part 2:
• WHERE filters ratings from February 2020.
• AVG(rating) computes each movie's average rating.
• ORDER BY AVG DESC finds the highest-rated movie.
• title ASC resolves ties alphabetically.

• UNION ALL combines the two required outputs.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Top N Per Condition

General Pattern:

SELECT ...
FROM table
GROUP BY ...
ORDER BY aggregate DESC, column ASC
LIMIT 1;

Combine multiple independent answers using UNION ALL.

Common Interview Questions:

✓ Highest Rated Movie
✓ Most Active User
✓ Top Customer
✓ Best Selling Product
✓ Employee of the Month
✓ Most Popular Category

Remember:

ORDER BY
    COUNT(*) DESC,
    name ASC

or

ORDER BY
    AVG(value) DESC,
    title ASC

is the standard way to handle ties.

LIMIT 1
returns only the best record.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n log n)
Space Complexity: O(n)
*/
