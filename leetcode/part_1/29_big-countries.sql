# Write your MySQL query statement below
# https://leetcode.cn/problems/big-countries/

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;