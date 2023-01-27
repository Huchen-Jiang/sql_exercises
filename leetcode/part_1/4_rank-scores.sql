# Write your MySQL query statement below
# source: https://leetcode.cn/problems/rank-scores/

SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank' FROM Scores;