# Day 05 — Practice Notes

## Concepts practiced
- [x] `IFNULL()`
- [x] `COALESCE()`
- [x] `NULLIF()`
- [x] `IS NULL`
- [x] NULL handling in arithmetic
- [x] NULL handling in `WHERE`

## Common mistakes to avoid
- Do not compare NULL using `= NULL`; use `IS NULL`.
- `COALESCE()` returns the first non-NULL expression, so argument order matters.
- `NULLIF(a, b)` returns NULL when `a` and `b` are equal.
- If two operands can independently be NULL, handle both operands when calculating a total.
- Check actual column spelling and names (for example, `commission` and `number_of_orders`).

## Practice reflection
- Guided questions completed: 8/8.
- Next improvement: attempt a mixed set without being told which NULL-handling function to use.
- Record any mistakes and the corrected reasoning below.

### My observations
_Add your own notes here._
