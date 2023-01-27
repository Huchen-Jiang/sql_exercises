# source: https://leetcode.cn/problems/nth-highest-salary/
# LIMIT中不能参与运算，因此需要在之前先进行N=N-1的操作


CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT IFNULL(
          (
              SELECT DISTINCT salary FROM Employee
              ORDER BY salary DESC
              LIMIT N, 1
          ), NULL
      )
  );
END