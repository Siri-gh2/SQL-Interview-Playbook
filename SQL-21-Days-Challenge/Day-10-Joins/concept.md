# Day 10 — SQL Joins

A JOIN combines rows from two or more tables using a related column. Here, `employees.department_id` relates to `departments.department_id`.

## INNER JOIN
Returns only matching rows from both tables.
```sql
SELECT e.emp_id, e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
```
In MySQL, `JOIN` alone means `INNER JOIN`.

## LEFT JOIN
Returns all rows from the left table and matching rows from the right. Unmatched right-side columns are NULL.
```sql
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
```

## RIGHT JOIN
Returns all rows from the right table and matching rows from the left. Unmatched left-side columns are NULL.
```sql
SELECT d.department_name, e.name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;
```

## Finding unmatched rows
A LEFT JOIN followed by an IS NULL check on a right-table key finds left-side rows without a match.
```sql
SELECT e.emp_id, e.name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
```

## JOIN with GROUP BY and COUNT
Use LEFT JOIN to preserve groups with no matches. Count a non-NULL right-side key to get zero for empty groups.
```sql
SELECT d.department_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
```
`COUNT(e.emp_id)` ignores NULL; `COUNT(*)` would count the preserved department row.

## CROSS JOIN
Returns the Cartesian product: every row from one table paired with every row from the other. No ON condition is needed.
```sql
SELECT e.name, d.department_name
FROM employees e CROSS JOIN departments d;
```
With 8 employees and 4 departments, this returns 32 rows.

## FULL OUTER JOIN in MySQL
MySQL does not support native FULL OUTER JOIN syntax. Simulate it by combining LEFT JOIN and RIGHT JOIN with UNION.
```sql
SELECT e.emp_id, e.name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
UNION
SELECT e.emp_id, e.name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;
```
`UNION` removes duplicates. An alternative is `LEFT JOIN UNION ALL` with only unmatched right-side rows in the second query.

## Key reminders
- `ON` defines how rows match; `WHERE` filters the joined result.
- LEFT JOIN preserves all left-side rows; RIGHT JOIN preserves all right-side rows.
- `COUNT(right_table.primary_key)` counts matches and returns zero for unmatched groups.
- CROSS JOIN creates every possible combination.
