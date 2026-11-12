# Day 04 — Nested CASE WHEN

## 1. What is a nested CASE?

A nested `CASE` is a `CASE` expression placed inside another `CASE` expression. It is useful when the result of an outer condition determines which additional conditions must be checked.

## 2. General syntax

```sql
CASE
    WHEN outer_condition_1 THEN
        CASE
            WHEN inner_condition_1 THEN result_1
            ELSE result_2
        END
    WHEN outer_condition_2 THEN
        CASE
            WHEN inner_condition_2 THEN result_3
            ELSE result_4
        END
    ELSE default_result
END
```

## 3. Evaluation order

- Conditions are checked from top to bottom.
- The first condition that evaluates to TRUE determines the result.
- Conditions inside a nested `CASE` are evaluated only after the corresponding outer branch is selected.
- If no condition matches and there is no `ELSE`, the result is `NULL`.

## 4. CASE with GROUP BY

A calculated `CASE` result can be used as a category for grouping.

```sql
SELECT
    department,
    CASE
        WHEN salary >= 60000 THEN 'High'
        ELSE 'Low'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department, salary_category;
```

In MySQL, a SELECT alias can be referenced in `GROUP BY`.

## 5. CASE with aggregate functions

After classifying rows, aggregate functions such as `COUNT()`, `SUM()`, and `AVG()` can summarize each group.

Remember:
- `COUNT(column)` ignores NULL values in that column.
- `AVG(column)` ignores NULL values.
- `COUNT(*)` counts rows, including rows with NULL values in other columns.

## 6. NULL handling

Use `IS NULL` to test for NULL:

```sql
CASE
    WHEN salary IS NULL THEN 'Unknown'
    WHEN salary >= 60000 THEN 'High'
    ELSE 'Low'
END
```

Do not use `salary = NULL`; comparisons with NULL do not work that way.

## 7. CASE inside ORDER BY

`CASE` can define a custom sort priority:

```sql
SELECT emp_id, name, department, salary
FROM employees
ORDER BY
    CASE
        WHEN department = 'IT' THEN 1
        WHEN department = 'HR' THEN 2
        ELSE 3
    END,
    salary DESC;
```

ORDER BY expressions are applied from left to right. The next expression sorts rows tied on the previous expression.

## 8. Common mistakes to avoid

- Forgetting `END` for an inner or outer `CASE`.
- Putting an inner condition outside the branch it belongs to.
- Using `= NULL` instead of `IS NULL`.
- Assuming `ELSE` handles only ordinary values; it also catches NULL-related cases when earlier conditions do not match.
- Forgetting that `AVG()` ignores NULL values.
- Grouping only by department when the output also contains a category.
- Forgetting that CASE conditions are evaluated in order.
