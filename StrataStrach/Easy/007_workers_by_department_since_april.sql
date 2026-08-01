-- ============================================
-- Problem: Workers by Department Since April
-- Question ID: 9847
-- Difficulty: Easy
-- Pattern: WHERE + GROUP BY + ORDER BY
-- Companies: Amazon
-- Source: StrataScratch
-- ============================================

/*
Problem Statement:
Find the number of workers by department who joined on or after April 1, 2014.

Output:
- department
- number_of_workers

Sort the results based on the number of workers in descending order.
*/

-- ============================================
-- Dataset
-- ============================================

/*
Table: worker

Columns:
worker_id, first_name, last_name,
salary, joining_date, department
*/

-- Sample Data (Partial)
-- worker_id | first_name | joining_date | department
-- 2         | Niharika   | 2014-06-11   | Admin
-- 5         | Vivek      | 2014-06-11   | Admin
-- 6         | Vipul      | 2014-06-11   | Account
-- 8         | Geetika    | 2014-04-11   | Admin
-- 9         | Agepi      | 2015-04-10   | Admin
-- 10        | Moe        | 2015-04-11   | HR


-- ============================================
-- Solution
-- ============================================

SELECT 
    department,
    COUNT(worker_id) AS number_of_workers
FROM worker
WHERE joining_date >= '2014-04-01'
GROUP BY department
ORDER BY number_of_workers DESC;


-- ============================================
-- Explanation
-- ============================================

/*
- WHERE filters workers who joined on or after April 1, 2014
- GROUP BY groups records by department
- COUNT(worker_id) counts workers in each department
- ORDER BY DESC sorts departments by highest worker count
*/


-- ============================================
-- Output
-- ============================================

/*
department | number_of_workers
--------------------------------
Admin      | 4
Account    | 1
HR         | 1
*/
