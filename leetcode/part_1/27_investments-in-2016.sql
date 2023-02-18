# Write your MySQL query statement below
# source: https://leetcode.cn/problems/investments-in-2016/

SELECT ROUND(SUM(TIV_2016), 2) AS tiv_2016 FROM (
    SELECT *
    , COUNT(PID) OVER(PARTITION BY TIV_2015) AS count_tiv2015
    , COUNT(PID) OVER(PARTITION BY LAT, LON) AS count_city
    FROM insurance
) AS temp
WHERE temp.count_tiv2015 > 1 AND temp.count_city = 1;