use Northwind

--advanced
--32
select c.CustomerID, c.CompanyName, o.OrderID, total_amount=sum(od.quantity*od.UnitPrice)  
from Customers c
join Orders o on o.CustomerID=c.CustomerID
join OrderDetails od on o.orderID=od.orderid
where year(o.OrderDate) = 2016 
group by c.customerID, c.CompanyName, o.OrderID
HAVING SUM(od.quantity * od.UnitPrice) > 10000
order by total_amount desc

--33
select c.CustomerID, c.CompanyName, total_amount=sum(od.quantity*od.UnitPrice)  
from Customers c
join Orders o on o.CustomerID=c.CustomerID
join OrderDetails od on o.orderID=od.orderid
where year(o.OrderDate) = 2016 
group by c.customerID, c.CompanyName
HAVING SUM(od.quantity * od.UnitPrice) > 15000
order by total_amount desc

--34
select c.CustomerID, c.CompanyName, total_amount=sum(od.quantity*od.UnitPrice*(1-od.discount))  
from Customers c
join Orders o on o.CustomerID=c.CustomerID
join OrderDetails od on o.orderID=od.orderid
where year(o.OrderDate) = 2016 
group by c.customerID, c.CompanyName
HAVING SUM(od.quantity * od.UnitPrice) > 15000
order by total_amount desc

--35-----------review!
select e. employeeid, o.OrderID, o.OrderDate from Employees e
join Orders o on o.EmployeeID=e.EmployeeID
where DAY(o.OrderDate) = DAY(DATEADD(DAY, -1, DATEADD(MONTH, 1, o.OrderDate)))

--36
select top 10 o.orderid, COUNT(od.Quantity) as TotalOrderDetails from Orders o
join OrderDetails od on o.OrderID=od.OrderID
group by o.OrderID
order by TotalOrderDetails desc

--37
select top 2 percent orderid from Orders 
order by rand()

--38
select o1.OrderID from OrderDetails o1
join OrderDetails o2 on  o1.orderid=o2.OrderID and o1.Quantity=o2.Quantity and o1.ProductID<>o2.ProductID
where o1.Quantity>=60 
GROUP BY o1.OrderID, o1.Quantity
HAVING COUNT(DISTINCT o1.ProductID) > 1
order by o1.quantity

--OR

SELECT OrderID
FROM OrderDetails
WHERE Quantity >= 60
GROUP BY OrderID, Quantity
HAVING COUNT(DISTINCT ProductID) > 1
ORDER BY Quantity;

--39
select * from OrderDetails o1
join OrderDetails o2 on  o1.orderid=o2.OrderID and o1.Quantity=o2.Quantity and o1.ProductID<>o2.ProductID
where o1.Quantity>=60 
order by o1.quantity

--40
Select OrderDetails.OrderID
,ProductID
,UnitPrice ,Quantity ,Discount From OrderDetails Join (
Select OrderID
From OrderDetails
Where Quantity >= 60 
Group By OrderID, Quantity 
Having Count(*) > 1 ) PotentialProblemOrders 
on PotentialProblemOrders.OrderID = OrderDetails.OrderID
Order by OrderID, ProductID

--41
select orderdate, RequiredDate, ShippedDate from orders 
where ShippedDate>RequiredDate

--42
select e.EmployeeID, LastName, count(*) as total  from orders o
left join Employees e on e.employeeid = o.EmployeeID
where ShippedDate>RequiredDate
group by LastName, e.EmployeeID

--43
select e.EmployeeID, LastName, count(distinct o.OrderID) as allorders, count(distinct o1.OrderID) as lateOrders from orders o
left join Employees e on e.employeeid = o.EmployeeID
left join Orders o1 on e.EmployeeID=o1.EmployeeID
and o1.ShippedDate>o1.RequiredDate
group by e.LastName, e.EmployeeID

--44
select e.EmployeeID, LastName, count(distinct o.OrderID) as allorders, count(distinct o1.OrderID) as lateOrders 
from orders o
left join Employees e on e.employeeid = o.EmployeeID
left join Orders o1 on e.EmployeeID=o1.EmployeeID
and o1.ShippedDate>o1.RequiredDate
group by e.LastName, e.EmployeeID

