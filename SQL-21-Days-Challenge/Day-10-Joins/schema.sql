-- Day 10: SQL Joins — MySQL practice schema
-- Arjun has no department; Marketing has no employees.

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1, 'IT'), (2, 'HR'), (3, 'Sales'), (4, 'Marketing');

INSERT INTO employees VALUES
(1, 'Ravi', 50000, 1),
(2, 'Priya', 35000, 2),
(3, 'Anu', 65000, 1),
(4, 'Rahul', 40000, 3),
(5, 'Meera', 45000, 2),
(6, 'Kiran', 55000, 3),
(7, 'Sneha', 75000, 1),
(8, 'Arjun', 30000, NULL);

SELECT * FROM departments;
SELECT * FROM employees;
