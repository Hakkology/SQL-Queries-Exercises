-- Soru 1)
select distinct ProductName
from Products

-- Soru 2)
select distinct ProductName
from Products
Order by ProductName

-- Soru 3)
select distinct ProductName
from Products
Order by ProductName desc

-- Soru 4)
select CategoryName
from Categories where CategoryID=3

-- Soru 5)
select CategoryName
from Categories where CategoryID=3
Order by CategoryName

-- Soru 6)
select COUNT(*)
from Products where UnitPrice>30

-- Soru 7
select LOWER(ProductName), UnitPrice
from Products
Order by UnitPrice desc

-- Soru 8
select ProductName
from Products
where left(ProductName,1)='a'

-- Soru 9
select ProductName
from Products
where left(ProductName,1)='a' and UnitPrice>=20
Order by ProductName

-- Soru 10
select FirstName+' '+LastName as FullName
from Employees

-- Soru 11
declare @kdv money
set @kdv = 1.18
select UnitPrice*@kdv
from Products
go

-- Soru 12
select count(*)
from Suppliers where Region=null

-- Soru 13
select top 5 CompanyName
from Suppliers

-- Soru 14
select top 5 ProductName,UnitPrice
from Products
Order by UnitPrice desc

-- Soru 15 XX
select top 5 avg(UnitPrice)
from Products
Order by UnitPrice desc

-- Soru 16
select 'TR_'+UPPER(ProductName)
from Products

-- Soru 17
select ProductName
from Products
order by ProductName

-- Soru 18
declare @kdv money
set @kdv = 1.18
select ProductName, UnitPrice, UnitPrice*@kdv
from Products

-- Soru 19
select FirstName, LastName, ShipAddress
from Orders o join Employees e on O.EmployeeID=e.EmployeeID
join [Order Details] od on od.OrderID=o.OrderID
where year(OrderDate)=1998 and month(OrderDate)=3

-- Soru 20
select COUNT(*)
from Orders where year(OrderDate)=1997 and month(OrderDate)=2

-- Soru 21
select count(*)
from Orders where year(OrderDate)=1998 and ShipCity='London'

-- Soru 22
select ProductName, CategoryName, sum(od.UnitPrice*od.Quantity)
from Products p join Categories c on p.CategoryID=c.CategoryID
join [Order Details] od on p.ProductID=od.ProductID
group by ProductName, CategoryName

-- Soru 23
select top 1 p.ProductName, CategoryName, Quantity
from Products p join Categories c on p.CategoryID=c.CategoryID
join Suppliers s on p.SupplierID=s.SupplierID
join [Order Details] od on p.ProductID=od.ProductID
order by od.Quantity desc

-- Soru 24
select count(distinct Country)
from Customers

-- Soru 25
select Country, COUNT(CustomerID)
from Customers
group by Country

-- Soru 26
select FirstName, LastName, ProductName, sum(od.Quantity)
from [Order Details] od join Orders o on od.OrderID=o.OrderID
join Employees e on e.EmployeeID=o.EmployeeID
join Products p on p.ProductID=od.ProductID
where e.EmployeeID=3 and MONTH(OrderDate)>1
group by FirstName, LastName, ProductName

-- Soru 27
select ProductName, CategoryName, sum(od.Quantity)
from [Order Details] od join Products p on od.ProductID=p.ProductID
join Categories c on c.CategoryID=p.CategoryID
where od.OrderID=10248
group by ProductName, CategoryName

-- Soru 28
select ProductName, s.CompanyName
from Products p join Suppliers s on p.SupplierID=s.SupplierID
join [Order Details] od on p.ProductID=od.ProductID
where od.OrderID=10248

-- Soru 29
select ProductName, sum(od.Quantity)
from Employees e join Orders o on o.EmployeeID=e.EmployeeID
join [Order Details] od on od.OrderID=o.OrderID
join Products p on p.ProductID=od.ProductID
where e.EmployeeID=3 and year(o.OrderDate)=1997
group by ProductName

-- Soru 30
select top 1 FirstName, LastName, od.Quantity
from Employees e join Orders o on o.EmployeeID=e.EmployeeID
join [Order Details] od on od.OrderID=o.OrderID
where year(o.OrderDate)=1997
order by od.Quantity desc

-- Soru 31
select top 1 ProductName, CategoryName, od.UnitPrice 
from Products p join [Order Details] OD on p.ProductID=od.ProductID
join Categories c on c.CategoryID=p.CategoryID
order by UnitPrice desc

