# Day 2 — GROUP BY and Aggregate Functions

`GROUP BY` combines rows that share the same value (or combination of values) in one or more columns. Aggregate functions calculate a result for each group.

| Function | Purpose |
|---|---|
| `COUNT()` | Counts non-NULL values |
| `SUM()` | Adds values |
| `AVG()` | Calculates the average |
| `MIN()` | Returns the smallest value |
| `MAX()` | Returns the largest value |

## Basic syntax

```sql
SELECT grouping_column, AGGREGATE_FUNCTION(column)
FROM table_name
GROUP BY grouping_column;
```

## Grouping by multiple columns

```sql
SELECT department, city, COUNT(emp_id) AS employee_count
FROM employees
GROUP BY department, city;
```

This creates a separate group for each unique department-city combination.

## WHERE with GROUP BY

`WHERE` filters individual rows before groups are formed.

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
WHERE salary > 45000
GROUP BY department;
```

## HAVING

`HAVING` filters groups after aggregation. It is commonly used when the condition depends on an aggregate.

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

MySQL also permits a SELECT alias such as `avg_salary` in `HAVING`.

## Logical processing order (simplified)

1. `FROM`
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `ORDER BY`

## WHERE vs HAVING

| WHERE | HAVING |
|---|---|
| Filters rows | Filters groups |
| Applied before grouping | Applied after grouping |
| Commonly uses row-level conditions | Commonly uses aggregate conditions |
