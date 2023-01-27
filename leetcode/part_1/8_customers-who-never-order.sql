# Write your MySQL query statement below
# source: https://leetcode.cn/problems/customers-who-never-order/

SELECT c.Name AS Customers FROM Customers c
LEFT JOIN Orders o
ON o.CustomerId = c.Id
WHERE o.CustomerId IS NULL;