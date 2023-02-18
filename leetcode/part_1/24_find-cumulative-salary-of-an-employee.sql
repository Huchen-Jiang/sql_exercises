# Write your MySQL query statement below
# source: https://leetcode.cn/problems/find-cumulative-salary-of-an-employee/

SELECT temp.Id, temp.Month, temp.cum_sum AS Salary FROM (
    SELECT Id, `Month`
        , SUM(Salary) OVER(PARTITION BY Id ORDER BY `Month` RANGE 2 PRECEDING) AS cum_sum
        , RANK() OVER(PARTITION BY Id ORDER BY `Month` DESC) AS R
    FROM Employee
) AS temp
WHERE temp.R > 1;