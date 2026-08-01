-- ==========================================================
-- Problem      : Rising Temperature
-- LeetCode ID  : 197
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : Self JOIN + Date Arithmetic
-- Concepts     : SELF JOIN, DATE_SUB(), DATEDIFF(), Filtering
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Find all dates where the temperature was higher than
the previous day's temperature.

Return the corresponding weather record IDs.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Weather
-------
id               INT
recordDate       DATE
temperature      INT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Join the Weather table with itself.
2. Match each record with the previous day's record.
3. Compare temperatures.
4. Return the IDs where today's temperature is higher
   than yesterday's.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    w1.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SELF JOIN compares rows within the same table.
• DATEDIFF(w1.recordDate, w2.recordDate) = 1 ensures
  that w2 represents the previous day.
• WHERE checks whether today's temperature is greater
  than yesterday's.
• The matching record IDs are returned.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use SELF JOIN whenever you need to compare rows
within the same table.

General Pattern:

SELECT ...
FROM Table t1
JOIN Table t2
ON comparison_condition
WHERE filter_condition;

Common Interview Questions:

✓ Today's sales vs yesterday's sales
✓ Consecutive login dates
✓ Rising/Falling temperatures
✓ Previous day's stock price
✓ Employee vs Manager
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
