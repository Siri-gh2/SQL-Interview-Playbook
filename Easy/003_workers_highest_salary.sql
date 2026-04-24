-- ============================================
-- Problem: Workers With The Highest Salaries
-- Difficulty: Easy
-- Pattern: JOIN + SUBQUERY
-- Companies: Amazon,DoorDash
-- Source: StrataScratch
-- ============================================

/*
Problem Statement:
Management wants to analyze only employees with official job titles.

Find the job titles of the employees with the highest salary.
If multiple employees have the same highest salary, include all their job titles.
*/

-- ============================================
-- Dataset
-- ============================================

/*
Table: worker

Columns:
worker_id, first_name, last_name, salary, joining_date, department
*/

-- Sample Data (Partial)
-- worker_id | first_name | last_name | salary | department
-- 4         | Amitah     | Singh     | 500000 | Admin
-- 5         | Vivek      | Bhati     | 500000 | Admin
-- 13        | Jura       | Jomun     | 980000 | HR


/*
Table: title

Columns:
worker_ref_id, worker_title, affected_from
*/

-- Sample Data (Partial)
-- worker_ref_id | worker_title
-- 4             | Asst. Manager
-- 5             | Manager
-- 3             | Lead


-- ============================================
-- Solution
-- ============================================

SELECT DISTINCT 
    t.worker_title AS best_paid_title
FROM worker w
JOIN title t 
    ON w.worker_id = t.worker_ref_id
WHERE w.salary = (
    SELECT MAX(w2.salary)
    FROM worker w2
    JOIN title t2 
        ON w2.worker_id = t2.worker_ref_id
);


-- ============================================
-- Explanation
-- ============================================

/*
- Join ensures only employees with official titles are considered
- Subquery finds highest salary among those employees
- DISTINCT removes duplicate titles if multiple employees share same role
*/


-- ============================================
-- Output
-- ============================================

/*
best_paid_title
---------------
Asst. Manager
Manager
*/
