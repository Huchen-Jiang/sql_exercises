# Write your MySQL query statement below
# source: https://leetcode.cn/problems/highest-grade-for-each-student/

SELECT student_id, course_id, grade
FROM (
    SELECT *
        , ROW_NUMBER() OVER(partition by student_id ORDER BY grade DESC, course_id ASC) as rnk
    FROM Enrollments
) AS temp
WHERE rnk = 1;