# Write your MySQL query statement below
# source: https://leetcode.cn/problems/students-report-by-geography/

# SELECT name, ROW_NUMBER() OVER(PARTITION BY continent)
# FROM student;

SELECT MAX(CASE WHEN temp.continent = 'America' THEN temp.name ELSE NULL END) AS America
    , MAX(CASE WHEN temp.continent = 'Asia' THEN temp.name ELSE NULL END) AS Asia
    , MAX(CASE WHEN temp.continent = 'Europe' THEN temp.name ELSE NULL END) AS Europe
FROM (
    SELECT name, continent, ROW_NUMBER() OVER(PARTITION BY continent ORDER BY name) AS num
    FROM student
) AS temp
GROUP BY temp.num;