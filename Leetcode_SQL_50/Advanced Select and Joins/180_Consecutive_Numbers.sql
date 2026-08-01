-- ==========================================================
-- Problem      : Consecutive Numbers
-- LeetCode ID  : 180
-- Difficulty   : Medium
-- Category     : Window Functions / Self Join
-- Pattern      : LEAD() Window Function
-- Concepts     : LEAD(), Window Functions, Consecutive Rows
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find all numbers that appear at least three times
consecutively in the Logs table.

Return each number only once.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Logs
----
id    INT
num   VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Use LEAD() to look at the next two rows.
2. Compare the current number with:
      - next number
      - second next number
3. If all three are equal,
   return the current number.
4. Use DISTINCT to avoid duplicates.
*/

-- ==========================================================
-- Solution
-- ==========================================================

WITH consecutive AS (
    SELECT
        num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num,
        LEAD(num, 2) OVER (ORDER BY id) AS next_next_num
    FROM Logs
)

SELECT DISTINCT
    num AS ConsecutiveNums
FROM consecutive
WHERE num = next_num
  AND num = next_next_num;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• LEAD(num, 1) gets the next row's number.
• LEAD(num, 2) gets the second next row's number.
• If all three numbers are equal, they appear
  consecutively.
• DISTINCT removes duplicate outputs when
  a number appears more than three times consecutively.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: LEAD() for Looking Ahead

General Pattern:

LEAD(column, offset)
OVER (ORDER BY column)

Common Window Functions:

LEAD()  → Next row
LAG()   → Previous row
ROW_NUMBER()
RANK()
DENSE_RANK()

Common Interview Questions:

✓ Consecutive Numbers
✓ Consecutive Login Days
✓ Stock Price Changes
✓ Next Purchase
✓ Previous Salary
✓ Event Comparison

Remember:

LEAD()
→ Looks forward.

LAG()
→ Looks backward.

Always use ORDER BY inside OVER()
to define the row sequence.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
