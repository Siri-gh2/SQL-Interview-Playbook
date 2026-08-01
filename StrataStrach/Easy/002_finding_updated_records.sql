-- ============================================
-- Problem: Finding Updated Records
-- Question ID : 10299
-- Difficulty: Easy
-- Pattern: GROUP BY / WINDOW FUNCTION
-- Source: StrataScratch
-- Companies : Microsoft
-- ============================================

/*
Problem Statement:
We have a table with employees and their salaries; however, some records
contain outdated salary information.

Since there is no timestamp, assume salary is non-decreasing over time.

The current salary for each employee is the maximum salary value among their records.

If multiple records share the same maximum salary, return any one of them.

Output:
id, first_name, last_name, department_id, current_salary

Order the result by employee id in ascending order.
*/

-- ============================================
-- Dataset
-- ============================================

/*
Table: ms_employee_salary

Columns:
id, first_name, last_name, salary, department_id
*/

-- Sample Data (Partial)
-- id | first_name | last_name | salary | department_id
-- 1  | Todd       | Wilson    | 110000 | 1006
-- 1  | Todd       | Wilson    | 106119 | 1006
-- 2  | Justin     | Simon     | 128922 | 1005
-- 2  | Justin     | Simon     | 130000 | 1005
-- 9  | Christy    | Mitchell  | 150000 | 1001
-- ...


-- ============================================
-- Solution 1: GROUP BY
-- ============================================

SELECT 
    id,
    first_name,
    last_name,
    department_id,
    MAX(salary) AS current_salary
FROM ms_employee_salary
GROUP BY id, first_name, last_name, department_id
ORDER BY id;


-- ============================================
-- Solution 2: WINDOW FUNCTION (Preferred)
-- ============================================

WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC) AS rk
    FROM ms_employee_salary
)
SELECT 
    id,
    first_name,
    last_name,
    department_id,
    salary AS current_salary
FROM cte
WHERE rk = 1
ORDER BY id;


-- ============================================
-- Explanation
-- ============================================

/*
Solution 1:
- GROUP BY groups records per employee
- MAX(salary) gives latest (highest) salary

Solution 2:
- ROW_NUMBER ranks salaries per employee (highest first)
- rk = 1 picks the latest salary record
- More flexible and interview-preferred approach
*/


-- ============================================
-- Output (Sample)
-- ============================================

/*
id | first_name | last_name | department_id | current_salary
------------------------------------------------------------
1  | Todd       | Wilson    | 1006          | 110000
2  | Justin     | Simon     | 1005          | 130000
3  | Kelly      | Rosario   | 1002          | 42689
...
*/
