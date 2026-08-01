-- ==========================================================
-- Problem      : Exchange Seats
-- LeetCode ID  : 626
-- Difficulty   : Medium
-- Category     : CASE WHEN
-- Pattern      : CASE WHEN + MOD()
-- Concepts     : CASE WHEN, MOD(), ORDER BY
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Swap the seat IDs of every two consecutive students.

Rules:

1. If the seat ID is odd, swap it with the next seat.
2. If the seat ID is even, swap it with the previous seat.
3. If the number of students is odd, the last student
   remains in the same seat.

Return the result ordered by the new seat ID.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Seat
----
id       INT
student  VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Use CASE WHEN to determine the new seat ID.
2. If:
      - id is odd and not the last seat → id + 1
      - id is even                     → id - 1
      - last odd seat                  → keep the same id
3. Sort by the new seat ID.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    CASE
        WHEN MOD(id, 2) = 1
             AND id != (SELECT MAX(id) FROM Seat)
            THEN id + 1
        WHEN MOD(id, 2) = 0
            THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• MOD(id, 2) = 1 identifies odd seat IDs.
• Odd seats (except the last one) move to the next seat.
• Even seats move to the previous seat.
• If the last seat is odd, it has no partner to swap with,
  so it remains unchanged.
• ORDER BY id arranges the output by the new seat IDs.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: CASE WHEN + MOD()

General Pattern:

CASE
    WHEN condition1 THEN value1
    WHEN condition2 THEN value2
    ELSE value3
END

Common Interview Questions:

✓ Exchange Seats
✓ Alternate Row Processing
✓ Even/Odd Classification
✓ Seat Allocation
✓ Conditional Row Updates

Remember:

MOD(number, 2)

= 0 → Even

= 1 → Odd

CASE WHEN allows multiple conditions
to produce different outputs in a single query.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
