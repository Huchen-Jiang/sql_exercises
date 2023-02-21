# Write your MySQL query statement below
# source: https://leetcode.cn/problems/sales-analysis-iii/


SELECT p.product_id, p.product_name
FROM Sales s
LEFT JOIN Product p
ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING SUM(s.sale_date<'2019-01-01') = 0 AND SUM(s.sale_date>'2019-03-31') = 0;