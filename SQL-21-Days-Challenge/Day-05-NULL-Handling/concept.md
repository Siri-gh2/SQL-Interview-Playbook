# Day 05 — NULL Handling

`NULL` represents a missing or unknown value. It is not the same as `0` or an empty string.

## 1. IFNULL()

Returns the replacement value when the first expression is `NULL`; otherwise returns the first expression.

```sql
SELECT IFNULL(salary, 0) AS salary_after_handling
FROM employees;
```

## 2. COALESCE()

Returns the first non-`NULL` expression from the supplied list. It can accept more than two expressions.

```sql
SELECT COALESCE(email, phone, 'No Contact Available') AS preferred_contact
FROM employees;
```

## 3. NULLIF()

Returns `NULL` when its two arguments are equal. Otherwise, it returns the first argument.

```sql
SELECT NULLIF(salary, 0) AS adjusted_salary
FROM employees;
```

It is also useful for avoiding division by zero:

```sql
SELECT total_sales / NULLIF(number_of_orders, 0) AS average_order_value
FROM sales;
```

When `number_of_orders` is `0`, the denominator becomes `NULL`, so the result is `NULL` rather than a division-by-zero error.

## 4. IS NULL and IS NOT NULL

Use these operators to test whether a value is missing.

```sql
SELECT *
FROM employees
WHERE manager_id IS NULL;
```

Do not use `= NULL` or `!= NULL` for NULL checks.

## 5. NULLs in calculations

Arithmetic involving `NULL` generally produces `NULL`. Handle each nullable operand when the requirement says missing values should count as zero.

```sql
SELECT COALESCE(salary, 0) + COALESCE(commission, 0) AS total_income
FROM employees;
```

## Quick comparison

| Function/operator | Purpose |
|---|---|
| `IFNULL(a, b)` | Replace `a` when it is NULL |
| `COALESCE(a, b, ...)` | Return the first non-NULL expression |
| `NULLIF(a, b)` | Return NULL when `a = b` |
| `IS NULL` | Test for NULL |
| `IS NOT NULL` | Test for a non-NULL value |
