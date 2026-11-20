-- Day 5 schema and sample data for MySQL.
-- Run this file before attempting questions.

CREATE DATABASE IF NOT EXISTS sql_challenge;
USE sql_challenge;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    age INT,
    city VARCHAR(50),
    manager_id INT NULL,
    email VARCHAR(100) NULL,
    phone VARCHAR(20) NULL,
    alternate_phone VARCHAR(20) NULL,
    commission DECIMAL(10, 2) NULL
);

INSERT INTO employees
(emp_id, name, department, salary, age, city, manager_id,
 email, phone, alternate_phone, commission)
VALUES
(1, 'Siri',  'IT',      60000, 21, 'Vizag',     101, 'siri@example.com',  '9000000001', NULL, 5000),
(2, 'Rahul', 'HR',      35000, 24, 'Hyderabad', NULL, NULL,               '9000000002', NULL, 2000),
(3, 'Priya', 'IT',      75000, 25, 'Chennai',   102, 'priya@example.com', NULL,          NULL, NULL),
(4, 'Arjun', 'Finance', 45000, 23, 'Vizag',     NULL, NULL,               NULL,          NULL, 7000),
(5, 'Neha',  'HR',      55000, 26, 'Bangalore', 103, 'neha@example.com',  '9000000005', '8000000005', 0),
(6, 'Kiran', 'IT',      40000, 22, 'Hyderabad', NULL, NULL,               NULL,          '8000000006', 15000),
(7, 'Anu',   'Finance', 80000, 28, 'Chennai',   104, 'anu@example.com',   NULL,          NULL, 10000),
(8, 'Ravi',  'IT',      50000, 24, 'Vizag',     101, NULL,               '9000000008', NULL, NULL),
(9, 'Meera', 'IT',      NULL, 26, 'Vizag',     NULL, NULL,               NULL,          NULL, NULL);

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    employee_id INT PRIMARY KEY,
    total_sales DECIMAL(12, 2),
    number_of_orders INT
);

INSERT INTO sales (employee_id, total_sales, number_of_orders)
VALUES
(1, 10000, 5),
(2, 6000, 2),
(3, 9000, 0),
(4, 4500, NULL),
(5, NULL, 3);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2) NULL,
    discount DECIMAL(10, 2) NULL
);

INSERT INTO products (product_id, product_name, price, discount)
VALUES
(1, 'Keyboard', 1000, 100),
(2, 'Mouse', 500, NULL),
(3, 'Monitor', NULL, 200),
(4, 'USB Cable', NULL, NULL),
(5, 'Webcam', 2500, 250);
