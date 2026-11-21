-- Day 6 practice schema for MySQL 8.0+
CREATE DATABASE IF NOT EXISTS sql_challenge;
USE sql_challenge;

DROP TABLE IF EXISTS employee_salary;

CREATE TABLE employee_salary (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employee_salary (emp_id, name, department, salary)
VALUES
(1, 'Siri',   'IT',      60000),
(2, 'Rahul',  'HR',      35000),
(3, 'Priya',  'IT',      75000),
(4, 'Arjun',  'Finance', 45000),
(5, 'Neha',   'HR',      55000),
(6, 'Kiran',  'IT',      40000),
(7, 'Anu',    'Finance', 80000),
(8, 'Ravi',   'IT',      50000);
