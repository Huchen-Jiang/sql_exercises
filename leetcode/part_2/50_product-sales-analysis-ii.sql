# Write your MySQL query statement below
# source: https://leetcode.cn/problems/product-sales-analysis-ii/

SELECT product_id, SUM(quantity) AS total_quantity
FROM Sales
GROUP BY product_id;