# Write your MySQL query statement below
# source: https://leetcode.cn/problems/employee-bonus/

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
# WHERE IFNULL(b.bonus, 0) < 1000;