-- Day 09: CTE Reference Solutions
-- Run schema.sql first.

-- Q1. Basic CTE with WHERE
WITH high_salary AS (
    SELECT emp_id, name, department, salary
    FROM employees
    WHERE salary > 45000
)
SELECT *
FROM high_salary;

-- Q2. CTE with filtering and final ORDER BY
WITH it_employees AS (
    SELECT emp_id, name, salary
    FROM employees
    WHERE department = 'IT'
)
SELECT *
FROM it_employees
ORDER BY salary DESC;

-- Q3. CTE with AVG() and GROUP BY
WITH department_salary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_salary
ORDER BY avg_salary DESC;

-- Q4. CTE with MAX() and MIN()
WITH salary_stats AS (
    SELECT department, MAX(salary) AS max_salary, MIN(salary) AS min_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM salary_stats
ORDER BY max_salary DESC;

-- Q5. CTE with GROUP BY and HAVING
WITH department_summary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 45000
)
SELECT *
FROM department_summary;

-- Q6. Filter rows before grouping
WITH experienced_employees AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    WHERE joining_date < '2022-01-01'
    GROUP BY department
)
SELECT *
FROM experienced_employees
ORDER BY avg_salary DESC;

-- Q7. Multiple CTEs
WITH department_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
high_avg_departments AS (
    SELECT *
    FROM department_avg
    WHERE avg_salary > 45000
)
SELECT *
FROM high_avg_departments
ORDER BY avg_salary DESC;

-- Q8. CTE with JOIN
WITH department_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT
    e.emp_id,
    e.name,
    e.department,
    e.salary,
    d.avg_salary
FROM department_avg AS d
JOIN employees AS e
    ON d.department = e.department
WHERE e.salary > d.avg_salary
ORDER BY e.salary DESC;
