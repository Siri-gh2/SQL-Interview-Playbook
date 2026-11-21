-- Day 6: LEAD() and LAG() — 8 practice questions
USE sql_challenge;

-- Q1. Display emp_id, name, salary, and previous_salary.
--     Retrieve the previous employee's salary by ascending emp_id.
--     Use LAG().

-- Q2. Display emp_id, name, salary, and next_salary.
--     Retrieve the next employee's salary by ascending emp_id.
--     Use LEAD().

-- Q3. Display emp_id, name, salary, and salary_two_employees_ago.
--     Retrieve the salary from 2 rows before, ordered by emp_id.
--     Use LAG() with offset 2.

-- Q4. Display emp_id, name, salary, and salary_two_employees_ahead.
--     Retrieve the salary from 2 rows after, ordered by emp_id.
--     Use LEAD() with offset 2.

-- Q5. Display emp_id, name, salary, and previous_salary.
--     Retrieve the previous salary by emp_id; if no previous row exists,
--     return 0. Use LAG() with its third argument.

-- Q6. Display emp_id, name, salary, and next_salary.
--     Retrieve the next salary by emp_id; if no next row exists,
--     return -1. Use LEAD() with its third argument.

-- Q7. Display emp_id, name, department, salary, and previous_salary.
--     Retrieve the previous salary within the same department,
--     ordered by emp_id. Use LAG() and PARTITION BY.

-- Q8. Display emp_id, name, department, salary, previous_salary,
--     and next_salary.
--     Retrieve previous and next salaries within the same department,
--     ordered by emp_id. Use both LAG() and LEAD() with PARTITION BY.
