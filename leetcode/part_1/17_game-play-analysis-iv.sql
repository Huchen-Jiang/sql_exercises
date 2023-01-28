# Write your MySQL query statement below
# source: https://leetcode.cn/problems/game-play-analysis-iv/

# 注意题目说的是首次登陆的第二天再次登录的比率而不是连续登录两天

SELECT ROUND((COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity)), 2) AS fraction
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY)
    FROM Activity
    GROUP BY player_id
);
