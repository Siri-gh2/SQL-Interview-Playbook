-- ==========================================================
-- Problem      : Triangle Judgement
-- LeetCode ID  : 610
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : CASE WHEN
-- Concepts     : CASE WHEN, Triangle Inequality
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For each row, determine whether the three side lengths
can form a valid triangle.

Return:
- x
- y
- z
- triangle ('Yes' or 'No')
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Triangle
--------
x    INT
y    INT
z    INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
A triangle is valid only if the sum of any two sides
is greater than the third side.

Conditions:

1. x + y > z
2. x + z > y
3. y + z > x

If all three conditions are true,
return 'Yes'; otherwise return 'No'.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z
         AND x + z > y
         AND y + z > x
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• CASE WHEN checks whether the three values satisfy
  the triangle inequality theorem.

• If all three inequalities hold,
  the sides form a valid triangle.

• Otherwise, the result is 'No'.

• The query evaluates each row independently.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: CASE WHEN for Conditional Output

General Pattern:

SELECT
    CASE
        WHEN condition THEN value1
        ELSE value2
    END
FROM table;

Common Interview Questions:

✓ Triangle Validation
✓ Grade Classification
✓ Salary Band
✓ Pass / Fail
✓ Customer Segmentation
✓ Risk Classification

Remember:

CASE WHEN
→ Used to create a new column based on conditions.

It works like an if-else statement in SQL.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
