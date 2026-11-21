# Day 06 — LEAD() and LAG()

`LEAD()` and `LAG()` are window functions that access values from other rows in an ordered result.

## LAG()
Retrieves a value from a preceding row.

```sql
LAG(expression, offset, default_value)
OVER (PARTITION BY group_column ORDER BY sort_column)
```

Example:

```sql
SELECT emp_id, salary,
       LAG(salary) OVER (ORDER BY emp_id) AS previous_salary
FROM employee_salary;
```

## LEAD()
Retrieves a value from a following row.

```sql
SELECT emp_id, salary,
       LEAD(salary) OVER (ORDER BY emp_id) AS next_salary
FROM employee_salary;
```

## Offset and default value
- Offset defaults to `1`.
- `LAG(salary, 2)` retrieves the value two rows before.
- `LEAD(salary, 2)` retrieves the value two rows after.
- The optional third argument is returned when the requested row does not exist.

```sql
LAG(salary, 1, 0) OVER (ORDER BY emp_id)
LEAD(salary, 1, -1) OVER (ORDER BY emp_id)
```

Without a third argument, the result is `NULL` when the requested row does not exist.

## PARTITION BY
Divides rows into independent groups. The window function restarts within each group.

```sql
SELECT emp_id, department, salary,
       LAG(salary) OVER (
           PARTITION BY department
           ORDER BY emp_id
       ) AS previous_department_salary
FROM employee_salary;
```

The first row in each department has no preceding row in that partition, so its result is `NULL`.

## Quick comparison

| Function | Direction | Typical use |
|---|---|---|
| `LAG()` | Previous row | Compare with a previous period |
| `LEAD()` | Next row | Compare with an upcoming period |

## Important points
- `ORDER BY` inside `OVER()` defines the sequence used by the window function.
- `PARTITION BY` is optional. Without it, all rows are in one partition.
- The `ORDER BY` inside `OVER()` does not guarantee final output order. Add an outer `ORDER BY` when needed.
- If the ordering column has ties, add a tie-breaker for deterministic ordering.
