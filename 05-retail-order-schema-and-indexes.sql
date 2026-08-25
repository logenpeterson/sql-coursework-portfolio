/* Logen Peterson
SQLAssignment6lp.sql (SQL Assignment 6)
10/03/2022 */USE master;
GO

IF DB_ID('MyTestDB') IS NOT NULL
DROP DATABASE MyTestDB;
GO

CREATE DATABASE MyTestDB;
GO

USE MyTestDB;
GO
--Question 1
CREATE TABLE ZipCodes
(
	ZipCode varchar(10) NOT NULL,
	City varchar(20),
	StateCode varchar(2)
);

--Question 2
ALTER TABLE ZipCodes
ADD PRIMARY KEY (ZipCode);

--Question 3
CREATE TABLE Customers
(
	CustomerID int PRIMARY KEY,
	CustomerName varchar(30),
	Address varchar(30),
	ZipCode varchar(10) FOREIGN KEY REFERENCES ZipCodes(ZipCode),
	CreditLimit money,
	Balance money
);

--Question 4
CREATE TABLE Orders
(
	OrderID int PRIMARY KEY,
	OrderDate date,
	CustomerID int FOREIGN KEY REFERENCES Customers(CustomerID)
);

--Question 5
CREATE TABLE Products
(
	ProductID int PRIMARY KEY,
	Description varchar(30),
	UnitsOnHand int,
	UnitsOnOrder int,
	UnitOfMeasure int,
	ReorderPoint int,
	UnitCost money,
	UnitPrice money
);

--Question 6
CREATE TABLE OrderedProduct
(
	OrderID int FOREIGN KEY REFERENCES Orders(OrderID),
	ProductID int FOREIGN KEY REFERENCES Products(ProductID),
	NumberOrdered int,
	QuotedPrice money,
	PRIMARY KEY (OrderID, ProductID)
);

--Question 7
CREATE UNIQUE INDEX CustName
ON Customers(CustomerName)
WHERE CustomerName IS NOT NULL;

--Question 8
CREATE INDEX OrderIndex
ON OrderedProduct(OrderID);

CREATE INDEX ProductIndex
ON OrderedProduct(ProductID);


