-- Day 09: Common Table Expressions (CTEs) — MySQL practice schema

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees (emp_id, name, department, salary, joining_date)
VALUES
(1, 'Ravi',   'IT',    50000, '2022-01-10'),
(2, 'Priya',  'HR',    35000, '2021-05-15'),
(3, 'Anu',    'IT',    65000, '2020-03-20'),
(4, 'Rahul',  'Sales', 40000, '2023-07-01'),
(5, 'Meera',  'HR',    45000, '2022-11-12'),
(6, 'Kiran',  'Sales', 55000, '2021-09-18'),
(7, 'Sneha',  'IT',    75000, '2019-06-25'),
(8, 'Arjun',  'Sales', 30000, '2024-02-14');

SELECT * FROM employees;
