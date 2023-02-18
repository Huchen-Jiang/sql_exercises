# Write your MySQL query statement below
# source: https://leetcode.cn/problems/consecutive-available-seats/

SELECT DISTINCT a.seat_id
FROM Cinema a, Cinema b
WHERE a.free = 1 AND b.free = 1 AND
(
    (a.seat_id = b.seat_id - 1)
    OR (a.seat_id = b.seat_id + 1)
)
ORDER BY seat_id ASC;