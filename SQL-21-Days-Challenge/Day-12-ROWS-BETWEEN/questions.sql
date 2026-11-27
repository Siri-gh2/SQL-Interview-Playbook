-- Day 12: ROWS BETWEEN practice questions. Run schema.sql first.
-- Attempt these before checking solutions.sql.

-- Q1. Sum current sale and previous two. Display sale_id, sale_date, amount, three_row_sum.
-- Frame: ROWS BETWEEN 2 PRECEDING AND CURRENT ROW.

-- Q2. Sum current sale and previous sale. Display sale_id, amount, two_row_sum.
-- Frame: ROWS BETWEEN 1 PRECEDING AND CURRENT ROW.

-- Q3. Cumulative sum from first sale through current sale. Display sale_id, amount, running_total.
-- Frame: ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.

-- Q4. Sum current sale and next two. Display sale_id, amount, next_three_sum.
-- Frame: ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING.

-- Q5. Average current sale and previous two. Display sale_id, amount, three_row_avg.
-- Frame: ROWS BETWEEN 2 PRECEDING AND CURRENT ROW.

-- Q6. Sum previous, current, and next sale. Display sale_id, amount, surrounding_sum.
-- Frame: ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING.

-- Q7. Add/prepare region. Calculate a running total separately per region.
-- Display region, sale_id, amount, running_total. Use PARTITION BY region and
-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.

-- Q8. Sum previous two, current, and next sale. Display sale_id, amount, four_row_sum.
-- Frame: ROWS BETWEEN 2 PRECEDING AND 1 FOLLOWING.
