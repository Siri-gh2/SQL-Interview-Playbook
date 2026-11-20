-- Day 5: Reference solutions (MySQL)
USE sql_challenge;

-- Q1. IFNULL()
SELECT
    emp_id,
    name,
    salary,
    IFNULL(salary, 0) AS salary_after_handling
FROM employees;

-- Q2. COALESCE()
SELECT
    name,
    department,
    city,
    COALESCE(city, 'Location Not Available') AS location
FROM employees;

-- Q3. NULLIF()
SELECT
    name,
    salary,
    NULLIF(salary, 0) AS adjusted_salary
FROM employees;

-- Q4. IS NULL
SELECT
    emp_id,
    name,
    manager_id
FROM employees
WHERE manager_id IS NULL;

-- Q5. COALESCE() with multiple columns
SELECT
    name,
    email,
    phone,
    alternate_phone,
    COALESCE(
        email,
        phone,
        alternate_phone,
        'No Contact Available'
    ) AS preferred_contact
FROM employees;

-- Q6. NULLIF() to avoid division by zero
SELECT
    employee_id,
    total_sales,
    number_of_orders,
    total_sales / NULLIF(number_of_orders, 0) AS average_order_value
FROM sales;

-- Q7. Nested COALESCE()
SELECT
    product_id,
    product_name,
    price,
    discount,
    COALESCE(price - COALESCE(discount, 0), 0) AS final_price
FROM products;

-- Q8. NULL handling in calculation and WHERE
SELECT
    emp_id,
    name,
    salary,
    commission,
    COALESCE(salary, 0) + COALESCE(commission, 0) AS total_income
FROM employees
WHERE COALESCE(salary, 0) + COALESCE(commission, 0) > 50000;
