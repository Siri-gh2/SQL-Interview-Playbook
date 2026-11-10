-- Day 3 — Solutions
USE sql_21_days;

-- Q1
SELECT name, salary,
       CASE WHEN salary >= 60000 THEN 'High' ELSE 'Low' END AS salary_status
FROM employees;

-- Q2
SELECT name, salary,
       CASE
           WHEN salary >= 70000 THEN 'Very High'
           WHEN salary >= 50000 THEN 'High'
           ELSE 'Low'
       END AS salary_category
FROM employees;

-- Q3
SELECT
    CASE WHEN salary >= 60000 THEN 'High' ELSE 'Low' END AS salary_category,
    COUNT(emp_id) AS employee_count
FROM employees
GROUP BY CASE WHEN salary >= 60000 THEN 'High' ELSE 'Low' END;

-- Q4
WITH mycte AS (
    SELECT salary,
           CASE WHEN salary >= 60000 THEN 'High' ELSE 'Low' END AS salary_category
    FROM employees
)
SELECT salary_category, SUM(salary) AS total_salary
FROM mycte
GROUP BY salary_category;

-- Q5
SELECT department,
       SUM(CASE WHEN salary >= 60000 THEN 1 ELSE 0 END) AS high_salary_count,
       SUM(CASE WHEN salary < 60000 THEN 1 ELSE 0 END) AS low_salary_count
FROM employees
GROUP BY department;

-- Q6
SELECT name, department, salary,
       CASE
           WHEN department = 'IT' THEN
               CASE WHEN salary >= 60000 THEN 'IT - Senior' ELSE 'IT - Junior' END
           WHEN department = 'HR' THEN
               CASE WHEN salary >= 50000 THEN 'HR - Senior' ELSE 'HR - Junior' END
           ELSE 'Other'
       END AS employee_category
FROM employees;

-- Q7
SELECT department,
       COUNT(CASE WHEN salary >= 60000 THEN emp_id END) AS high_count,
       COUNT(CASE WHEN salary < 60000 THEN emp_id END) AS low_count
FROM employees
GROUP BY department;

-- Q8
WITH salcte AS (
    SELECT department, emp_id, salary,
           CASE
               WHEN salary >= 60000 THEN 'High'
               WHEN salary >= 40000 THEN 'Medium'
               ELSE 'Low'
           END AS salary_category
    FROM employees
)
SELECT department, salary_category,
       COUNT(emp_id) AS employee_count,
       AVG(salary) AS avg_salary
FROM salcte
GROUP BY department, salary_category;
