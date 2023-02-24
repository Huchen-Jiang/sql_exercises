# Write your MySQL query statement below
# source: https://leetcode.cn/problems/unpopular-books/

SELECT b.book_id, b.name FROM Books b
LEFT JOIN Orders o
ON b.book_id = o.book_id AND o.dispatch_date >= '2018-06-23'
WHERE b.available_from < '2019-05-23'
GROUP BY b.book_id
HAVING IFNULL(SUM(o.quantity), 0)<10;