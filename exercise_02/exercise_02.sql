-- 01. Select the last name of all employees.
SELECT LastName FROM employees;

-- 02. Select the last name of all employees, without duplicates.
SELECT DISTINCT LastName FROM employees;

-- 03. Select all the data of employees whose last name is "Smith".
SELECT * FROM employees
WHERE LastName = 'Smith';

-- 04. Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM employees
WHERE LastName = 'Smith' OR LastName = 'Doe';
-- WHERE LastName IN ('Smith', 'Doe')

-- 05. Select all the data of employees that work in department 14.
SELECT * FROM employees
WHERE Department = 14;

-- 06. Select all the data of employees that work in department 37 or department 77.
SELECT * FROM employees
WHERE Department IN (37, 77);

-- 07. Select all the data of employees whose last name begins with an "S".
SELECT * FROM employees
WHERE LastName LIKE 'S%';

-- 08. Select the sum of all the departments' budgets.
SELECT SUM(Budget) FROM departments;

-- 09. Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT d.Code, COUNT(SSN) FROM employees e
LEFT JOIN departments d
ON e.Department = d.Code
GROUP BY d.Code;

-- 10. Select all the data of employees, including each employee's department's data.
SELECT * FROM employees e
LEFT JOIN departments d
ON e.Department = d.Code;

-- 11. Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT e.Name, e.LastName, d.Name AS department_name, d.Budget FROM employees e
LEFT JOIN departments d
ON e.Department = d.Code;

-- 12. Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT e.Name, e.LastName FROM employees e
LEFT JOIN departments d
ON e.Department = d.Code
WHERE d.Budget > 60000;

-- 13. Select the departments with a budget larger than the average budget of all the departments.
SELECT * FROM departments
WHERE Budget > (SELECT AVG(Budget) FROM departments);

-- 14. Select the names of departments with more than two employees.
SELECT NAME FROM departments
WHERE Code IN (SELECT Department FROM employees GROUP BY Department HAVING COUNT(SSN) > 2);

-- 15. Select the name and last name of employees working for departments with second lowest budget.
-- Error Code: 1235. This version of MySQL doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'
-- Solution: use a subquery to warp the subquery with LIMIT
SELECT e.NAME, e.LastName, e.Department FROM employees e
WHERE e.Department IN (
SELECT temp.Code FROM(
	SELECT d.Code FROM departments d
    ORDER BY d.Budget ASC
    LIMIT 2, 1
) AS temp);

-- 16. Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO departments(Code,Name,Budget)
VALUE (11, "Quality Assurance", 40000);

INSERT INTO employees(SSN,Name,LastName,Department)
VALUE ("847219811", "Mary", "Moore", 11);

-- 17. Reduce the budget of all departments by 10%.
-- SET SQL_SAFE_UPDATES = 0;
UPDATE departments
SET Budget = Budget * 0.9;

-- 18. Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE employees
SET Department = 14
WHERE Department = 77;

-- 19. Delete from the table all employees in the IT department (code 14).
DELETE FROM employees
WHERE Department = 14;

-- 20. Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM employees
WHERE Department IN (
	SELECT Code FROM departments
    WHERE Budget >= 60000
);

-- 21. Delete from the table all employees.
DELETE FROM employees
WHERE 1 = 1;