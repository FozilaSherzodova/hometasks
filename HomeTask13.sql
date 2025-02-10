use W3Resource

--1
select *
from Inventory.Orders
where salesman_id=(
select salesman_id from Inventory.Salesman 
where name='Paul Adam')

--2
select *
from Inventory.Orders
where salesman_id in(
select salesman_id from Inventory.Salesman 
where city='London')

--3
select * from Inventory.Orders
where salesman_id =(
select distinct salesman_id from Inventory.Orders
where customer_id=3007)

--4   
select * from Inventory.Orders
where purch_amt>(
select avg(purch_amt) from Inventory.Orders
where ord_date='2012-10-10')

--5
select * from Inventory.Orders
where salesman_id in (
select salesman_id from Inventory.Salesman
where city='New York')

--6
select commission from Inventory.Salesman
where salesman_id in (
select salesman_id from Inventory.Customer
where city='paris')

--7 customer_id=2001 name='Mc Lyon'
select * from Inventory.Customer
where customer_id=3001 and salesman_id in (
select salesman_id from Inventory.Salesman
where name='Mc Lyon')

--8
select * from Inventory.Customer
where grade > (
select avg(grade) from Inventory.Customer
where city='New York')

--9
select * 
from Inventory.Orders
where salesman_id = (
    select top 1 salesman_id 
    from Inventory.Salesman 
    order by commission DESC
);


--10
select o.* , c.cust_name
from Inventory.Orders o, Inventory.Customer c
where ord_date='2012-08-17' 
and o.customer_id=c.customer_id
	
--11
select salesman_id, name from Inventory.Salesman
where salesman_id in(
select salesman_id 
from Inventory.Orders
group by salesman_id
having count(customer_id)>1
)

--12
select * from Inventory.Orders
where purch_amt>(
select avg(purch_amt) from Inventory.Orders)

--13
select * from Inventory.Orders
where purch_amt>=(
select avg(purch_amt) from Inventory.Orders)

--14
select ord_date, sum(purch_amt) from Inventory.Orders a
group by ord_date 
having sum(purch_amt)>(
SELECT 1000.00 + MAX(purch_amt) 
FROM inventory.orders b 
WHERE a.ord_date = b.ord_date)

--15
select * from Inventory.Customer
where 'london' in (select city from Inventory.Customer)

--16
select salesman_id, name, city, commission from Inventory.Salesman
where salesman_id in(
select salesman_id 
from Inventory.Customer
group by salesman_id
having count(customer_id)>1
)

--17
select salesman_id, name, city, commission from Inventory.Salesman
where salesman_id in(
select salesman_id 
from Inventory.Customer
group by salesman_id
having count(customer_id)=1
)

--18
select * from Inventory.Salesman
where salesman_id in (
select salesman_id from Inventory.Orders
group by customer_id, salesman_id
having COUNT(*)>1
)

--19
select * from Inventory.Salesman
where city = any(select city from Inventory.Customer)

--20
select * from Inventory.Salesman
where city in (select city from Inventory.Customer)

--21
select *from Inventory.Customer 
where grade > any
(select grade from Inventory.Customer
where city < 'New York')

--22
select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer
where grade > any
(select grade from Inventory.Customer
where city < 'New York')

--23
select ord_no, purch_amt, ord_date, customer_id, salesman_id
from Inventory.Orders
where purch_amt > any
(select purch_amt from Inventory.Orders
where ord_date ='2012-09-10')

--24
select * from Inventory.Orders
where purch_amt > any(
select purch_amt from Inventory.Orders a, Inventory.Customer b
where  a.customer_id = b.customer_id
AND b.city = 'London')

--25
select ord_no, purch_amt, ord_date, customer_id, salesman_id
from Inventory.Orders
where purch_amt >
all(select max(purch_amt )
from Inventory.Orders a, Inventory.Customer b
where  a.customer_id = b.customer_id
AND b.city = 'London'
)

--26
select * from Inventory.Customer
where grade > any(
select grade from Inventory.Customer
where city = 'New York')

--27


--28
select * from Inventory.Customer
where grade <> any(
select grade from Inventory.Customer
where city = 'london')

--29
select * from Inventory.Customer
where grade <> any(
select grade from Inventory.Customer
where city = 'Paris')

--30
select * from Inventory.Customer
where grade <> any(
select grade from Inventory.Customer
where city = 'Dallas')

--31
select * from item_mast
--no table called company_mast

--34
select * from emp_details
where emp_lname in ('Gabriel', 'Dosio')

--35
select * from emp_details
where emp_dept in (89, 63)

