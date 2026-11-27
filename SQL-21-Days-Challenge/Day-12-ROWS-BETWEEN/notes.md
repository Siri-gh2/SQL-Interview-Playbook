# Day 12 — Notes

## Completed topics
- `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`
- `ROWS BETWEEN 1 PRECEDING AND CURRENT ROW`
- `UNBOUNDED PRECEDING` for running totals
- `CURRENT ROW AND n FOLLOWING`
- Moving averages with `AVG()`
- Frames containing preceding, current, and following rows
- `PARTITION BY` with a window frame

## Key takeaways
1. A window frame specifies which rows participate in the calculation for the current row.
2. `ROWS` counts physical rows in the ordered window.
3. `UNBOUNDED PRECEDING` starts at the first row of the partition.
4. `FOLLOWING` includes rows after the current row.
5. At partition boundaries, only available rows are included.
6. `PARTITION BY` creates independent calculations for each partition.
7. Use a deterministic `ORDER BY`, ideally with a unique tie-breaker, when row order matters.

## Practice status
All 8 guided questions completed.

## Q7 schema note
The initial sales table does not contain `region`. The schema includes optional `ALTER TABLE` and `UPDATE` statements for Q7. Run them once only; rerunning the `ALTER TABLE` after the column exists will produce an error.

## Expected result checks (sale_id order)
- Q1: 100, 300, 450, 650, 700, 950, 830
- Q2: 100, 300, 350, 450, 550, 650, 580
- Q3: 100, 300, 450, 750, 1000, 1400, 1580
- Q4: 450, 650, 700, 950, 830, 580, 180
- Q5: 100.00, 150.00, 150.00, 216.67, 233.33, 316.67, 276.67
- Q6: 300, 450, 650, 700, 950, 830, 580
- Q8: 450, 750, 900, 1100, 1130, 830, 580
