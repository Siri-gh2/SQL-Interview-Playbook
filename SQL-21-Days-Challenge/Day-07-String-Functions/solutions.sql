-- Day 7: Reference solutions (MySQL)
USE sql_challenge;

-- Q1
SELECT customer_id, first_name, last_name,
       CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;

-- Q2
SELECT customer_id, first_name, email,
       UPPER(email) AS email_uppercase,
       LOWER(email) AS email_lowercase
FROM customers;

-- Q3
SELECT customer_id, first_name, email,
       SUBSTRING(email, 1, 5) AS email_prefix
FROM customers;

-- Q4
SELECT customer_id, first_name, email,
       LENGTH(email) AS email_length,
       CHAR_LENGTH(email) AS email_char_length
FROM customers;

-- Q5
SELECT customer_id, city,
       REPLACE(TRIM(city), 'Vizag', 'Visakhapatnam') AS cleaned_city
FROM customers;

-- Q6
SELECT customer_id, phone,
       LEFT(phone, 4) AS first_four_digits,
       RIGHT(phone, 4) AS last_four_digits
FROM customers;

-- Q7
SELECT customer_id, first_name,
       REVERSE(first_name) AS reversed_name,
       CONCAT('Customer: ', first_name) AS name_with_prefix
FROM customers;

-- Q8
SELECT customer_id, first_name, last_name, email,
       CONCAT(
           UPPER(first_name),
           ' - ',
           LOWER(last_name),
           ' | ',
           LOWER(email)
       ) AS formatted_customer
FROM customers;
