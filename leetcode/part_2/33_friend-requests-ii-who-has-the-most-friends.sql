# Write your MySQL query statement below
# source: https://leetcode.cn/problems/friend-requests-ii-who-has-the-most-friends/

SELECT temp.id, SUM(temp.n) AS num
FROM ((
    SELECT requester_id AS id, COUNT(*) AS n
    FROM RequestAccepted
    GROUP BY requester_id
)
UNION ALL
(
    SELECT accepter_id AS id, COUNT(*) AS n
    FROM RequestAccepted
    GROUP BY accepter_id
)) temp
GROUP BY temp.id
ORDER BY num DESC
LIMIT 1;