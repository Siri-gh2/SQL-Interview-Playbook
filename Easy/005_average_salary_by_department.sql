-- ============================================
-- Problem: Average Salaries
-- Question ID: 9917
-- Difficulty: Easy
-- Pattern: CTE + AGGREGATION + JOIN
-- Companies: Salesforce, Glassdoor
-- Source: StrataScratch
-- ============================================

/*
Problem Statement:
Compare each employee's salary with the average salary of their department.

Output:
- department
- first_name
- salary
- avg_salary (average salary of that department)

Order the result by department.
*/

-- ============================================
-- Dataset
-- ============================================

/*
Table: employee

Columns:
id, first_name, last_name, age, sex, employee_title,
department, salary, target, bonus, email, city, address, manager_id
*/

-- Sample Data (Partial)
-- first_name | department | salary
-- Max        | Sales      | 1300
-- Katty      | Management | 150000
-- Shandler   | Audit      | 1100
-- ...


-- ============================================
-- Solution (CTE Approach)
-- ============================================

WITH dept_avg AS (
    SELECT 
        department,
        AVG(salary) AS avg_salary
    FROM employee
    GROUP BY department
)

SELECT 
    e.department,
    e.first_name,
    e.salary,
    ROUND(d.avg_salary, 2) AS avg_salary
FROM employee e
JOIN dept_avg d
    ON e.department = d.department
ORDER BY e.department;


-- ============================================
-- Alternative (Window Function - Better)
-- ============================================

SELECT 
    department,
    first_name,
    salary,
    ROUND(AVG(salary) OVER (PARTITION BY department), 2) AS avg_salary
FROM employee
ORDER BY department;


-- ============================================
-- Explanation
-- ============================================

/*
CTE Approach:
- Calculate avg salary per department
- Join back with employee table

Window Function:
- AVG() OVER(PARTITION BY department) calculates avg without grouping
- Cleaner and more interview-preferred
*/


-- ============================================
-- Output (Sample)
-- ============================================

/*
department | first_name | salary | avg_salary
------------------------------------------------
Audit      | Shandler   | 1100   | 950
Management | Katty      | 150000 | 175000
Sales      | Max        | 1300   | 1336.36
...
*/
