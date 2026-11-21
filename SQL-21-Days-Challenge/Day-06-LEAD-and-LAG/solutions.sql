-- Day 6: Reference solutions (MySQL 8.0+)
USE sql_challenge;

-- Q1. LAG()
SELECT emp_id, name, salary,
       LAG(salary) OVER (ORDER BY emp_id) AS previous_salary
FROM employee_salary;

-- Q2. LEAD()
SELECT emp_id, name, salary,
       LEAD(salary) OVER (ORDER BY emp_id) AS next_salary
FROM employee_salary;

-- Q3. LAG() with offset 2
SELECT emp_id, name, salary,
       LAG(salary, 2) OVER (ORDER BY emp_id) AS salary_two_employees_ago
FROM employee_salary;

-- Q4. LEAD() with offset 2
SELECT emp_id, name, salary,
       LEAD(salary, 2) OVER (ORDER BY emp_id) AS salary_two_employees_ahead
FROM employee_salary;

-- Q5. LAG() with default value 0
SELECT emp_id, name, salary,
       LAG(salary, 1, 0) OVER (ORDER BY emp_id) AS previous_salary
FROM employee_salary;

-- Q6. LEAD() with default value -1
SELECT emp_id, name, salary,
       LEAD(salary, 1, -1) OVER (ORDER BY emp_id) AS next_salary
FROM employee_salary;

-- Q7. LAG() within each department
SELECT emp_id, name, department, salary,
       LAG(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
       ) AS previous_salary
FROM employee_salary;

-- Q8. LAG() and LEAD() within each department
SELECT emp_id, name, department, salary,
       LAG(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
       ) AS previous_salary,
       LEAD(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
       ) AS next_salary
FROM employee_salary;
