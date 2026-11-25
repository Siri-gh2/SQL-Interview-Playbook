-- Day 10: SQL Joins — Reference Solutions
-- Run schema.sql first.

-- Q1. INNER JOIN
SELECT e.emp_id, e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- Q2. LEFT JOIN: preserve all employees
SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- Q3. RIGHT JOIN: preserve all departments
SELECT d.department_id, d.department_name, e.name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- Q4. Employees without a matching department
SELECT e.emp_id, e.name, e.department_id
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Q5. Count employees per department, including zero
SELECT d.department_id, d.department_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- Q6. CROSS JOIN: 8 x 4 = 32 combinations
SELECT e.name, d.department_name
FROM employees e
CROSS JOIN departments d;

-- Q7. FULL OUTER JOIN simulation with LEFT JOIN + RIGHT JOIN + UNION
SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
UNION
SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- Alternative Q7: LEFT JOIN plus unmatched departments only
SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
UNION ALL
SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.emp_id IS NULL;

-- Q8. IT employees earning more than 60000
SELECT e.emp_id, e.name, d.department_name, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'IT'
  AND e.salary > 60000;
