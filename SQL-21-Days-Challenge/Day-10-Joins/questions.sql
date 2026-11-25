-- Day 10: SQL Joins — Practice Questions
-- Run schema.sql first. Attempt these before opening solutions.sql.

-- Q1. INNER JOIN: display emp_id, name, department_name for matching rows.
--     Use aliases e and d.

-- Q2. LEFT JOIN: display all employees with department names, including
--     employees without a department. Display emp_id, name, department_name.

-- Q3. RIGHT JOIN: display all departments with employee names, including
--     departments with no employees. Display department_id, department_name, name.

-- Q4. Find employees without a matching department using LEFT JOIN and IS NULL.
--     Display emp_id, name, department_id.

-- Q5. Count employees in each department, including departments with zero
--     employees. Display department_id, department_name, employee_count.
--     Use LEFT JOIN, GROUP BY, and COUNT().

-- Q6. CROSS JOIN: display every combination of employee name and department
--     name. Expected result: 8 * 4 = 32 rows.

-- Q7. Simulate FULL OUTER JOIN in MySQL using LEFT JOIN, RIGHT JOIN, UNION.
--     Display emp_id, name, department_name, including all rows from both tables.

-- Q8. Find IT employees earning more than 60000 using INNER JOIN and WHERE.
--     Display emp_id, name, department_name, salary.
