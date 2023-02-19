# Write your MySQL query statement below
# source: https://leetcode.cn/problems/customers-who-bought-all-products/

SELECT DISTINCT customer_id
FROM Customer c
WHERE product_key IN (SELECT DISTINCT product_key FROM Product)
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product);
