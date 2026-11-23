-- Day 08: Date Functions — Reference Solutions
-- Run schema.sql first.

-- Q1. Extract year and month number
SELECT order_id, customer_name, order_date,
       YEAR(order_date) AS order_year,
       MONTH(order_date) AS order_month
FROM orders;

-- Q2. Days between order and delivery
SELECT order_id, customer_name, order_date, delivery_date,
       DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

-- Q3. Add 7 days
SELECT order_id, customer_name, order_date,
       DATE_ADD(order_date, INTERVAL 7 DAY) AS expected_delivery
FROM orders;

-- Q4. Subtract 3 days
SELECT order_id, customer_name, order_date,
       DATE_SUB(order_date, INTERVAL 3 DAY) AS reminder_date
FROM orders;

-- Q5. Weekday and month names
SELECT order_id, order_date,
       DAYNAME(order_date) AS day_name,
       MONTHNAME(order_date) AS month_name
FROM orders;

-- Q6. Format date as DD-MM-YYYY
SELECT order_id, order_date,
       DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM orders;

-- Q7. Days since each order was placed
SELECT order_id, customer_name, order_date,
       DATEDIFF(CURDATE(), order_date) AS days_since_order
FROM orders;

-- Q8. Orders placed in January 2026
SELECT order_id, customer_name, order_date, amount
FROM orders
WHERE YEAR(order_date) = 2026
  AND MONTH(order_date) = 1;
