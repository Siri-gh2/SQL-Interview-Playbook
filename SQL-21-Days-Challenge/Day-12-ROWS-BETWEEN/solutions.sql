-- Day 12: Reference solutions (MySQL). Run schema.sql first.
-- Q7 requires the optional region setup in schema.sql.

-- Q1
SELECT sale_id, sale_date, amount, SUM(amount) OVER (ORDER BY sale_date, sale_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS three_row_sum FROM sales;

-- Q2
SELECT sale_id, amount, SUM(amount) OVER (ORDER BY sale_id ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS two_row_sum FROM sales;

-- Q3
SELECT sale_id, amount, SUM(amount) OVER (ORDER BY sale_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total FROM sales;

-- Q4
SELECT sale_id, amount, SUM(amount) OVER (ORDER BY sale_id ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS next_three_sum FROM sales;

-- Q5
SELECT sale_id, amount, AVG(amount) OVER (ORDER BY sale_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS three_row_avg FROM sales;

-- Q6
SELECT sale_id, amount, SUM(amount) OVER (ORDER BY sale_id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS surrounding_sum FROM sales;

-- Q7
SELECT region, sale_id, amount, SUM(amount) OVER (PARTITION BY region ORDER BY sale_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total FROM sales;

-- Q8
SELECT sale_id, amount, SUM(amount) OVER (ORDER BY sale_id ROWS BETWEEN 2 PRECEDING AND 1 FOLLOWING) AS four_row_sum FROM sales;
