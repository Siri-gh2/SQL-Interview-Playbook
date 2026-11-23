# Day 08 — SQL Date Functions

| Function | Purpose | Example |
|---|---|---|
| `CURDATE()` | Current date | `CURDATE()` |
| `NOW()` | Current date and time | `NOW()` |
| `YEAR(date)` | Extract year | `YEAR(order_date)` |
| `MONTH(date)` | Extract month number (1–12) | `MONTH(order_date)` |
| `DAY(date)` | Extract day of month | `DAY(order_date)` |
| `DATEDIFF(a, b)` | Difference in days (`a - b`) | `DATEDIFF(delivery_date, order_date)` |
| `DATE_ADD(date, INTERVAL n unit)` | Add an interval | `DATE_ADD(order_date, INTERVAL 7 DAY)` |
| `DATE_SUB(date, INTERVAL n unit)` | Subtract an interval | `DATE_SUB(order_date, INTERVAL 3 DAY)` |
| `MONTHNAME(date)` | Month name | `MONTHNAME(order_date)` |
| `DAYNAME(date)` | Weekday name | `DAYNAME(order_date)` |
| `DATE_FORMAT(date, format)` | Format date as text | `DATE_FORMAT(order_date, '%d-%m-%Y')` |

## Common `DATE_FORMAT()` specifiers
- `%d` — zero-padded day
- `%m` — zero-padded month number
- `%Y` — four-digit year
- `%M` — full month name
- `%W` — weekday name

## Important reminders
- `DATEDIFF(date1, date2)` calculates `date1 - date2` in days.
- `MONTH()` returns a number; `MONTHNAME()` returns a name.
- `DATE_FORMAT()` returns a formatted string.
- `CURDATE()` returns a date; `NOW()` returns a date-time value.
