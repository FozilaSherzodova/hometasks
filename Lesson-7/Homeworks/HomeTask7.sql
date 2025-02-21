use W3Resource

--1
select s.name, c.cust_name, s.city 
from Inventory.Customer c, Inventory.Salesman s
where c.city = s.city

--2. Return ord_no, purch_amt, cust_name, city.
select o.ord_no, o.purch_amt, c.cust_name, c.city 
from Inventory.Customer c, Inventory.Orders o
where o.purch_amt>500 and o.purch_amt<2000

--3
select c.cust_name, s.city, s.name, s.commission 
from Inventory.Customer c, Inventory.Salesman s
where s.salesman_id=c.salesman_id

--4
select c.cust_name, s.city, s.name, s.commission 
from Inventory.Customer c
inner join Inventory.Salesman s
on s.salesman_id=c.salesman_id
where s.commission>0.12

--5
select c.cust_name, s.city, s.name, s.commission 
from Inventory.Customer c
inner join Inventory.Salesman s
on s.salesman_id=c.salesman_id
where s.commission>0.12 and s.city<>c.city

--6Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
select o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name, s.commission 
from Inventory.Customer c
inner join Inventory.Salesman s
on s.salesman_id=c.salesman_id
inner join Inventory.Orders o
on o.salesman_id=c.salesman_id

--7
select *
from Inventory.Customer c
inner join Inventory.Salesman s
on s.salesman_id=c.salesman_id
inner join Inventory.Orders o
on o.salesman_id=c.salesman_id

--8customer name, customer city, grade, salesman, salesman city
select c.cust_name, c.city, c.grade, s.name, s.city
from Inventory.Customer c
inner join Inventory.Salesman s
on s.salesman_id=c.salesman_id
order by c.customer_id asc

--9
select c.cust_name, c.city, c.grade, s.name, s.city
from Inventory.Customer c
inner join Inventory.Salesman s
on s.salesman_id=c.salesman_id
where c.grade<300
order by c.customer_id asc

--10
select c.cust_name, c.city, 
	   o.ord_no, o.ord_date, o.purch_amt
from Inventory.Customer c
left join Inventory.Orders o
on o.salesman_id=c.salesman_id
order by o.ord_date asc

--11customer name, city, order number, order date, order amount, salesperson name, and commission 
select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission from Inventory.Customer c
join Inventory.Orders o on c.customer_id=o.customer_id
join Inventory.Salesman s on c.salesman_id=s.salesman_id

--12
select c.cust_name, c.city, c.grade, s.name, s.city from Inventory.Customer c
right join Inventory.Salesman s on c.salesman_id=s.salesman_id
order by s.salesman_id asc

--13
select c.cust_name, c.city, c.grade, s.name, o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
right join Inventory.Salesman s on c.salesman_id=s.salesman_id
right join Inventory.Orders o on c.customer_id=o.customer_id

--14
select * from Inventory.Salesman s
left join Inventory.Orders o on o.salesman_id=s.salesman_id
join Inventory.Customer c on o.salesman_id=c.salesman_id
where grade>0 and ( o.customer_id = c.customer_id and o.purch_amt>200)

--15	
select c.cust_name, c.city,  o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
left join Inventory.Orders o on c.customer_id=o.customer_id

--16
select c.cust_name, c.city,  o.ord_no, o.ord_date, o.purch_amt from Inventory.Customer c
full join Inventory.Orders o on c.customer_id=o.customer_id
where c.grade is not null

--17
select * from Inventory.Customer c
full join Inventory.Salesman s on c.salesman_id=s.salesman_id

--18
select * from Inventory.Salesman s
cross join Inventory.Customer c
where  s.city is not null

--19
select * from Inventory.Salesman s
cross join Inventory.Customer c
where  c.grade is not null and s.city is not null

--20
select * from Inventory.Salesman s
cross join Inventory.Customer c
where  c.grade is not null and s.city != c.city

select * from Inventory.Salesman
select * from Inventory.Orders
select * from Inventory.Customer

--21-25
--no tables
--select * from comp_mast ???

--26-29
--no tables
--select * from emp_department ??
select * from emp_details
 
