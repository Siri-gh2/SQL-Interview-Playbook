# Day 01 — Practice Notes

## Session result

- Questions attempted: 8
- Correct answers: 8
- Score on the guided practice set: 8/8
- Status: Completed

## Question summary

| Q | Skill | Result |
|---:|---|---|
| 1 | Basic `WHERE` with `>` | Correct |
| 2 | Combining conditions with `AND` | Correct |
| 3 | Filtering alternatives with `OR` | Correct |
| 4 | Inclusive range with `BETWEEN` | Correct |
| 5 | Matching a list with `IN` | Correct |
| 6 | Excluding a list with `NOT IN` | Correct |
| 7 | Testing missing values with `IS NULL` | Correct |
| 8 | Combining `IN` and `AND` | Correct |

## Key takeaways

1. `AND` requires every joined condition to be true.
2. `OR` requires at least one joined condition to be true.
3. `BETWEEN` includes the lower and upper boundaries.
4. `IN` and `NOT IN` make multi-value filtering concise.
5. NULL must be checked with `IS NULL` or `IS NOT NULL`.

## Honest assessment

The 8/8 result applies to this guided beginner practice set. It is not proof of interview-level mastery yet. Further practice should include:
- Parentheses and mixed `AND`/`OR` precedence.
- NULL conditions combined with other filters.
- Boundary-value edge cases.
- Questions without a provided expected output.
- Solving independently in MySQL Workbench.

## Reproducibility

The sample table and data are defined in `schema.sql`. Run that file before running `solution.sql`.
