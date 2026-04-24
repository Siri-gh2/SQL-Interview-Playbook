-- ============================================
-- Problem: Salary Difference Between Departments
-- Question ID : 10308
-- Difficulty: Easy
-- Pattern: CASE WHEN + AGGREGATION
-- Source: StrataScratch
-- Companies: Linkedin,DropBox
-- ============================================

/*
Problem Statement:
Calculate the difference between the highest salaries in the marketing 
and engineering departments. Output only the absolute difference.
*/

-- ============================================
-- Dataset
-- ============================================

/*
Table: db_employee
Columns:
id, first_name, last_name, salary, department_id
*/

-- Sample Data (Partial)
-- id | first_name | last_name | salary | department_id
-- 10301 | Keith | Morgan | 27056 | 2
-- 10302 | Tyler | Booth | 32199 | 3
-- 10307 | Joseph | Solomon | 19945 | 1
-- 10317 | Pamela | Rodriguez | 48187 | 4
-- ...

/*
Table: db_dept
Columns:
id, department
*/

-- Data
-- 1 | engineering
-- 2 | human resource
-- 3 | operation
-- 4 | marketing
-- 5 | sales
-- 6 | customer care


-- ============================================
-- Solution
-- ============================================

SELECT 
    ABS(
        MAX(CASE WHEN d.department = 'marketing' THEN e.salary END)
        -
        MAX(CASE WHEN d.department = 'engineering' THEN e.salary END)
    ) AS salary_difference
FROM db_employee e
JOIN db_dept d
ON e.department_id = d.id;


-- ============================================
-- Explanation
-- ============================================

/*
- CASE WHEN filters salaries by department
- MAX gets the highest salary in each department
- Subtraction gives the difference
- ABS ensures the result is positive
*/


-- ============================================
-- Output
-- ============================================

/*
salary_difference
-----------------
2400
*/
