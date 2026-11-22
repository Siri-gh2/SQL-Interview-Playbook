-- Day 7 practice schema for MySQL
CREATE DATABASE IF NOT EXISTS sql_challenge;
USE sql_challenge;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(20)
);

INSERT INTO customers
(customer_id, first_name, last_name, email, city, phone)
VALUES
(1, 'Siri',  'Korupolu', 'SIRI@GMAIL.COM',    'Vizag',     '9876543210'),
(2, 'Rahul', 'Sharma',   'rahul@yahoo.com',   'Hyderabad', '9123456780'),
(3, 'Priya', 'Reddy',    'PRIYA@GMAIL.COM',   'Chennai',   '9988776655'),
(4, 'Anu',   'Kumar',    'anu@outlook.com',   'Bangalore', '9876501234'),
(5, 'Neha',  'Patel',    'NEHA@GMAIL.COM',    'Vizag',     '9000011111'),
(6, 'Kiran', 'Rao',      'kiran@yahoo.com',   'Hyderabad', '9111122222'),
(7, 'Ravi',  'Teja',     'ravi@gmail.com',    'Chennai',   '9222233333'),
(8, 'Meera', 'Das',      'meera@outlook.com', 'Vizag',     '9333344444');

-- Optional TRIM() test:
-- UPDATE customers SET city = '  Vizag  ' WHERE customer_id = 1;
