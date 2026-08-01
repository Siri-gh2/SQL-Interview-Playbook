-- ==========================================================
-- Problem      : Students and Examinations
-- LeetCode ID  : 1280
-- Difficulty   : Easy
-- Category     : Basic Joins
-- Pattern      : CROSS JOIN + LEFT JOIN + GROUP BY
-- Concepts     : CROSS JOIN, LEFT JOIN, COUNT(), GROUP BY
-- Time         : O(S × Sub + E)
-- Space        : O(1)
-- ==========================================================

/*
Problem Statement
-----------------
For every student and every subject, report the number of
times the student attended the examination.

Return the result ordered by:
1. student_id
2. subject_name
*/

-- ==========================================================
-- Table Schema
-- ==========================================================

/*
Students
--------
student_id     INT
student_name   VARCHAR

Subjects
--------
subject_name   VARCHAR

Examinations
------------
student_id     INT
subject_name   VARCHAR
*/

-- ==========================================================
-- Approach
-- ==========================================================

/*
1. Generate every possible Student-Subject combination
   using CROSS JOIN.
2. LEFT JOIN the Examinations table using:
      - student_id
      - subject_name
3. COUNT() the matching examination records.
4. GROUP BY each student and subject.
5. Sort by student_id and subject_name.
*/

-- ==========================================================
-- Solution
-- ==========================================================

SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
ON s.student_id = e.student_id
AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;

-- ==========================================================
-- Explanation
-- ==========================================================

/*
• CROSS JOIN generates every possible combination of
  students and subjects.
• LEFT JOIN matches examination records for each
  student-subject pair.
• COUNT(e.subject_name) counts only matched exams.
• If no exam exists, COUNT() returns 0.
• GROUP BY ensures one row per student-subject pair.
*/

-- ==========================================================
-- Pattern Learned
-- ==========================================================

/*
Use CROSS JOIN when every combination of two tables
is required.

General Pattern:

SELECT ...
FROM Table1
CROSS JOIN Table2;

Use LEFT JOIN afterward when counting matching records.

Common Interview Questions:

✓ Student × Subject combinations
✓ Product × Store combinations
✓ Employee × Project combinations
✓ Calendar × Events
✓ User × Category matrices
*/

-- ==========================================================
-- Complexity Analysis
-- ==========================================================

/*
Time Complexity : O(S × Sub + E)

where:
S   = Number of students
Sub = Number of subjects
E   = Number of examination records

Space Complexity: O(1)
*/
