-- SQL JOINS

create database sql_joins;

use sql_joins;

create table Customers(
CustomerID int primary key,
CustomerName varchar(50),
City varchar(50)
);

create table Orders(
OrderID int primary key,
CustomerID int,
OrderDate date,
Amount int
);

create table Payments(
PaymentID varchar(10) primary key,
CustomerID int,
PaymentDate date,
Amount int
);

create table Employees(
EmployeeID int primary key,
EmployeeName varchar(50),
ManagerID int
);

insert into Customers values
(1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams', 'Los Angeles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami');

insert into Orders values
(101,1,'2024-10-01',250),
(102,2,'2024-10-05',300),
(103,1,'2024-10-07',150),
(104,3,'2024-10-10',450),
(105,6,'2024-10-12',400);

insert into Payments values
('P001',1,'2024-10-02',250),
('P002',2,'2024-10-06',300),
('P003',3,'2024-10-11',450),
('P004',4,'2024-10-15',200);

insert into Employees values
(1,'Alex Green',NULL),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);

select * from Customers;
select * from Orders;
select * from Payments;
select * from Employees;




-- Question 1: Retrieve all customers who have placed at least one order. 

select distinct c.*
from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID;

-- Question 2: Retrieve all customers and their orders, including customers who have not placed any orders. 

select c.*, o.*
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID;

-- Question 3: Retrieve all orders and their corresponding customers, including orders placed by unknown customers. 

select c.*, o.*
from Customers c 
right join Orders o 
on c.CustomerID = o.CustomerID;

-- Question 4: Display all customers and orders, whether matched or not. 

select c.*, o.* 
from Customers c 
left join Orders o
on c.CustomerID = o.CustomerID

union 

select c.*, o.*
from Customers c 
right join Orders o 
on c.CustomerID = o.CustomerID;

-- Question 5: Find customers who have not placed any order. 

select c.*
from Customers c 
left join Orders o 
on c.CustomerID = o.CustomerID
where o.CustomerID is NULL;

-- Question 6: Retrieve customers who made payments but did not place any orders. 

select distinct c.*
from Customers c
inner join Payments p
on c.CustomerID = p.CustomerID 
left join Orders o 
on c.CustomerID = o.CustomerID 
where o.CustomerID is NULL;

-- Question 7: Generate a list of all possible combinations between Customers and Orders. 

select c.CustomerName, o.OrderID 
from Customers c 
cross join Orders o;

-- Question 8: Show all customers along with order and payment amounts in one table. 

select c.CustomerName,
o.Amount as OrderAmount,
p.Amount as PaymentAmount
from Customers c 
left join Orders o
on c.CustomerID = o.CustomerID
left join Payments p 
on c.CustomerID = p.CustomerID;

-- Question 9: Retrieve all customers who have both placed orders and made payments. 

select distinct c.* 
from Customers c
inner join Orders o 
on c.CustomerID = o.CustomerID 
inner join Payments p 
on c.CustomerID = p.CustomerID;


