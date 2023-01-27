# Write your MySQL query statement below
# source: https://leetcode.cn/problems/second-highest-salary/

SELECT IFNULL(
(SELECT DISTINCT salary 
FROM Employee
ORDER BY salary DESC
LIMIT 1, 1), null) AS SecondHighestSalary;