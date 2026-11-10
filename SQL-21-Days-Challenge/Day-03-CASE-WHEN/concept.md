# Day 3 — CASE WHEN

`CASE` checks conditions in order and returns the result for the first true condition.

## Syntax

```sql
SELECT
    column_name,
    CASE
        WHEN condition_1 THEN result_1
        WHEN condition_2 THEN result_2
        ELSE default_result
    END AS alias_name
FROM table_name;
```

## Key points
- Conditions are evaluated from top to bottom.
- Once a condition matches, later conditions are skipped.
- `ELSE` is optional. If omitted and no condition matches, the result is `NULL`.
- Put higher-priority or narrower ranges first when conditions overlap.

## CASE with GROUP BY

```sql
SELECT
    CASE WHEN salary >= 60000 THEN 'High' ELSE 'Low' END AS salary_category,
    COUNT(emp_id) AS employee_count
FROM employees
GROUP BY CASE WHEN salary >= 60000 THEN 'High' ELSE 'Low' END;
```

## CASE with a CTE

A CTE lets the outer query use the calculated category as a column.

```sql
WITH employee_categories AS (
    SELECT
        emp_id,
        salary,
        CASE WHEN salary >= 60000 THEN 'High' ELSE 'Low' END AS salary_category
    FROM employees
)
SELECT salary_category, COUNT(emp_id) AS employee_count
FROM employee_categories
GROUP BY salary_category;
```

A CTE improves organization/readability here; it does not automatically make the query faster.

## Conditional aggregation with SUM

```sql
SELECT
    department,
    SUM(CASE WHEN salary >= 60000 THEN 1 ELSE 0 END) AS high_count,
    SUM(CASE WHEN salary < 60000 THEN 1 ELSE 0 END) AS low_count
FROM employees
GROUP BY department;
```

## Conditional aggregation with COUNT

```sql
SELECT
    department,
    COUNT(CASE WHEN salary >= 60000 THEN emp_id END) AS high_count,
    COUNT(CASE WHEN salary < 60000 THEN emp_id END) AS low_count
FROM employees
GROUP BY department;
```

`COUNT(expression)` ignores NULL values. A CASE expression without a matching condition and without ELSE returns NULL.

## Nested CASE WHEN

```sql
SELECT
    name,
    department,
    salary,
    CASE
        WHEN department = 'IT' THEN
            CASE
                WHEN salary >= 60000 THEN 'IT - Senior'
                ELSE 'IT - Junior'
            END
        WHEN department = 'HR' THEN
            CASE
                WHEN salary >= 50000 THEN 'HR - Senior'
                ELSE 'HR - Junior'
            END
        ELSE 'Other'
    END AS employee_category
FROM employees;
```

Each CASE expression needs its own END.
