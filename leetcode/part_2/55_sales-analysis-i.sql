# Write your MySQL query statement below
# source: https://leetcode.cn/problems/sales-analysis-i/

SELECT temp.seller_id
FROM (
    SELECT seller_id
        , DENSE_RANK() OVER(ORDER BY SUM(price) DESC) AS rnk
    FROM Sales
    GROUP BY seller_id
) AS temp
WHERE temp.rnk = 1;