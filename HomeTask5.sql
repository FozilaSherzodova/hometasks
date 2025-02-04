create database HW5 

use HW5

--TASK1
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


--TASK2
--1.Return total purchase amount.
use W3Resource
select sum(purch_amt) from Inventory.Orders

--2.Return average purchase amount. 
select avg(purch_amt) from Inventory.Orders

--3.Return number of salespeople. 
select count(distinct salesman_id) from Inventory.Orders

--4.Return number of customers. 
select count(distinct customer_id) from Inventory.Orders

--5.write a SQL query to determine the number of customers who received at least one grade for their activity.
select count(customer_id) from Inventory.Customer
where grade>0

--6. maximum purchase amount
select max(purch_amt) from Inventory.Orders

--7 minimum
select min(purch_amt) from Inventory.Orders

--8. max grade in each city
select city, max(grade) from Inventory.Customer
group by city

--9.max purchase amount ordered by each customer
select customer_id, max(purch_amt) from Inventory.Orders
group by customer_id

--10
select customer_id, ord_date, max(purch_amt) as max
from Inventory.Orders
group by customer_id, ord_date

--11. the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount 
select salesman_id, max(purch_amt) as max	 
from Inventory.Orders
WHERE ord_date = '2012-08-17'
group by salesman_id

--12Return customer id, order date and maximum purchase amount.
select customer_id, ord_date, max(purch_amt) as max	 
from Inventory.Orders
group by customer_id, ord_date
having max(purch_amt) >2000

--13.Return customer id, order date and maximum purchase amount.
select customer_id, ord_date, max(purch_amt) as max	 
from Inventory.Orders
group by customer_id, ord_date
having max(purch_amt)>=2000 and max(purch_amt)<=6000 

--14 Return customer id, order date and maximum purchase amount.
select customer_id, ord_date, max(purch_amt) as max	 
from Inventory.Orders
group by customer_id, ord_date
having max(purch_amt)=2000 or max(purch_amt)=3000 or max(purch_amt)=5760 or max(purch_amt)=6000

--15Return customer id and maximum purchase amount.
select customer_id, max(purch_amt) as max	 
from Inventory.Orders
group by customer_id
having customer_id>=3002 and customer_id<=3007

--16 Return customer id and maximum purchase amount.
select customer_id, max(purch_amt) as max	 
from Inventory.Orders
group by customer_id
having customer_id>=3002 and customer_id<=3007 and max(purch_amt)>1000

--17  salesperson id and maximum purchase amount.
select salesman_id, max(purch_amt) as max	 
from Inventory.Orders
group by salesman_id
having salesman_id>=5003 and salesman_id<=5008 

--18 Return number of orders.
select count(ord_date) from Inventory.Orders
where ord_date =  '2012-08-17'

--19. count the number of salespeople in a city.
select count(city) from Inventory.Salesman

--20.Return order date, salesperson id.
select ord_date, salesman_id, count(*) as count
from Inventory.Orders	
group by ord_date, salesman_id

--21. average product price
select avg(pro_price) as Average 
from  item_mast

--22.count the number of products whose price are higher than or equal to 350.
select count(pro_price) as Average 
from  item_mast
where pro_price>=350
	
--23Return average price and company id.
select pro_com, avg(pro_price) as Average 
from  item_mast
group by pro_com

--24 here asked sum of the allotment amount of all departments but in this table there is no column about allotment
--instead i will find sum of salaries from another table to practice
select sum(salary) as sum from Employee.employees

--25 Return department code and number of employees.
select emp_dept, count(emp_lname) as count
from emp_details
group by emp_dept

