# Write your MySQL query statement below
# source: https://leetcode.cn/problems/new-users-daily-count/

SELECT activity_date AS login_date, COUNT(*) AS user_count
FROM (
    SELECT user_id
        , activity_date
        , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY activity_date) AS rnk
    FROM Traffic
    WHERE activity = 'login'
) AS temp
WHERE temp.rnk = 1
    AND DATEDIFF('2019-06-30', temp.activity_date)<=90
GROUP BY activity_date;
