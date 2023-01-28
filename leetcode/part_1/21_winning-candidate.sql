# Write your MySQL query statement below
# source: https://leetcode.cn/problems/winning-candidate/

# 使用了ORDER BY 和LIMIT，根据题意不存在同票情况
SELECT c.name FROM Candidate c
LEFT JOIN(
    SELECT candidateId, COUNT(candidateId) AS cnt
    FROM Vote
    GROUP BY candidateId
) AS temp
ON temp.candidateId = c.id
ORDER BY temp.cnt DESC
LIMIT 1;

# SELECT c.name FROM Candidate c
# RIGHT JOIN Vote v
# ON v.candidateId = c.id
# GROUP BY c.name
# HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM Vote GROUP BY candidateId);
