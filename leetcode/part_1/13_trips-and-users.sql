# Write your MySQL query statement below
# source: https://leetcode.cn/problems/trips-and-users/

SELECT request_at AS Day
    , ROUND(COUNT(IF(status != 'completed', status, NULL))/COUNT(status), 2) AS 'Cancellation Rate'
FROM Trips t
INNER JOIN Users u1
ON u1.users_id = t.client_id AND u1.banned = 'No'
INNER JOIN Users u2
ON u2.users_id = t.driver_id AND u2.banned = 'No'
WHERE request_at >= '2013-10-01' AND request_at <= '2013-10-03'
GROUP BY request_at;
