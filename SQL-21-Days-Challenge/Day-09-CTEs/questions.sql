-- Day 09: CTE Practice Questions
-- Run schema.sql first. Attempt these before opening solutions.sql.

-- Q1. Create a CTE named high_salary to retrieve employees earning more
--     than 45000. Display emp_id, name, department, and salary.

-- Q2. Create a CTE named it_employees to retrieve IT employees.
--     Display emp_id, name, and salary. Sort salary descending.

-- Q3. Create a CTE named department_salary to calculate the average salary
--     of each department. Display department and avg_salary. Sort descending.

-- Q4. Create a CTE named salary_stats to calculate the maximum and minimum
--     salary in each department. Display department, max_salary, min_salary.
--     Sort by max_salary descending.

-- Q5. Create a CTE named department_summary to calculate average salary
--     per department. Display only departments with average salary > 45000.
--     Use GROUP BY and HAVING inside the CTE.

-- Q6. Create a CTE named experienced_employees. Filter employees who joined
--     before 2022-01-01, then calculate average salary per department.
--     Display department and avg_salary. Sort descending.

-- Q7. Define two CTEs:
--     department_avg: average salary for each department.
--     high_avg_departments: departments whose average salary is > 45000,
--     using the first CTE. Display department and avg_salary, sorted descending.

-- Q8. Create department_avg to calculate average salary per department.
--     JOIN it with employees and display employees earning more than their
--     own department's average salary.
--     Display emp_id, name, department, salary, avg_salary.
--     Sort by salary descending.
