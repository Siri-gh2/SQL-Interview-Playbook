# Day 01 — Filtering with `WHERE`

## Purpose

`WHERE` filters individual rows before they are returned by a `SELECT` query.

## General syntax

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

## Operators practiced

| Operator | Meaning | Example |
|---|---|---|
| `=` | Equal to | `department = 'IT'` |
| `!=` or `<>` | Not equal to | `department != 'IT'` |
| `>` | Greater than | `salary > 50000` |
| `<` | Less than | `salary < 50000` |
| `>=` | Greater than or equal to | `salary >= 50000` |
| `<=` | Less than or equal to | `salary <= 50000` |
| `AND` | Both conditions must be true | `department = 'IT' AND salary > 50000` |
| `OR` | At least one condition must be true | `department = 'IT' OR department = 'HR'` |
| `BETWEEN` | Within an inclusive range | `salary BETWEEN 40000 AND 60000` |
| `IN` | Matches any value in a list | `department IN ('IT', 'HR')` |
| `NOT IN` | Matches none of the listed values | `department NOT IN ('IT', 'HR')` |
| `IS NULL` | Tests for missing/NULL value | `manager_id IS NULL` |
| `IS NOT NULL` | Tests for a non-NULL value | `manager_id IS NOT NULL` |

## Important notes

- `BETWEEN a AND b` includes both endpoints.
- `IN ('A', 'B')` is a concise alternative to `column = 'A' OR column = 'B'`.
- `NOT IN` excludes all values in the list.
- Use `IS NULL` and `IS NOT NULL` to test NULL values. Do not use `= NULL` or `!= NULL`.
- Use parentheses when combining `AND` and `OR` if you need to make the intended logic explicit.
