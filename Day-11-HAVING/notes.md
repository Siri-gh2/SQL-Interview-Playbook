# Day 11 — Notes

## Completed topics
- HAVING with COUNT(), AVG(), SUM(), MAX(), and MIN()
- WHERE + GROUP BY + HAVING
- Multiple conditions in HAVING
- Conditional aggregation using SUM(CASE WHEN ... THEN 1 ELSE 0 END)

## Key takeaways
1. WHERE filters rows before grouping; HAVING filters groups after aggregation.
2. Use COUNT(emp_id) to count non-NULL employee IDs.
3. Use SUM() for group totals and AVG() for group averages.
4. Combine group conditions with AND/OR in HAVING.
5. Conditional aggregation counts only rows meeting a condition.
6. MySQL permits SELECT aliases in HAVING.

## Result checks for the supplied data
- Q1: IT (4), HR (3), Sales (3).
- Q2: IT only (average 57500).
- Q3: IT only (total 230000).
- Q4: No rows. IT's minimum is exactly 40000, not below 40000.
- Q5: IT only (average of salaries > 40000 is 63333.33).
- Q6: IT only (4 employees; total 230000).
- Q7: IT only (4 employees; average 57500).
- Q8: IT only (4 employees earn > 40000; average 57500).

## Important
A syntactically correct query can return no rows. Check the data and comparison operators carefully; `>` is not the same as `>=`.
