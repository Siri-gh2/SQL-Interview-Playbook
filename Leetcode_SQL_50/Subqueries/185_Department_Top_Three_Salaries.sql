-- ==========================================================
-- Problem      : Department Top Three Salaries
-- LeetCode ID  : 185
-- Difficulty   : Hard
-- Category     : Window Functions
-- Pattern      : DENSE_RANK() + JOIN
-- Concepts     : DENSE_RANK(), PARTITION BY, Window Functions, JOIN
-- Time         : O(n log n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
Find employees who have one of the top three unique
highest salaries in each department.

Return:
- Department
- Employee
- Salary

If multiple employees have the same salary,
they should share the same rank.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Employee
--------
id             INT
name           VARCHAR
salary         INT
departmentId   INT

Department
----------
id             INT
name           VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Join Employee with Department.
2. Use DENSE_RANK() to rank salaries within
   each department.
3. Partition by department so ranking restarts
   for every department.
4. Keep only employees with rank <= 3.
*/

-- ==========================================================
-- Solution
-- ==========================================================

WITH ranked AS
(
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER(
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)

SELECT
    Department,
    Employee,
    Salary
FROM ranked
WHERE rnk <= 3;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• PARTITION BY departmentId creates separate rankings
  for each department.

• ORDER BY salary DESC ranks salaries from highest
  to lowest.

• DENSE_RANK() assigns the same rank to equal salaries.

Example:

Salary
90000
90000
85000
80000

Dense Rank
1
1
2
3

• Employees having rank <= 3 are returned.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Top K Records Per Group

General Pattern:

WITH cte AS
(
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY group_column
               ORDER BY value DESC
           ) AS rnk
    FROM table
)

SELECT *
FROM cte
WHERE rnk <= K;

Common Interview Questions:

✓ Top 3 Salaries per Department
✓ Top N Products per Category
✓ Highest Marks per Class
✓ Best Selling Products
✓ Highest Revenue per Region
✓ Leaderboard Rankings

Remember:

ROW_NUMBER()
→ No ties.

RANK()
→ Skips ranks after ties.

DENSE_RANK()
→ No skipped ranks (best for Top K problems).

Top K per group almost always uses:

PARTITION BY + DENSE_RANK()
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n log n)
Space Complexity: O(n)
*/
