# Write your MySQL query statement below
# source: https://leetcode.cn/problems/sales-analysis-ii/

SELECT s.buyer_id
FROM Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id
GROUP BY s.buyer_id
HAVING SUM(p.product_name='S8') > 0 
AND SUM(p.product_name='iPhone') = 0;