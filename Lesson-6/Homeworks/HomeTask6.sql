use W3Resource

--1
select * from Employee.employees

--2
select salary from Employee.employees

--3
select distinct job_name from Employee.employees

--4
select emp_name, salary as previous_salary, '$ ' + cast(1.15*salary as varchar(50)) as increased_salary 
from Employee.employees

--5
select emp_name + '  ' + job_name as  'Employee & Job'
from employee.employees
 
--6 
select emp_name + '(' + lower(job_name) + ')' as  'Employee'
from employee.employees

--7
select emp_id, emp_name, salary, format(hire_date,'MMMM dd, yyyy') as to_char
from employee.employees

--8
select emp_name, len(emp_name) as length
from employee.employees

--9
select emp_id, salary, commission
from employee.employees

--10	
select distinct dep_id, job_name from employee.employees

--11
select * from employee.employees
where dep_id <> 2001

--12 
select * from employee.employees
where hire_date <'1991-01-01'

--13
select avg(salary) from employee.employees
where job_name = upper('analyst')

--14 
select * from employee.employees
where emp_name = 'BLAZE'

--15
select * from employee.employees
where salary<commission

--16
select * from employee.employees
where salary*1.25>3000

--17
select emp_name from employee.employees
where len(emp_name)=6

--18
select * 
from employee.employees
where hire_date like '____-01-__'

--19
select e1.emp_name+' works for '+e2.emp_name
from employee.employees e1, employee.employees e2
where e2.emp_id=e1.manager_id

--20
select * from employee.employees
where job_name='CLERK'

--21
SELECT *
FROM employee.employees
WHERE EXTRACT(YEAR
              FROM age(CURRENT_DATE, hire_date)) > 27;

--22
select * from employee.employees
where salary<3500

--23
select * from employee.employees
where job_name=upper('analyst')

--24
select * from employee.employees
where hire_date like '1991%'

--25
select * from employee.employees
where hire_date <'1991-04-01'

--26
select emp_name, job_name from employee.employees
where manager_id is null

--27
select * from employee.employees
where hire_date ='1991-05-01'

--28
select *  from employee.employees
where manager_id='68319'

--29
select *  from employee.employees
where (salary/30)>100

--30
--select *  from employee.employees
--WHERE hire_date + interval '96 months' > '1999-12-31

--31
select *  from employee.employees
where salary%2=1

--32
select *  from employee.employees
where salary<1000 and salary>=100

--33
select * 
from employee.employees
where hire_date like '____-04-__'

--34
select * 
from employee.employees
where day(hire_date)<19

--35
select * 
from employee.employees
where job_name = 'salesman' AND DATEDIFF(MONTH, hire_date, GETDATE()) > 10

--36
select * 
from employee.employees
where (dep_id=1001 or dep_id=3001) and  hire_date like '1991%'

--37
select * 
from employee.employees
where dep_id=1001 or dep_id=2001

--38
select * 
from employee.employees
where job_name='clerk' and dep_id=2001

--39
select * 
from employee.employees
where commission is not null and salary>commission and 12*(salary+commission) < 34000 and job_name='salesman' and dep_id=3001

--40
select * 
from employee.employees
where job_name = 'CLERK' or job_name = 'MANAGER'



