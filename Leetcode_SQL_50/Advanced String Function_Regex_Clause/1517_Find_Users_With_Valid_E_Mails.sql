-- ==========================================================
-- Problem      : Find Users With Valid E-Mails
-- LeetCode ID  : 1517
-- Difficulty   : Easy
-- Category     : String Functions
-- Pattern      : REGEXP Pattern Matching
-- Concepts     : REGEXP, Regular Expressions, String Validation
-- Time         : O(n)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
A valid email must satisfy the following rules:

1. Starts with a letter.
2. Contains only:
   - letters (A-Z, a-z)
   - digits (0-9)
   - underscore (_)
   - period (.)
   - hyphen (-)
   before '@'.
3. Domain must be exactly:
   @leetcode.com

Return all valid users.
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Users
-----
user_id    INT
name       VARCHAR
mail       VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
Use REGEXP to validate the email format.

Regex Breakdown:

^
→ Start of string

[A-Za-z]
→ First character must be a letter

[A-Za-z0-9_.-]*
→ Remaining username characters

@leetcode\.com
→ Required domain

$
→ End of string
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT *
FROM Users
WHERE mail REGEXP
'^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$';

-- ==========================================================
-- Explanation
-- ==========================================================

/*
Regex:

^[A-Za-z]
→ Email starts with a letter.

[A-Za-z0-9_.-]*
→ Zero or more allowed characters.

@leetcode\.com
→ Matches exactly "@leetcode.com".

$
→ Ensures nothing follows ".com".

Examples:

abc@leetcode.com
✓ Valid

Alice_12@leetcode.com
✓ Valid

1abc@leetcode.com
✗ Starts with a digit

abc@gmail.com
✗ Wrong domain

abc@leetcode.co
✗ Invalid domain
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Pattern: REGEXP Validation

General Pattern:

column REGEXP
'pattern'

Useful Regex Symbols:

^
→ Start of string

$
→ End of string

*
→ Zero or more characters

+
→ One or more characters

.
→ Any character

\.
→ Literal dot

[]

→ Character set

Examples:

^[A-Za-z]+$

→ Only letters

^[0-9]+$

→ Only digits

^[A-Za-z][A-Za-z0-9_.-]*$

→ Valid username

Common Interview Questions:

✓ Email Validation
✓ Username Validation
✓ Phone Number Validation
✓ Password Validation
✓ Product Code Validation
✓ License Plate Validation

Remember:

LIKE
→ Simple wildcard matching.

REGEXP
→ Advanced pattern matching with character classes,
quantifiers, anchors, and escaped symbols.
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(n)
Space Complexity: O(1)
*/
