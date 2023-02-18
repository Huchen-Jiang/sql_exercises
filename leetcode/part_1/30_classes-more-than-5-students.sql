# Write your MySQL query statement below
# source: https://leetcode.cn/problems/classes-more-than-5-students/

SELECT class FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;