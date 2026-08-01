-- ==========================================================
-- Problem      : Invalid Tweets
-- LeetCode ID  : 1683
-- Difficulty   : Easy
-- Category     : SELECT
-- Pattern      : String Length Filtering
-- Concepts     : SELECT, WHERE, CHAR_LENGTH()
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
A tweet is considered invalid if its content contains
more than 15 characters.

Return the IDs of all invalid tweets.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Tweets
------
tweet_id    INT
content     VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Select the tweet IDs.
2. Calculate the length of each tweet's content.
3. Keep only tweets whose content length is greater than 15.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• CHAR_LENGTH(content) returns the number of characters
  in the tweet.
• WHERE filters tweets whose length exceeds 15.
• Only invalid tweet IDs are returned.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use string length functions whenever filtering based on
the length of text.

General Pattern:

SELECT columns
FROM table
WHERE CHAR_LENGTH(column) > value;

Common string functions:

✓ CHAR_LENGTH() → Number of characters
✓ LENGTH()      → Number of bytes
✓ LEFT()
✓ RIGHT()
✓ SUBSTRING()
✓ CONCAT()
✓ UPPER()
✓ LOWER()

Note:
CHAR_LENGTH() is preferred because it counts characters,
whereas LENGTH() counts bytes (important for Unicode text).
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
