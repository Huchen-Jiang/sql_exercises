# Write your MySQL query statement below
# source: https://leetcode.cn/problems/count-student-number-in-departments/

SELECT dept_name, SUM(student_id IS NOT NULL) AS student_number FROM Department d
LEFT JOIN Student s
ON d.dept_id = s.dept_id
GROUP BY dept_name
ORDER BY student_number DESC, dept_name ASC;