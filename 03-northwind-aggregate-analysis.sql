/* Logen Peterson
SQLAssignment4lp.sql (SQL Assignment 4)
9/21/2022 */

--Question 1
SELECT	AVG(UnitPrice) AS "AveragePrice", 
MIN(UnitPrice) AS "LowestPrice", 
MAX(UnitPrice) AS "HighestPrice" 
FROM Products;

--Question 2
SELECT Customers.CustomerID, AVG(Freight) AS "Average Freight Cost"
FROM Orders LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID;

--Question 3
SELECT Customers.CustomerID, AVG(Freight) AS "Average Freight Cost"
FROM Orders LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID
HAVING AVG(Freight) > 100;

--Question 4
SELECT Employees.EmployeeID, FirstName, LastName, MAX(OrderDate) AS RecentOrder
FROM Orders LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID, FirstName, LastName;

--Question 5
SELECT ProductID, COUNT(ProductID) AS NumberOfOrders
FROM OrderDetails
GROUP BY ProductID
HAVING COUNT(ProductID) > 50;

--Question 6
SELECT OrderID, (
SELECT SUM(UnitPrice)
FROM OrderDetails
WHERE Orders.OrderID = OrderDetails.OrderID
) AS "Full Retail Price", 
CONVERT(MONEY, ROUND((
SELECT SUM(UnitPrice * (1 - Discount))
FROM OrderDetails
WHERE Orders.OrderID = OrderDetails.OrderID
), 2)) AS "Final Price"
FROM Orders;

--Question 7
SELECT Products.ProductID, ProductName, ShipperID, CompanyName, 
COUNT(Orders.OrderID) AS ShipperIDUses
FROM Shippers
JOIN Orders 
ON Shippers.ShipperID = Orders.ShipVia
JOIN OrderDetails 
ON Orders.OrderID = OrderDetails.OrderID
JOIN Products 
ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductID, ProductName, ShipperID, CompanyName
ORDER BY ShipperIDUses DESC;
