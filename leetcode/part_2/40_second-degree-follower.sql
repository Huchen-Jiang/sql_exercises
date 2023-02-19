# Write your MySQL query statement below
# source: https://leetcode.cn/problems/second-degree-follower/

SELECT followee AS follower, COUNT(*) AS num
FROM follow
WHERE followee IN (
    SELECT follower AS id FROM follow
)
GROUP BY followee
ORDER BY follower ASC;