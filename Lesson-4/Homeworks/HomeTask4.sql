create database HW4

use W3Resource

SELECT *
FROM Employee.employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee.employees
    WHERE salary < (SELECT MAX(salary) FROM Employee.employees)
);





