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
