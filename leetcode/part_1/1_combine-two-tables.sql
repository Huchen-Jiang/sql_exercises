# Write your MySQL query statement below
# source: https://leetcode.cn/problems/combine-two-tables/

SELECT p.FirstName, p.LastName, a.City, a.State
FROM Person p
LEFT JOIN Address a
ON p.PersonId = a.PersonId;