-- Soru 32 XX
select FirstName, LastName, ReportsTo=(select ReportsTo from Employees where FirstName
from Employees

-- Soru 33
select ProductName, Quantity, sum(od.UnitPrice*od.Quantity)
from products p join [Order Details] od on p.ProductID=od.ProductID
group by ProductName, Quantity

-- Soru 34
select CompanyName, sum(Freight) 
from Shippers s join orders o on s.ShipperID=o.ShipVia
group by CompanyName

-- Soru 35
select s.CompanyName, od.Quantity, SUM(od.Quantity*od.UnitPrice)
from Suppliers s join Products p on s.SupplierID=p.SupplierID
join [Order Details] od on od.ProductID=p.ProductID
group by s.CompanyName, od.Quantity

-- Soru 36
select top 1 c.CompanyName, sum(Quantity) as [Sale Quantities]
from Customers c join orders o on c.CustomerID=o.CustomerID
join [Order Details] od on od.OrderID=o.OrderID
group by c.CompanyName
order by sum(Quantity) desc

-- Soru 37
select *
from Products where ProductName like '__h%'

-- Soru 38
select *
from Customers where CompanyName like '%bistro%'

-- Soru 39
select *
from Products where ProductName like 'c%n'

-- Soru 40
select *
from Categories c join Products p on c.CategoryID=p.CategoryID
where (p.CategoryID= 2 or p.CategoryID=3) and ProductName like 'c%'

-- Soru 41
select *
from Customers where CompanyName like 's_m%'

-- Soru 42
select *
from Products where ProductName not like 'b%'

-- Soru 43
select *
from Customers where CompanyName not like ('a%') and CompanyName not like 'w%'

-- Soru 44
select distinct ProductName, e.FirstName
from Products p join [Order Details] od on p.ProductID=od.ProductID
join Orders o on o.OrderID=od.OrderID
join Employees e on e.EmployeeID=o.EmployeeID
where FirstName = 'Nancy'

-- Soru 45
select CategoryName, SUM(Quantity)
from Shippers s join Orders o on o.ShipVia=s.ShipperID
join [Order Details] od on o.OrderID=od.OrderID
join Products p on p.ProductID=od.ProductID
join Categories c on c.CategoryID=p.CategoryID
where S.CompanyName='United Package'
group by CategoryName

-- Soru 46
select distinct c.CompanyName
from Employees e join Orders o on o.EmployeeID=e.EmployeeID
join Customers c on c.CustomerID=o.CustomerID
where e.FirstName='Andrew'

-- Soru 47
create table SoftwareDist
(
ID int primary key Identity(1,1),
[FirstName] nvarchar(50) not null,
[LastName] nvarchar(50) not null,
[FieldChoice] nvarchar(50) null,
)

alter table SoftwareDist add [Age] int
select * from SoftwareDist

alter table SoftwareDist rename column SoftwareDist.LastName Surname-- rename doesnt work
EXEC sp_rename 'SoftwareDist.LastName', 'Surname', 'COLUMN'

-- Soru 48 XX
create view vw_NWD as
select p.ProductName,
e.FirstName, e.LastName, e.ReportsTo as ManagerID,
o.OrderDate, o.ShipCountry,
cu.CompanyName, sum(od.Quantity*od.UnitPrice) as Sales
from Categories c join Products p on p.CategoryID=c.CategoryID
join Suppliers s on s.SupplierID=p.SupplierID
join [Order Details] od on od.ProductID=p.ProductID
join Orders o on o.OrderID=od.OrderID
join Shippers Sh on Sh.ShipperID=o.ShipVia
join Customers cu on cu.CustomerID=o.CustomerID
join CustomerCustomerDemo ccd on cu.CustomerID=ccd.CustomerID
join CustomerDemographics cd on cd.CustomerTypeID=ccd.CustomerTypeID
join Employees e on e.EmployeeID=o.EmployeeID
--join EmployeeTerritories et on e.EmployeeID=et.EmployeeID
--join Territories t on t.TerritoryID=et.TerritoryID
--join region r on r.RegionID=t.RegionID
--inner join ManagerID=EmployeeID
--where e.ReportsTo=e.EmployeeID
group by p.ProductName, e.FirstName, e.LastName, e.ReportsTo, o.OrderDate, cu.CompanyName, o.ShipCountry, e.ReportsTo

select * from vw_NWD where year(OrderDate)=1997
select * from vw_NWD where year(OrderDate)=1997 and FirstName='Anna'
select * from vw_NWD where year(OrderDate)=1997 and FirstName='Anna' and ShipCountry='France'

-- Soru 49
create proc AddEmployeeHakan as 
insert into Employees (FirstName, LastName) values('Hakan','Yıldız')
exec AddEmployeeHakan
select *from Employees
go

create proc AddEmployee
@fn nvarchar(50),
@ln nvarchar(50) as
insert into Employees (FirstName, LastName) values (@fn, @ln)
go
exec AddEmployee John, Carmack
select *from Employees

-- Soru 50
exec AddEmployee Diana, Prince
exec AddEmployee Feyza, Esertepe
go

-- Soru 51
create proc EditEmployee
@fn nvarchar(50),
@ln nvarchar(50),
@EId int as
update Employees 
set FirstName=@fn, 
LastName=@ln
where EmployeeID=@EId
exec EditEmployee Hakko,Yıldız,13
select * from Employees
go

-- Soru 52
create proc DeleteEmployee
@EId int as
delete from Employees
where EmployeeID=@EId
exec DeleteEmployee 13
exec DeleteEmployee 12
exec DeleteEmployee 11
exec DeleteEmployee 10
go

-- Soru 53 XX
create proc TruncateEmployee
@EId int as
delete from Employees
where EmployeeID=@EId






