# Day 04 — Notes

## Completed practice

- [x] Q1 — Nested CASE by department and salary
- [x] Q2 — Three-level nested CASE for bonus classification
- [x] Q3 — Nested CASE with CTE, GROUP BY, and COUNT()
- [x] Q4 — Nested CASE with explicit NULL handling
- [x] Q5 — Nested CASE with GROUP BY and AVG()
- [x] Q6 — CASE inside ORDER BY for custom sorting
- [x] Q7 — Multi-condition business review classification
- [x] Q8 — Independent challenge with CTE, CASE, aggregates, GROUP BY, and ORDER BY

## Key takeaways

1. A nested CASE lets an outer decision select which inner conditions should be evaluated.
2. CASE conditions are evaluated from top to bottom; the first TRUE condition wins.
3. Use `IS NULL` to test for NULL values.
4. An ELSE branch can classify NULL values unintentionally if NULL is not handled explicitly.
5. In MySQL, a SELECT alias can be used in GROUP BY.
6. `AVG()` ignores NULL values; `COUNT(column)` also ignores NULL values in that column.
7. CASE inside ORDER BY can implement custom sorting priorities.
8. Multiple ORDER BY expressions are applied from left to right.

## Mistakes / reminders

- Always close every CASE with END.
- Check the order of salary thresholds so higher ranges are not captured by lower conditions first.
- Decide explicitly how NULL values should be classified.
- Group by every non-aggregated grouping dimension in an aggregate query.

## Self-assessment

All 8 questions were completed correctly during guided practice. This records completion of the guided exercises, not proof of independent mastery. Revisit the concepts later with unfamiliar scenarios and without hints.
