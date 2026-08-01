-- ==========================================================
-- Problem      : Delete Duplicate Emails
-- LeetCode ID  : 196
-- Difficulty   : Easy
-- Category     : SQL Delete
-- Pattern      : SELF JOIN + DELETE
-- Concepts     : DELETE, SELF JOIN, Aliasing
-- Time         : O(n²) (without indexing)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
Delete all duplicate email records.

Keep only the record with the smallest id
for each unique email address.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Person
------
id      INT
email   VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. SELF JOIN the Person table.
2. Match rows having the same email.
3. Compare their IDs.
4. Delete the row with the larger ID.
5. The smallest ID for each email remains.
*/

-- ==========================================================
-- Solution
-- ==========================================================

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
Example:

Before:

id   email
--------------
1    a@gmail.com
2    a@gmail.com
3    b@gmail.com
4    a@gmail.com

SELF JOIN:

(2,1)
(4,1)
(4,2)

Since:

p1.id > p2.id

Rows deleted:

2
4

Remaining:

1    a@gmail.com
3    b@gmail.com

Thus, only the smallest id for each email remains.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: Remove Duplicates using SELF JOIN

General Pattern:

DELETE t1
FROM table t1
JOIN table t2
ON t1.column = t2.column
AND t1.id > t2.id;

Common Interview Questions:

✓ Delete Duplicate Emails
✓ Remove Duplicate Customers
✓ Remove Duplicate Products
✓ Keep Earliest Record
✓ Data Cleaning
✓ Deduplication

Remember:

SELF JOIN
→ Compares rows within the same table.

Condition:

t1.id > t2.id

keeps the smallest ID.

Changing the comparison:

t1.id < t2.id

would keep the largest ID instead.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n²)
(without indexes)

Time Complexity : O(n log n)
(with index on email)

Space Complexity: O(1)
*/
