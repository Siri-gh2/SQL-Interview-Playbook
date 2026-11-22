-- Day 7: String Functions — 8 practice questions
USE sql_challenge;

-- Q1. Display customer_id, first_name, last_name, and full_name.
--     Combine first_name and last_name with one space using CONCAT().

-- Q2. Display customer_id, first_name, email, email_uppercase,
--     and email_lowercase. Use UPPER() and LOWER().

-- Q3. Display customer_id, first_name, email, and email_prefix.
--     Extract the first 5 characters of email using SUBSTRING().

-- Q4. Display customer_id, first_name, email, email_length,
--     and email_char_length. Use LENGTH() and CHAR_LENGTH().

-- Q5. Display customer_id, city, and cleaned_city.
--     Trim leading/trailing spaces from city and replace 'Vizag'
--     with 'Visakhapatnam'. Use TRIM() and REPLACE().

-- Q6. Display customer_id, phone, first_four_digits, and last_four_digits.
--     Use LEFT() and RIGHT() to extract four characters from each end.

-- Q7. Display customer_id, first_name, reversed_name, and name_with_prefix.
--     Reverse first_name and prepend 'Customer: ' to first_name.
--     Use REVERSE() and CONCAT().

-- Q8. Display customer_id, first_name, last_name, email,
--     and formatted_customer.
--     Format as UPPER(first_name) + ' - ' + LOWER(last_name)
--     + ' | ' + LOWER(email), using CONCAT(), UPPER(), and LOWER().
