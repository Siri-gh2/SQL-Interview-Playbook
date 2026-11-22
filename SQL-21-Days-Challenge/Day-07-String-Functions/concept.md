# Day 07 — String Functions

String functions manipulate text values for formatting and data cleaning.

| Function | Purpose | Example |
|---|---|---|
| `CONCAT(a,b,...)` | Joins strings | `CONCAT('Hi','!')` |
| `UPPER(s)` | Uppercase | `UPPER('siri')` → `SIRI` |
| `LOWER(s)` | Lowercase | `LOWER('SQL')` → `sql` |
| `SUBSTRING(s,start,len)` | Extracts part of a string | `SUBSTRING('Database',1,4)` → `Data` |
| `LENGTH(s)` | Returns byte length | `LENGTH('SQL')` → 3 |
| `CHAR_LENGTH(s)` | Returns character count | `CHAR_LENGTH('SQL')` → 3 |
| `TRIM(s)` | Removes leading/trailing spaces | `TRIM(' SQL ')` → `SQL` |
| `REPLACE(s,old,new)` | Replaces matching text | `REPLACE('Vizag','Viz','Visa')` |
| `LEFT(s,n)` | First n characters | `LEFT('Database',4)` → `Data` |
| `RIGHT(s,n)` | Last n characters | `RIGHT('Database',4)` → `base` |
| `REVERSE(s)` | Reverses a string | `REVERSE('SQL')` → `LQS` |

## Key notes
- MySQL `SUBSTRING()` uses 1-based positions.
- `LENGTH()` returns bytes; `CHAR_LENGTH()` returns characters. They can differ for multibyte text.
- `TRIM()` removes leading and trailing spaces, not internal spaces.
- In MySQL, `CONCAT()` returns NULL if any argument is NULL. Use `COALESCE()` when NULL-safe concatenation is required.
