-- ==========================================================
-- Problem      : Average Time of Process per Machine
-- LeetCode ID  : 1661
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : SELF JOIN + GROUP BY + AVG()
-- Concepts     : SELF JOIN, Aggregate Functions, GROUP BY, ROUND()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Each machine performs multiple processes.

For every process:
- One row records the start time.
- Another row records the end time.

Find the average processing time for each machine.

Round the result to 3 decimal places.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Activity
--------
machine_id     INT
process_id     INT
activity_type  ENUM('start', 'end')
timestamp      FLOAT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. SELF JOIN the Activity table.
2. Match the start and end records using:
      - machine_id
      - process_id
3. Compute the processing time:
      end.timestamp - start.timestamp
4. Find the average processing time for each machine.
5. Round the answer to 3 decimal places.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id
WHERE a1.activity_type = 'start'
AND a2.activity_type = 'end'
GROUP BY a1.machine_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SELF JOIN pairs each "start" record with its corresponding
  "end" record.
• The join is performed using machine_id and process_id.
• Processing time is calculated as:
      end_timestamp - start_timestamp
• AVG() computes the average processing time for each machine.
• ROUND(..., 3) formats the result to three decimal places.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use SELF JOIN when related information exists as multiple
rows in the same table.

General Pattern:

SELECT ...
FROM Table t1
JOIN Table t2
ON t1.key = t2.key
WHERE t1.type = 'A'
AND t2.type = 'B';

Common Interview Questions:

✓ Start and End events
✓ Login and Logout records
✓ Entry and Exit times
✓ Temperature comparisons
✓ Previous/Next row comparisons
✓ Employee ↔ Manager relationships
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
