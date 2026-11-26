# Day 11 — HAVING Clause

## WHERE vs HAVING
- `WHERE` filters individual rows before grouping.
- `HAVING` filters groups after `GROUP BY` and aggregation.

## Basic syntax
```sql
SELECT group_column, AGGREGATE_FUNCTION(value_column) AS aggregate_alias
FROM table_name
WHERE row_condition
GROUP BY group_column
HAVING aggregate_condition;
```

`WHERE` is optional. Use it to remove rows before groups are formed.

## Common aggregate functions
- `COUNT()` counts rows or non-NULL values.
- `SUM()` calculates a total.
- `AVG()` calculates an average.
- `MAX()` returns the maximum.
- `MIN()` returns the minimum.

## Multiple conditions
```sql
SELECT department, COUNT(*) AS employee_count, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING employee_count >= 3 AND total_salary > 150000;
```

## Conditional aggregation
```sql
SUM(CASE WHEN salary > 40000 THEN 1 ELSE 0 END)
```
This counts employees whose salary is greater than 40000 within each group.

## MySQL alias note
MySQL allows a `SELECT` alias to be used in `HAVING`, such as `HAVING employee_count > 2`. Other database systems may require repeating the aggregate expression.
