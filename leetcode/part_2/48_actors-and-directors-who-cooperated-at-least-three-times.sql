# Write your MySQL query statement below
# source: https://leetcode.cn/problems/actors-and-directors-who-cooperated-at-least-three-times/

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(timestamp) >= 3;