/* Logen Peterson
SQLAssignment2xx.sql (SQL Assignment 2)
9/5/2022 */

--Question 1
SELECT *
FROM Customers;

--Question 2
SELECT *
FROM Products
ORDER BY UnitPrice,ProductName;

--Question 3
SELECT ProductID,ProductName,UnitPrice,UnitsInStock,UnitsOnOrder
FROM Products
WHERE Discontinued>=1;

--Question 4
SELECT CustomerID,CompanyName,
SUBSTRING(CompanyName,1,8) AS CompanyShort
FROM Customers;

--Question 5
SELECT TOP 10 CustomerID,Freight
FROM Orders
ORDER BY Freight DESC;

--Question 6
SELECT CustomerID,CompanyName
FROM Customers
WHERE CompanyName LIKE '%Market%';

--Question 7
SELECT FirstName,LastName,
LOWER(CONCAT(SUBSTRING(FirstName,1,1),'.',LastName,'@northwind.com')) AS EmployeeEmail
FROM Employees
ORDER BY LastName;

--Question 8
SELECT *
FROM Customers
WHERE Country IN('France','Germany','USA','UK')
ORDER BY Country;

--Question 9
SELECT TOP 5 PERCENT Freight, CustomerID
FROM Orders
ORDER BY Freight DESC;

--Question 10
SELECT LastName,HomePhone,Notes
FROM Employees
WHERE Notes LIKE '%German%';

--Question 11
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2014-07-01' AND '2014-07-31';

--Question 12
SELECT *
FROM Orders
WHERE MONTH(OrderDate) = 7 and YEAR(OrderDate) = 2014;

--Question 13
Select *
FROM Orders
WHERE ShippedDate IS NULL;

--Question 14
SELECT DISTINCT CustomerID
FROM Orders
ORDER BY CustomerID DESC;

--Question 15
SELECT CustomerID,City,Region,PostalCode
FROM Customers
ORDER BY City,CustomerID;
