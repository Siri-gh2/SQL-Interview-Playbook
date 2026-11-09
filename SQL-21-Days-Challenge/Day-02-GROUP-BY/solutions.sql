-- Day 2 — Solutions
USE sql_21_days;

-- Q1. Employee count by department
SELECT department, COUNT(emp_id) AS employee_count
FROM employees
GROUP BY department;

-- Q2. Total salary by department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Q3. Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- Q4. Highest and lowest salary by department
SELECT
    department,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

-- Q5. Employee count by department and city
SELECT
    department,
    city,
    COUNT(emp_id) AS employee_count
FROM employees
GROUP BY department, city;

-- Q6. Total salary by department for employees earning > 45000
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE salary > 45000
GROUP BY department;

-- Q7. Departments with average salary > 50000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- Q8. Departments with at least 2 employees
SELECT
    department,
    COUNT(emp_id) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING COUNT(emp_id) >= 2;
