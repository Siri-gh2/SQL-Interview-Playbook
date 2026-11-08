-- Day 01: Filtering with WHERE
-- Database: sql_21_days
-- Run schema.sql before running these queries.

USE sql_21_days;

-- Q1. Names and salaries of employees earning more than 50,000.
SELECT name, salary
FROM employees
WHERE salary > 50000;

-- Q2. Names and departments of IT employees earning at least 50,000.
SELECT name, department
FROM employees
WHERE department = 'IT'
  AND salary >= 50000;

-- Q3. Names and cities of employees in IT or Finance.
SELECT name, city
FROM employees
WHERE department = 'IT'
   OR department = 'Finance';

-- Q4. Names and salaries of employees earning between 40,000 and 60,000 (inclusive).
SELECT name, salary
FROM employees
WHERE salary BETWEEN 40000 AND 60000;

-- Q5. Names, departments, and cities of employees in HR or Finance.
SELECT name, department, city
FROM employees
WHERE department IN ('HR', 'Finance');

-- Q6. Names and departments of employees not in IT.
SELECT name, department
FROM employees
WHERE department NOT IN ('IT');

-- Q7. Names of employees without a manager assigned.
SELECT name
FROM employees
WHERE manager_id IS NULL;

-- Q8. Names, departments, and salaries of IT or HR employees earning more than 45,000.
SELECT name, department, salary
FROM employees
WHERE department IN ('IT', 'HR')
  AND salary > 45000;
