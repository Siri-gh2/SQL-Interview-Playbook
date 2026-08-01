-- ==========================================================
-- Problem      : Friend Requests II: Who Has the Most Friends
-- LeetCode ID  : 602
-- Difficulty   : Medium
-- Category     : SQL UNION
-- Pattern      : UNION ALL + GROUP BY + ORDER BY
-- Concepts     : UNION ALL, GROUP BY, COUNT(), ORDER BY, LIMIT
-- Time         : O(n)
-- Space        : O(n)
-- ==========================================================

/*
Problem Statement
-----------------
Find the person who has the most friends.

A friend request connects:
- requester_id
- accepter_id

A friendship is mutual, meaning both requester and
accepter are considered friends.

Return:
- id
- num (number of friends)
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
RequestAccepted
---------------
requester_id   INT
accepter_id    INT
accept_date    DATE
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Convert every friendship into two records:
      requester → friend
      accepter  → friend

2. Use UNION ALL to combine both directions.

3. GROUP BY person id.

4. Count total friends for each person.

5. Sort by friend count in descending order.

6. Return the top person.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    id,
    COUNT(*) AS num
FROM
(
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id
    FROM RequestAccepted
) AS friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• Each friendship contributes one friend to both people.

Example:

1 → 2

becomes

1
2

using UNION ALL.

• GROUP BY id collects all friendships of each person.

• COUNT(*) calculates the number of friends.

• ORDER BY num DESC places the person with
  the maximum friends first.

• LIMIT 1 returns the required answer.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: UNION ALL + Aggregation

General Pattern:

SELECT id
FROM
(
    SELECT column1 AS id
    FROM table

    UNION ALL

    SELECT column2
    FROM table
) t
GROUP BY id;

Common Interview Questions:

✓ Most Friends
✓ Network Degree
✓ Incoming + Outgoing Connections
✓ Followers + Following
✓ Total Transactions
✓ Graph Problems

Remember:

UNION
→ Removes duplicates.

UNION ALL
→ Keeps all rows (faster).

Use UNION ALL when duplicates are meaningful,
such as counting occurrences.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(n)
*/
