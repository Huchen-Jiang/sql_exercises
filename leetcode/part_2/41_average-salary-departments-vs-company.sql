# Write your MySQL query statement below
# source: https://leetcode.cn/problems/average-salary-departments-vs-company/

SELECT DISTINCT temp.*
FROM (SELECT DATE_FORMAT(s.pay_date, '%Y-%m') AS pay_month,
    e.department_id,
    CASE WHEN AVG(s.amount) OVER(PARTITION BY e.department_id, s.pay_date)
                > AVG(s.amount) OVER(PARTITION BY s.pay_date) THEN 'higher'
         WHEN AVG(s.amount) OVER(PARTITION BY e.department_id, s.pay_date)
                < AVG(s.amount) OVER(PARTITION BY s.pay_date) THEN 'lower'
         WHEN AVG(s.amount) OVER(PARTITION BY e.department_id, s.pay_date)
                = AVG(s.amount) OVER(PARTITION BY s.pay_date) THEN 'same'
         END AS comparison
FROM salary s
LEFT JOIN employee e
ON s.employee_id = e.employee_id
ORDER BY pay_month DESC, department_id ASC) AS temp;