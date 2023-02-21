# Write your MySQL query statement below
# source: https://leetcode.cn/problems/game-play-analysis-v/

SELECT temp.first_date AS install_dt
    , COUNT(DISTINCT temp.player_id) AS installs
    , ROUND(SUM(IF(DATEDIFF(event_date, first_date)=1, 1, 0)) / COUNT(DISTINCT player_id), 2) AS Day1_retention 
FROM (
    SELECT player_id, event_date, MIN(event_date) OVER(PARTITION BY player_id) AS first_date
    FROM Activity
) AS temp
GROUP BY temp.first_date