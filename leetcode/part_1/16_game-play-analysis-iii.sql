# Write your MySQL query statement below
# source: https://leetcode.cn/problems/game-play-analysis-iii/

SELECT player_id, event_date
    , SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
FROM Activity;