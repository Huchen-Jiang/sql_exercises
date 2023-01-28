# Write your MySQL query statement below
# source: https://leetcode.cn/problems/department-top-three-salaries/

SELECT temp.Department, temp.Employee, temp.Salary FROM (
    SELECT d.name AS Department, e.Name AS Employee, e.salary AS Salary
        , DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS RN
    FROM Employee e
    LEFT JOIN Department d
    ON e.departmentId = d.id
) AS temp
WHERE temp.RN <= 3;