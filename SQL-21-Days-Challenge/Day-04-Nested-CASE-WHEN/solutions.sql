-- Day 04 reference solutions
-- Run schema.sql first. The optional NULL test row in schema.sql can be
-- enabled to test the explicit NULL-handling cases.

-- Q1
SELECT
    emp_id, name, department, salary,
    CASE
        WHEN department = 'IT' THEN
            CASE
                WHEN salary >= 60000 THEN 'IT Senior'
                ELSE 'IT Junior'
            END
        WHEN department = 'HR' THEN
            CASE
                WHEN salary >= 50000 THEN 'HR Senior'
                ELSE 'HR Junior'
            END
        ELSE 'Other Department'
    END AS employee_category
FROM employees;

-- Q2
SELECT
    name, department, salary, age,
    CASE
        WHEN department = 'IT' THEN
            CASE
                WHEN salary >= 60000 THEN
                    CASE
                        WHEN age >= 25 THEN 'High IT Bonus'
                        ELSE 'Medium IT Bonus'
                    END
                ELSE 'Low IT Bonus'
            END
        WHEN department = 'HR' THEN
            CASE
                WHEN salary >= 50000 THEN 'HR Bonus'
                ELSE 'No Bonus'
            END
        ELSE 'Not Eligible'
    END AS bonus_category
FROM employees;

-- Q3
WITH cte AS (
    SELECT
        department,
        CASE
            WHEN salary >= 60000 THEN
                CASE
                    WHEN age >= 25 THEN 'Top Performer'
                    ELSE 'Good Performer'
                END
            ELSE
                CASE
                    WHEN age >= 25 THEN 'Average Performer'
                    ELSE 'Beginner'
                END
        END AS performance_category,
        COUNT(emp_id) AS employee_count
    FROM employees
    GROUP BY department, performance_category
)
SELECT department, performance_category, employee_count
FROM cte;

-- Q4
WITH cte AS (
    SELECT
        name, salary, age,
        CASE
            WHEN salary IS NULL THEN 'Salary Not Available'
            WHEN salary >= 60000 THEN
                CASE
                    WHEN age >= 25 THEN 'High'
                    ELSE 'Medium'
                END
            ELSE
                CASE
                    WHEN age >= 25 THEN 'Low'
                    ELSE 'Very Low'
                END
        END AS salary_status
    FROM employees
)
SELECT name, salary, age, salary_status
FROM cte;

-- Q5
WITH cte AS (
    SELECT
        department,
        CASE
            WHEN salary >= 60000 THEN
                CASE
                    WHEN age >= 25 THEN 'High Category'
                    ELSE 'Medium Category'
                END
            ELSE 'Low Category'
        END AS salary_category,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department, salary_category
)
SELECT department, salary_category, average_salary
FROM cte;

-- Q6
SELECT emp_id, name, department, salary
FROM employees
ORDER BY
    CASE
        WHEN department = 'IT' THEN 1
        WHEN department = 'HR' THEN 2
        WHEN department = 'Finance' THEN 3
        ELSE 4
    END,
    salary DESC;

-- Q7
WITH cte AS (
    SELECT
        emp_id, name, department, salary,
        CASE
            WHEN department = 'IT' THEN
                CASE
                    WHEN salary >= 60000 THEN
                        CASE
                            WHEN age >= 25 THEN 'IT Excellent'
                            ELSE 'IT Good'
                        END
                    WHEN salary BETWEEN 40000 AND 59999 THEN 'IT Average'
                    ELSE 'IT Needs Improvement'
                END
            WHEN department = 'HR' THEN
                CASE
                    WHEN salary >= 50000 THEN 'HR Excellent'
                    ELSE 'HR Average'
                END
            WHEN department = 'Finance' THEN 'Finance Review'
            ELSE 'General Review'
        END AS review_category
    FROM employees
)
SELECT emp_id, name, department, salary, review_category
FROM cte;

-- Q8
WITH cte AS (
    SELECT
        department,
        CASE
            WHEN salary IS NULL THEN 'Unknown'
            WHEN salary >= 70000 THEN 'Excellent'
            WHEN salary >= 50000 THEN 'Good'
            WHEN salary >= 35000 THEN 'Average'
            ELSE 'Needs Improvement'
        END AS performance_level,
        COUNT(emp_id) AS employee_count,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department, performance_level
)
SELECT department, performance_level, employee_count, average_salary
FROM cte
ORDER BY department, performance_level;
