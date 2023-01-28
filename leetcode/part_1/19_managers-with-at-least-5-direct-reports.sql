# Write your MySQL query statement below
# source: https://leetcode.cn/problems/managers-with-at-least-5-direct-reports/

SELECT e2.name
FROM Employee e1
RIGHT JOIN Employee e2
ON e1.managerId = e2.id
GROUP BY e2.id
HAVING COUNT(e1.id) >= 5; 