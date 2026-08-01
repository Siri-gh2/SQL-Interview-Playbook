-- ==========================================================
-- Problem      : Primary Department for Each Employee
-- LeetCode ID  : 1789
-- Difficulty   : Easy
-- Category     : Basic Aggregate Functions
-- Pattern      : GROUP BY + HAVING + UNION
-- Concepts     : GROUP BY, HAVING, COUNT(), UNION ALL
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Each employee belongs to one or more departments.

Return the primary department for every employee.

Rules:
1. If an employee has only one department,
   that department is their primary department.
2. If an employee belongs to multiple departments,
   return the department where primary_flag = 'Y'.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employee
--------
employee_id     INT
department_id   INT
primary_flag    ENUM('Y','N')
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
There are two possible cases:

Case 1:
Employee belongs to only one department.
→ Return that department.

Case 2:
Employee belongs to multiple departments.
→ Return the department marked with primary_flag = 'Y'.

Combine both results using UNION ALL.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION ALL

SELECT
    employee_id,
    department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• The first query returns primary departments
  for employees with multiple departments.

• The second query finds employees belonging
  to exactly one department using HAVING COUNT(*) = 1.

• UNION ALL combines both result sets.

• UNION ALL is safe because an employee cannot
  satisfy both conditions simultaneously.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Handle Multiple Cases using UNION ALL

General Pattern:

SELECT ...
FROM table
WHERE condition1

UNION ALL

SELECT ...
FROM table
GROUP BY key
HAVING aggregate_condition;

Common Interview Questions:

✓ Primary Department
✓ VIP vs Regular Customers
✓ Active vs Inactive Users
✓ Different Business Rules
✓ Multiple Selection Criteria

Remember:

UNION
→ Removes duplicates.

UNION ALL
→ Keeps all rows and is faster.

Use UNION ALL whenever the two result sets
are guaranteed not to overlap.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
