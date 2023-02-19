# Write your MySQL query statement below
# source: https://leetcode.cn/problems/exchange-seats/

SELECT CASE WHEN MOD(id, 2) = 1 AND id = (SELECT COUNT(id) FROM Seat) THEN id
            WHEN MOD(id, 2) = 1 THEN id + 1
            ELSE id-1
        END AS id, student
FROM Seat
ORDER BY id ASC;