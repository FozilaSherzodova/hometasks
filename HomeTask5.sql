create database HW5 

use HW5

use W3Resource

--overall sorted
select salary, dep_id
from Employee.employees
order by dep_id, salary desc

--highest salaries in each department
select max(salary), dep_id
from Employee.employees
group by dep_id

--2nd highest salary 
select salary
from Employee.employees
where salary=(select max(salary) from Employee.employees where salary <(select max(salary) from Employee.employees))

--tripling
select e1.salary, e1.dep_id
from Employee.employees e1
join Employee.employees e2
on e1.dep_id=e2.dep_id  
order by e1.dep_id, salary desc

--2nd highest in each department
select max(e1.salary), e1.dep_id
from Employee.employees e1
join Employee.employees e2
on e1.dep_id=e2.dep_id  AND e1.salary < e2.salary
group by e1.dep_id