--45
select e.EmployeeID, LastName, count(distinct o.OrderID) as allorders, count(distinct o1.OrderID) as lateOrders 
from orders o
left join Employees e on e.employeeid = o.EmployeeID
left join Orders o1 on e.EmployeeID=o1.EmployeeID
and o1.ShippedDate>o1.RequiredDate
group by e.LastName, e.EmployeeID

--46

select e.EmployeeID, LastName, count(distinct o.OrderID) as allorders, count(distinct o1.OrderID) as lateOrders
from orders o
left join Employees e on e.employeeid = o.EmployeeID
left join Orders o1 on e.EmployeeID=o1.EmployeeID
and o1.ShippedDate>o1.RequiredDate
group by e.LastName, e.EmployeeID


--47
select e.EmployeeID, LastName, count(distinct o.OrderID) as allorders, count(distinct o1.OrderID) as lateOrders
,cast (count(distinct o1.OrderID) as decimal)/count(distinct o.OrderID) as percentage
from orders o
left join Employees e on e.employeeid = o.EmployeeID
left join Orders o1 on e.EmployeeID=o1.EmployeeID
and o1.ShippedDate>o1.RequiredDate
group by e.LastName, e.EmployeeID

--48
with grouped as (
select c.CustomerID ,c.CompanyName , SUM(Quantity * UnitPrice)as TotalOrderAmount
from Customers c
join Orders o on c.CustomerID=o.CustomerID
join OrderDetails od on o.OrderID=od.OrderID
where year(o.OrderDate)=2016
Group By c.CustomerID ,c.CompanyName ),
cte2 as (
select *,
case
when Totalorderamount>=10000 then 'very high'
when Totalorderamount<10000 and Totalorderamount>=5000 then 'high'
when Totalorderamount>=1000 and Totalorderamount<5000 then 'medium'
when Totalorderamount<1000 and Totalorderamount>=0  then 'low'
end as cust_group
from grouped)

select * from cte2

--50
with grouped as (
select c.CustomerID ,c.CompanyName , SUM(Quantity * UnitPrice)as TotalOrderAmount
from Customers c
join Orders o on c.CustomerID=o.CustomerID
join OrderDetails od on o.OrderID=od.OrderID
where year(o.OrderDate)=2016
Group By c.CustomerID ,c.CompanyName ),
cte2 as (
select *,
case
when Totalorderamount>=10000 then 'very high'
when Totalorderamount<10000 and Totalorderamount>=5000 then 'high'
when Totalorderamount>=1000 and Totalorderamount<5000 then 'medium'
when Totalorderamount<1000 and Totalorderamount>=0  then 'low'
end as cust_group
from grouped)

select cust_group, count(*) as num, count(*)*1.0/sum(count(*)) over() as propotion from cte2
group by cust_group
order by cust_group

--51
with grouped as (
select c.CustomerID ,c.CompanyName , SUM(Quantity * UnitPrice)as TotalOrderAmount
from Customers c
join Orders o on c.CustomerID=o.CustomerID
join OrderDetails od on o.OrderID=od.OrderID
where year(o.OrderDate)=2016
Group By c.CustomerID ,c.CompanyName ),
select * from cte2
??

select * from CustomerGroupThresholds

--52
with cte as(
select  s.Country SupplierCountry, c.Country as CustomerCountry 
from Customers c
full join Suppliers s on c.Country=s.Country )
select distinct * from cte

--53
select isnull(c.Country, s.country), count(CustomerId) as Customers, count(s.SupplierID) as Suppliers 
from Customers c
full join Suppliers s on s.country=c.country
group by s.Country, c.country

--55
with OrdersByCountry as (
Select
ShipCountry ,CustomerID ,OrderID
,OrderDate = convert(date, OrderDate) ,RowNumberPerCountry =
Row_Number() over (Partition by ShipCountry Order by ShipCountry, OrderID) From Orders
)Select ShipCountry ,CustomerID, OrderID, OrderDate 
From OrdersByCountry 
Where RowNumberPerCountry = 1 
Order by ShipCountry


select * from Customers
select * from Employees
select * from OrderDetails


