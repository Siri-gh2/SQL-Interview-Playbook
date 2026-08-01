-- ==========================================================
-- Problem      : Last Person to Fit in the Bus
-- LeetCode ID  : 1204
-- Difficulty   : Medium
-- Category     : Window Functions
-- Pattern      : Running Sum + Window Function
-- Concepts     : SUM() OVER(), ORDER BY, Window Functions
-- Time         : O(n log n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
The bus can carry a maximum total weight of 1000.

Passengers board the bus in ascending order of turn.

Return the name of the last person who can board
without exceeding the weight limit.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Queue
-----
person_id    INT
person_name  VARCHAR
weight       INT
turn         INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Sort passengers by turn.
2. Compute the running (cumulative) sum of weights
   using SUM() OVER().
3. Keep only rows where the running weight is
   less than or equal to 1000.
4. Return the last passenger based on turn.
*/

-- ==========================================================
-- Solution
-- ==========================================================

WITH cte AS (
    SELECT
        person_name,
        turn,
        SUM(weight) OVER (
            ORDER BY turn
        ) AS total_weight
    FROM Queue
)

SELECT
    person_name
FROM cte
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SUM(weight) OVER (ORDER BY turn)
  calculates the cumulative weight as passengers board.

• WHERE total_weight <= 1000
  keeps only passengers who can still fit.

• ORDER BY turn DESC
  brings the last valid passenger to the top.

• LIMIT 1 returns the required answer.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Running Sum (Prefix Sum)

General Pattern:

SUM(column)
OVER(
    ORDER BY column
)

Common Interview Questions:

✓ Running Total
✓ Cumulative Salary
✓ Bank Balance
✓ Inventory Tracking
✓ Bus Capacity
✓ Sales Progress

Common Window Functions:

SUM() OVER()
AVG() OVER()
COUNT() OVER()
ROW_NUMBER()
RANK()
DENSE_RANK()
LEAD()
LAG()

Remember:

Aggregate Function:
SUM(weight)
→ One result for each group.

Window Function:
SUM(weight) OVER(...)
→ Running result for every row.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n log n)
(ORDER BY for window function)

Space Complexity: O(n)
*/
