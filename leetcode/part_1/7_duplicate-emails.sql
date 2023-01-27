# Write your MySQL query statement below
# scource: https://leetcode.cn/problems/duplicate-emails/

SELECT DISTINCT Email FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1