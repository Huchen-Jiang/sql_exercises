# Write your MySQL query statement below
# source: https://leetcode.cn/problems/rising-temperature/

SELECT temp.id FROM (
    SELECT id, recordDate, Temperature
        , LAG(Temperature, 1) OVER(ORDER BY recordDate) AS prev_temp
        , LAG(recordDate, 1) OVER() AS prev_date
    FROM Weather
) AS temp
WHERE temp.Temperature - temp.prev_temp > 0 AND DATEDIFF(temp.recordDate, temp.prev_date) = 1;