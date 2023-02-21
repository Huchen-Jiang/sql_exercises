# Write your MySQL query statement below
# source: https://leetcode.cn/problems/project-employees-iii/

SELECT temp.project_id, temp.employee_id FROM (
    SELECT p.project_id, p.employee_id
        , DENSE_RANK() OVER(PARTITION BY project_id ORDER BY experience_years DESC) AS rnk
    FROM Project p LEFT JOIN Employee e
    ON p.employee_id = e.employee_id
) AS temp
WHERE temp.rnk = 1;