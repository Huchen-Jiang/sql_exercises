# Write your MySQL query statement below
# source: https://leetcode.cn/problems/get-highest-answer-rate-question/

SELECT question_id AS survey_log FROM SurveyLog
WHERE answer_id IS NOT NULL
GROUP BY question_id
ORDER BY SUM(action="answer") DESC, question_id ASC
LIMIT 1;