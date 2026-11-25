# Day 10 — Practice Notes

## Completion
- [x] Q1 — INNER JOIN
- [x] Q2 — LEFT JOIN
- [x] Q3 — RIGHT JOIN
- [x] Q4 — Finding unmatched rows with IS NULL
- [x] Q5 — JOIN with GROUP BY and COUNT
- [x] Q6 — CROSS JOIN
- [x] Q7 — FULL OUTER JOIN simulation using UNION
- [x] Q8 — JOIN with WHERE filters

## Key takeaways
1. INNER JOIN returns matching rows from both tables.
2. LEFT JOIN preserves all rows from the left table.
3. RIGHT JOIN preserves all rows from the right table.
4. Check a right-table primary key with IS NULL to find unmatched left-side rows.
5. COUNT(right_table.primary_key) returns zero for groups without matches; COUNT(*) would count the preserved row.
6. CROSS JOIN creates every possible combination.
7. MySQL has no native FULL OUTER JOIN; use a UNION-based simulation.

## Reflection
All 8 guided questions were completed correctly. Next, practise choosing the JOIN type from the requirement alone, without being told which JOIN to use.
