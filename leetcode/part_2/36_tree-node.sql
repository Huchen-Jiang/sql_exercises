# Write your MySQL query statement below
# source: https://leetcode.cn/problems/tree-node/

SELECT id,
    CASE WHEN p_id IS NULL THEN 'Root'
         WHEN id NOT IN (SELECT p_id FROM tree WHERE p_id IS NOT NULL) THEN 'Leaf'
         ELSE 'Inner'
    END AS Type
FROM tree
ORDER BY id ASC;
