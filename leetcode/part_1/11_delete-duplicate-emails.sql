# Please write a DELETE statement and DO NOT write a SELECT statement.
# Write your MySQL query statement below
# source: https://leetcode.cn/problems/delete-duplicate-emails/

DELETE FROM Person
WHERE id NOT IN (
    SELECT temp.id FROM (
        SELECT MIN(id) AS id
        FROM Person
        GROUP BY email
    ) AS temp
);
