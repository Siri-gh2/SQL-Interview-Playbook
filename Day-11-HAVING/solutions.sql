-- Day 11: Reference solutions (MySQL)
-- Run schema.sql first.

-- Q1
SELECT department, COUNT(emp_id) AS employee_count
FROM employees
GROUP BY department
HAVING employee_count > 2;

-- Q2
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 50000;

-- Q3
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 150000;

-- Q4
SELECT department,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employees
GROUP BY department
HAVING highest_salary > 60000
   AND lowest_salary < 40000;

-- Q5
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING avg_salary > 55000;

-- Q6
SELECT department,
       COUNT(emp_id) AS employee_count,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING employee_count >= 3
   AND total_salary > 150000;

-- Q7
SELECT department,
       COUNT(emp_id) AS employee_count,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING employee_count >= 3
   AND avg_salary > 45000;

-- Q8
SELECT department,
       SUM(CASE WHEN salary > 40000 THEN 1 ELSE 0 END) AS high_salary_count,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING high_salary_count >= 2
   AND avg_salary > 45000;
