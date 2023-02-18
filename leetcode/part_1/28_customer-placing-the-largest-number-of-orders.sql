# Write your MySQL query statement below
# https://leetcode.cn/problems/customer-placing-the-largest-number-of-orders/

SELECT customer_number FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;