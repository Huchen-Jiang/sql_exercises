# Write your MySQL query statement below
# source: https://leetcode.cn/problems/median-employee-salary/

# 中位数，正反序列号相等（奇数），正反序列号差一（偶数）

SELECT temp.id, temp.company, temp.salary
FROM (
    SELECT id, company, salary
    , CAST(ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary ASC, id ASC) AS SIGNED) AS R1
    , CAST(ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary DESC, id DESC) AS SIGNED) AS R2
    FROM Employee
) AS temp
WHERE ABS(temp.R1 - temp.R2) = 1 OR temp.R1 = temp.R2;