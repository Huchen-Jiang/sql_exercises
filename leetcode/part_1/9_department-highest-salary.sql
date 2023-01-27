# Write your MySQL query statement below
# source: https://leetcode.cn/problems/department-highest-salary/

# SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
# FROM Employee e
# LEFT JOIN Department d
# ON e.departmentId = d.id
# WHERE (e.salary, e.departmentId) IN (
#     SELECT MAX(salary), departmentId
#     FROM Employee
#     GROUP BY departmentId
# );

# 使用窗口函数效率更高，也适用于更多场景
SELECT temp.Department, temp.Employee, temp.Salary FROM (
    SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
        , DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS RN
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentId = d.id
) AS temp
 WHERE temp.RN = 1;
