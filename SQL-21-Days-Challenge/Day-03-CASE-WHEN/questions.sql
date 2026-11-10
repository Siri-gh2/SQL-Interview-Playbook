-- Day 3 — CASE WHEN questions
-- Use the employees table created by schema.sql.
-- Try these before checking solutions.sql.

-- Q1. Display name, salary, and salary_status:
--     salary >= 60000 => High; otherwise Low.

-- Q2. Display name, salary, and salary_category:
--     salary >= 70000 => Very High
--     salary >= 50000 => High
--     otherwise => Low.

-- Q3. Count employees in each salary category:
--     salary >= 60000 => High; otherwise Low.
--     Display salary_category and employee_count.

-- Q4. Find total salary paid to High and Low salary categories:
--     salary >= 60000 => High; otherwise Low.
--     Display salary_category and total_salary.

-- Q5. For each department, count employees earning >= 60000 and
--     employees earning < 60000. Use SUM(CASE WHEN ...) for counts.

-- Q6. Use nested CASE to classify employees:
--     IT: salary >= 60000 => IT - Senior; otherwise IT - Junior
--     HR: salary >= 50000 => HR - Senior; otherwise HR - Junior
--     Other departments => Other.
--     Display name, department, salary, employee_category.

-- Q7. For each department, count employees earning >= 60000 and
--     employees earning < 60000. Use COUNT(CASE WHEN ...) for counts.

-- Q8. Use a CTE to classify salaries:
--     >= 60000 => High
--     >= 40000 and < 60000 => Medium
--     otherwise => Low.
--     Then display department, salary_category, employee_count, avg_salary.
