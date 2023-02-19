# Write your MySQL query statement below
# source: https://leetcode.cn/problems/swap-salary/

UPDATE Salary
SET sex = if(sex='m', 'f', 'm');