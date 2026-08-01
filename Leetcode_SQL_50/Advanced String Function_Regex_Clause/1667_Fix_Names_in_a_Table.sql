-- ==========================================================
-- Problem      : Fix Names in a Table
-- LeetCode ID  : 1667
-- Difficulty   : Easy
-- Category     : String Functions
-- Pattern      : String Manipulation
-- Concepts     : UPPER(), LOWER(), LEFT(), SUBSTRING(), CONCAT()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Write an SQL query to fix the names so that:

1. The first letter is uppercase.
2. The remaining letters are lowercase.

Return the result ordered by user_id.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Users
-----
user_id    INT
name       VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Extract the first character using LEFT().
2. Convert it to uppercase using UPPER().
3. Extract the remaining characters using SUBSTRING().
4. Convert them to lowercase using LOWER().
5. Concatenate both parts.
6. Sort the result by user_id.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
Example:

Input:
aLice

LEFT(name,1)
→ a

UPPER(...)
→ A

SUBSTRING(name,2)
→ Lice

LOWER(...)
→ lice

Final:
Alice

• CONCAT() joins both parts together.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Capitalize First Letter

General Pattern:

CONCAT(
    UPPER(LEFT(column,1)),
    LOWER(SUBSTRING(column,2))
)

Useful String Functions:

UPPER()
LOWER()
LEFT()
RIGHT()
SUBSTRING()
CONCAT()
LENGTH()
TRIM()
REPLACE()

Common Interview Questions:

✓ Proper Name Formatting
✓ Email Formatting
✓ Username Normalization
✓ Capitalize Words
✓ Data Cleaning
✓ Text Standardization

Remember:

LEFT(str, n)
→ First n characters

SUBSTRING(str, start)
→ Remaining characters

UPPER()
→ Uppercase

LOWER()
→ Lowercase
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
