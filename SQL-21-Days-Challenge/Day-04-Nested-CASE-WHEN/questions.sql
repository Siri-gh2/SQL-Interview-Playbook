-- Day 04: Nested CASE WHEN
-- Attempt each question before checking solutions.sql.

-- Q1. Classify employees:
-- IT: salary >= 60000 => IT Senior; otherwise IT Junior.
-- HR: salary >= 50000 => HR Senior; otherwise HR Junior.
-- Other departments => Other Department.
-- Output: emp_id, name, department, salary, employee_category.
-- Requirement: nested CASE WHEN.

-- Q2. Bonus classification:
-- IT: salary >= 60000 => age >= 25: High IT Bonus; otherwise Medium IT Bonus.
--     salary < 60000 => Low IT Bonus.
-- HR: salary >= 50000 => HR Bonus; otherwise No Bonus.
-- Other departments => Not Eligible.
-- Output: name, department, salary, age, bonus_category.
-- Requirement: nested CASE with three decision levels where applicable.

-- Q3. Count employees by department and performance category:
-- salary >= 60000: age >= 25 => Top Performer; otherwise Good Performer.
-- salary < 60000: age >= 25 => Average Performer; otherwise Beginner.
-- Output: department, performance_category, employee_count.
-- Requirement: CTE, nested CASE, GROUP BY, COUNT().

-- Q4. Salary status:
-- salary IS NULL => Salary Not Available.
-- Otherwise, salary >= 60000: age >= 25 => High; otherwise Medium.
-- salary < 60000: age >= 25 => Low; otherwise Very Low.
-- Output: name, salary, age, salary_status.
-- Requirement: nested CASE and explicit NULL handling.

-- Q5. Average salary by department and salary category:
-- salary >= 60000: age >= 25 => High Category; otherwise Medium Category.
-- salary < 60000 => Low Category.
-- Output: department, salary_category, average_salary.
-- Requirement: CTE, nested CASE, GROUP BY, AVG().

-- Q6. Custom sort priority:
-- IT first, HR second, Finance third, all other departments last.
-- Within each department, salary descending.
-- Output: emp_id, name, department, salary.
-- Requirement: CASE inside ORDER BY.

-- Q7. Annual review category:
-- IT: salary >= 60000: age >= 25 => IT Excellent; otherwise IT Good.
--     salary between 40000 and 59999 => IT Average.
--     salary below 40000 => IT Needs Improvement.
-- HR: salary >= 50000 => HR Excellent; otherwise HR Average.
-- Finance => Finance Review.
-- Other departments => General Review.
-- Output: emp_id, name, department, salary, review_category.
-- Requirement: nested CASE and CTE.

-- Q8. Independent challenge:
-- salary IS NULL => Unknown.
-- salary >= 70000 => Excellent.
-- salary >= 50000 => Good.
-- salary >= 35000 => Average.
-- otherwise => Needs Improvement.
-- Group by department and performance_level.
-- Output: department, performance_level, employee_count, average_salary.
-- Requirement: CTE, CASE, COUNT(), AVG(), GROUP BY, ORDER BY.
