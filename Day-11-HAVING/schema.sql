-- Day 11: HAVING practice schema (MySQL)
-- Warning: drops and recreates employees.

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (emp_id, name, department, salary) VALUES
(1, 'Ravi',   'IT',    50000),
(2, 'Priya',  'HR',    35000),
(3, 'Anu',    'IT',    65000),
(4, 'Rahul',  'Sales', 40000),
(5, 'Meera',  'HR',    45000),
(6, 'Kiran',  'Sales', 55000),
(7, 'Sneha',  'IT',    75000),
(8, 'Arjun',  'Sales', 30000),
(9, 'Divya',  'HR',    50000),
(10, 'Vikram','IT',    40000);
