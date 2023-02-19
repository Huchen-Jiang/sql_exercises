# Write your MySQL query statement below
# source: https://leetcode.cn/problems/biggest-single-number/

SELECT (
    SELECT num FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    ORDER BY num DESC
    LIMIT 1
) AS num;