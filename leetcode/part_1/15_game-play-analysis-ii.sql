# Write your MySQL query statement below
# source: https://leetcode.cn/problems/game-play-analysis-ii/

SELECT temp.player_id, temp.device_id
FROM (
    SELECT player_id, device_id
        , ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS RN
    FROM Activity
) AS temp
WHERE temp.RN = 1;