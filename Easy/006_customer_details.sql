-- ============================================
-- Problem: Customer Details
-- Question ID: 9891
-- Difficulty: Easy
-- Pattern: LEFT JOIN + ORDER BY
-- Companies: Airbnb, Uber
-- Source: StrataScratch
-- ============================================

/*
Problem Statement:
Find the details of each customer regardless of whether the customer made an order.

Output:
- first_name
- last_name
- city
- order_details

Sort:
- by first_name
- then by order_details (ascending)
*/

-- ============================================
-- Dataset
-- ============================================

/*
Table: customers
Columns: id, first_name, last_name, city, address, phone_number

Table: orders
Columns: id, cust_id, order_date, order_details, total_order_cost
*/

-- ============================================
-- Solution
-- ============================================

SELECT 
    c.first_name,
    c.last_name,
    c.city,
    o.order_details
FROM customers c
LEFT JOIN orders o
    ON c.id = o.cust_id
ORDER BY 
    c.first_name,
    o.order_details;


-- ============================================
-- Explanation
-- ============================================

/*
- LEFT JOIN ensures ALL customers are included
- If no orders → order_details will be NULL
- ORDER BY sorts alphabetically by name and order details
*/


-- ============================================
-- Output (Sample)
-- ============================================

/*
first_name | last_name | city           | order_details
-------------------------------------------------------
Eva        | Lucas     | Arizona        | Coat
Eva        | Lucas     | Arizona        | Shirts
Farida     | Joseph    | San Francisco  | Cap
...
*/
