-- Day 2 schema and sample data
-- Run this script in MySQL.

CREATE DATABASE IF NOT EXISTS sql_21_days;
USE sql_21_days;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50),
    manager_id INT NULL
);

INSERT INTO employees
(emp_id, name, department, salary, age, city, manager_id)
VALUES
(1, 'Siri',  'IT',      60000, 21, 'Vizag',     101),
(2, 'Rahul', 'HR',      35000, 24, 'Hyderabad', NULL),
(3, 'Priya', 'IT',      75000, 25, 'Chennai',   102),
(4, 'Arjun', 'Finance', 45000, 23, 'Vizag',     NULL),
(5, 'Neha',  'HR',      55000, 26, 'Bangalore', 103),
(6, 'Kiran', 'IT',      40000, 22, 'Hyderabad', NULL),
(7, 'Anu',   'Finance', 80000, 28, 'Chennai',   104),
(8, 'Ravi',  'IT',      50000, 24, 'Vizag',     101);
