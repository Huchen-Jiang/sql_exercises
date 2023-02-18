# Write your MySQL query statement below
# source: https://leetcode.cn/problems/human-traffic-of-stadium/

SELECT DISTINCT a.*
FROM Stadium a, Stadium b, Stadium c
WHERE a.people >= 100 AND b.people >= 100 AND c.people >= 100
AND (
    (a.id = b.id - 1 AND b.id = c.id - 1)
    OR (a.id = b.id - 1 AND a.id = c.id + 1)
    OR (a.id = b.id + 1 AND b.id = c.id + 1)
)
ORDER BY visit_date ASC;