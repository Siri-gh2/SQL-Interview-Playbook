-- Day 5: NULL Handling — 8 practice questions
-- Attempt these before checking solutions.sql.

USE sql_challenge;

-- Q1. Display emp_id, name, salary, and salary_after_handling.
--     If salary is NULL, show 0. Use IFNULL().

-- Q2. Display name, department, city, and location.
--     If city is NULL, show 'Location Not Available'. Use COALESCE().

-- Q3. Display name, salary, and adjusted_salary.
--     Convert salary 0 to NULL. Use NULLIF().

-- Q4. Display emp_id, name, and manager_id for employees
--     whose manager_id is NULL. Use IS NULL.

-- Q5. Display name, email, phone, alternate_phone, and preferred_contact.
--     Priority: email, then phone, then alternate_phone.
--     If all are NULL, show 'No Contact Available'. Use COALESCE().

-- Q6. From sales, display employee_id, total_sales, number_of_orders,
--     and average_order_value = total_sales / number_of_orders.
--     If number_of_orders is 0, return NULL. Use NULLIF().

-- Q7. From products, display product_id, product_name, price, discount,
--     and final_price. Treat NULL discount as 0; if price is NULL,
--     final_price must be 0. Use COALESCE().

-- Q8. From employees, display emp_id, name, salary, commission,
--     and total_income. Treat NULL salary and commission as 0.
--     Show only employees whose total_income is greater than 50000.
--     Use COALESCE().
