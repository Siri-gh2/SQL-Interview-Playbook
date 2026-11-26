-- Day 11: HAVING practice questions
-- Run schema.sql first. Attempt these before checking solutions.sql.

-- Q1. Find departments with more than 2 employees.
-- Display department, employee_count. Use GROUP BY, COUNT(), HAVING.

-- Q2. Find departments whose average salary is greater than 50000.
-- Display department, avg_salary.

-- Q3. Find departments whose total salary exceeds 150000.
-- Display department, total_salary.

-- Q4. Find departments where maximum salary > 60000
-- and minimum salary < 40000.
-- Display department, highest_salary, lowest_salary.

-- Q5. Consider only employees earning > 40000.
-- Find departments whose average salary among those employees > 55000.
-- Display department, avg_salary. Use WHERE, GROUP BY, HAVING.

-- Q6. Find departments with at least 3 employees and total salary > 150000.
-- Display department, employee_count, total_salary.

-- Q7. Find departments with at least 3 employees and average salary > 45000.
-- Display department, employee_count, avg_salary.

-- Q8. Find departments where at least 2 employees earn > 40000,
-- and the department's overall average salary > 45000.
-- Display department, high_salary_count, avg_salary.
-- Use SUM(CASE WHEN ... THEN 1 ELSE 0 END) for conditional aggregation.
