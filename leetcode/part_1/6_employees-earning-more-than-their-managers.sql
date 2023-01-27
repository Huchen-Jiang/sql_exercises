# Write your MySQL query statement below
# source: https://leetcode.cn/problems/employees-earning-more-than-their-managers/

SELECT e1.Name AS Employee FROM Employee e1
LEFT JOIN Employee e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;