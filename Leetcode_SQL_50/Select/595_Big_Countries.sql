-- ==========================================================
-- Problem      : Big Countries
-- LeetCode ID  : 595
-- Difficulty   : Easy
-- Category     : SELECT
-- Pattern      : WHERE + OR Condition
-- Concepts     : SELECT, WHERE, OR
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
A country is considered "big" if:
- It has an area of at least 3,000,000 km², OR
- It has a population of at least 25,000,000.

Return the name, population, and area of all big countries.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
World
-----
name         VARCHAR
continent    VARCHAR
area         INT
population   INT
gdp          BIGINT
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Select the required columns:
      - name
      - population
      - area
2. Filter countries where:
      - area >= 3000000, OR
      - population >= 25000000.
3. Return the matching countries.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    name,
    population,
    area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• SELECT retrieves only the required columns.
• WHERE filters the rows based on the problem conditions.
• OR ensures that a country is selected if either
  of the two conditions is true.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use OR when satisfying any one of multiple conditions
is enough to include a row.

General Pattern:

SELECT columns
FROM table
WHERE condition1
   OR condition2;

Examples:
✓ salary > 100000 OR experience > 10
✓ marks >= 90 OR grade = 'A'
✓ area >= 3000000 OR population >= 25000000
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
