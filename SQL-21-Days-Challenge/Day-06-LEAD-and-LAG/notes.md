# Day 06 — Practice Notes

## Concepts practiced
- [x] `LAG()`
- [x] `LEAD()`
- [x] Offset argument
- [x] Default value argument
- [x] `PARTITION BY`
- [x] Combining `LAG()` and `LEAD()`

## Common mistakes to avoid
- `LAG()` looks backward; `LEAD()` looks forward.
- The offset counts rows, not numeric distance between IDs.
- The third argument is the fallback when the requested row does not exist.
- `PARTITION BY` restarts the window sequence for each group.
- The ordering inside `OVER()` controls the window calculation; it does not necessarily sort the final displayed rows.
- If the ordering column has ties, add a tie-breaker to make ordering deterministic.

## Practice reflection
- Guided questions completed: 8/8.
- Next improvement: solve mixed questions independently and choose `LAG()` or `LEAD()` without being told which one to use.

### My observations
_Add your own notes here._
