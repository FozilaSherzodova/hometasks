use Northwind

--1
select * from Shippers

--2
Select CategoryName, Description from Categories

--3   
select FirstName, LastName, HireDate from Employees
Where Title='Sales Representative'

--4
select FirstName, LastName, HireDate from Employees
Where Title='Sales Representative' and Country='USA'

--5
select OrderID, OrderDate from Orders
where EmployeeID=5

--6
select SupplierID, ContactName, ContactTitle from Suppliers
where ContactTitle <> 'Marketing Manager'

--7
select ProductID, ProductName from Products
where ProductName like '%queso%'

--8
select OrderID, CustomerID, ShipCountry from Orders
where ShipCountry='France' or ShipCountry='Belgium'

--9
select OrderID, CustomerID, OrderDate, ShipCountry from Orders 
where ShipCountry in ('France','Belgium', 'Brazil', 'Mexico', 'Argentina', 'Venezuela')

--10
select FirstName, LastName, Title, BirthDate from Employees
order by BirthDate

--11
select FirstName, LastName, Title, convert(date, BirthDate) from Employees
order by BirthDate

--12
select FirstName, LastName, FirstName + ' ' + LastName as fullname
from Employees

--13
select OrderID, ProductID, UnitPrice, Quantity, UnitPrice*Quantity as TotalPrice 
from OrderDetails
Order by OrderID, ProductID

--14
select count(CustomerID) from Customers

--15
select min(orderdate) from Orders

--16
select distinct Country from Customers

--17
select ContactTitle, count(ContactTitle) from Customers
group by ContactTitle

--18
select p.ProductID, p.ProductName, s.CompanyName from Suppliers s
join Products p
on s.supplierid=p.supplierid
order by ProductID

--19
select o.OrderID, convert(date, o.orderdate), s.CompanyName from Orders o
left join Shippers s
on s.ShipperID=o.ShipVia
where orderid<10300
order by OrderID

--20
select c.CategoryName,count( p.ProductName) from Categories c
left join Products p
on c.CategoryID=p.CategoryID
group by c.CategoryName, c.CategoryID

--21
select Country, City, count(customerid) as TotalCustomer from Customers
group by City, Country

--22
select ProductID, ProductName, UnitsInStock, ReorderLevel from Products
where UnitsInStock < ReorderLevel
order by ProductID

--23
select ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued 
from Products
where UnitsInStock+UnitsOnOrder <= ReorderLevel
and Discontinued=0

--24
select CustomerID, Region
from Customers
order by 
CASE WHEN Region IS NULL THEN 1 ELSE 0 
END, Region

--25
select top 3 ShipCountry, avg(Freight) 
from Orders
group by ShipCountry
order by avg(Freight) desc

--26
select top 3 ShipCountry, avg(Freight)
from Orders
where year(OrderDate)=2015
group by ShipCountry
order by avg(Freight) desc

--27
Select Top 3 ShipCountry ,AverageFreight = avg(freight) 
From Orders 
Where OrderDate between '1/1/2015' and '12/31/2015'--here
Group By ShipCountry Order By AverageFreight desc;

--28
select top 3 ShipCountry, avg(Freight)
from Orders
where year(OrderDate)= (
select (max(year(orderdate))-1) From Orders)
group by ShipCountry
order by avg(Freight) desc

--29
select * from Suppliers
select * from Orders o
select * from Employees

select * from OrderDetails



select o.EmployeeID, e.LastName, o.OrderID, p.ProductName from 
Orders o
join Employees e on o.EmployeeID=e.EmployeeID
join Products p on P.ProductID=od.productid
order by o.OrderID, p.productid

--30
Select *
From Customers c
left join Orders o on o.CustomerID = c.CustomerID
where o.CustomerID  is null

--31
select c.CustomerID, o.OrderID, o.EmployeeID from Customers c
left join Orders o on o.CustomerID=c.CustomerID and o.EmployeeID = 4
where o.orderID is null 

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



select *from Orders 
select * from OrderDetails
