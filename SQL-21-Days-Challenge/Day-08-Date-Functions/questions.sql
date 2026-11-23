-- Day 08: Date Functions — Practice Questions
-- Run schema.sql first. Try these before opening solutions.sql.

-- Q1. Display order_id, customer_name, order_date, order_year, and order_month.
--     Extract the year and month number using YEAR() and MONTH().

-- Q2. Display order_id, customer_name, order_date, delivery_date, and
--     delivery_days (number of days between the two dates). Use DATEDIFF().

-- Q3. Display order_id, customer_name, order_date, and expected_delivery,
--     which is 7 days after order_date. Use DATE_ADD().

-- Q4. Display order_id, customer_name, order_date, and reminder_date,
--     which is 3 days before order_date. Use DATE_SUB().

-- Q5. Display order_id, order_date, weekday name, and month name.
--     Use DAYNAME() and MONTHNAME().

-- Q6. Display order_id, order_date, and formatted_date in DD-MM-YYYY format.
--     Use DATE_FORMAT().

-- Q7. Display order_id, customer_name, order_date, and days_since_order.
--     Calculate days from order_date to the current date using CURDATE()
--     and DATEDIFF().

-- Q8. Display order_id, customer_name, order_date, and amount for orders
--     placed in January 2026. Use YEAR() and MONTH().
