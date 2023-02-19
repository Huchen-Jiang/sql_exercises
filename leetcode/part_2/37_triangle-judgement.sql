# Write your MySQL query statement below
# source: https://leetcode.cn/problems/triangle-judgement/

SELECT x, y, z, IF(
    (x + y > z) AND (x + z > y) AND (y + z > x),
    'Yes', 'No'
) AS triangle
FROM Triangle;