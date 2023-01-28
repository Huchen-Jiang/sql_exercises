# Write your MySQL query statement below
# source: https://leetcode.cn/problems/find-median-given-frequency-of-numbers/

SELECT ROUND(AVG(temp.num), 1) AS median FROM (
    SELECT num, frequency
        , SUM(frequency) OVER(ORDER BY num ASC) AS sum1
        , SUM(frequency) OVER(ORDER BY num DESC) AS sum2
        , SUM(frequency) OVER() AS total
    FROM NUMBERS
) AS temp
WHERE temp.sum1 >= temp.total / 2 AND temp.sum2 >= temp.total / 2;