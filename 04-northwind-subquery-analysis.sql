/* Logen Peterson
SQLAssignment5lp.sql (SQL Assignment 5)
9/25/2022 */

--Question 1
SELECT COUNT(OrderID) AS 'Shipped Late'
FROM Orders
WHERE RequiredDate < ShippedDate;

--Question 2
SELECT ProductID, ProductName, UnitsInStock, CategoryID
FROM Products
WHERE CategoryID = 2
AND UnitsInStock > (SELECT AVG(UnitsInStock) 
FROM Products);

--Question 3
SELECT ProductID, ProductName, UnitsInStock, CategoryID
FROM Products
WHERE UnitsInStock > (SELECT AVG(UnitsInStock) 
FROM Products 
WHERE CategoryID = 2);

--Question 4
SELECT CustomerID, ContactName, Country
FROM Customers
WHERE Country NOT IN ('USA', 'UK', 'Australia', 'Canada');

--Question 5
SELECT *
FROM Customers
WHERE NOT EXISTS (SELECT * FROM Orders WHERE Customers.CustomerID = Orders.CustomerID);

--Question 6
SELECT EmployeeID, FirstName + ' ' + LastName AS FullName
FROM Employees
WHERE ReportsTo = 2
ORDER BY LastName;

--Question 7
SELECT CustomerID, CompanyName, ContactName
FROM Customers
WHERE LEN(CompanyName) <= 12;




