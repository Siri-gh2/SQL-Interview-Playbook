# Day 09 — Common Table Expressions (CTEs)

A **Common Table Expression (CTE)** is a temporary named result set available only for the duration of a single SQL statement. In MySQL, define it using `WITH`.

## Basic syntax

```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
```

The query inside the CTE defines a result set. The main query references it by name.

## CTE with filtering

```sql
WITH high_salary AS (
    SELECT emp_id, name, salary
    FROM employees
    WHERE salary > 45000
)
SELECT *
FROM high_salary;
```

## CTE with aggregation

```sql
WITH department_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_avg
ORDER BY avg_salary DESC;
```

## CTE with HAVING

Use `HAVING` to filter grouped results after aggregation.

```sql
WITH department_summary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 45000
)
SELECT *
FROM department_summary;
```

## Multiple CTEs

Define multiple CTEs after one `WITH`, separated by commas. A later CTE can reference an earlier one.

```sql
WITH department_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
high_avg_departments AS (
    SELECT *
    FROM department_avg
    WHERE avg_salary > 45000
)
SELECT *
FROM high_avg_departments;
```

## CTE with JOIN

```sql
WITH department_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.emp_id, e.name, e.department, e.salary, d.avg_salary
FROM employees AS e
JOIN department_avg AS d
    ON e.department = d.department
WHERE e.salary > d.avg_salary;
```

## Key points
- A CTE is scoped to the single SQL statement that follows it.
- Use `WITH` to define a CTE.
- Multiple CTEs are separated by commas, not additional `WITH` keywords.
- A CTE can be used with filtering, aggregation, grouping, and joins.
- A CTE improves query organization and readability; it is not a permanent table.
