# Write your MySQL query statement below
# source: https://leetcode.cn/problems/not-boring-movies/

SELECT * FROM cinema
WHERE description <> 'boring'
AND MOD(id, 2) = 1
ORDER BY rating DESC;