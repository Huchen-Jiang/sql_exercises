# Write your MySQL query statement below
# source: https://leetcode.cn/problems/product-sales-analysis-i/

SELECT p.product_name, s.year, s.price
FROM Product p
RIGHT JOIN Sales s
ON p.product_id = s.product_id
ORDER BY s.year ASC;