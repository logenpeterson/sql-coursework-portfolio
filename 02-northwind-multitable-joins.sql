/* Logen Peterson
SQLAssignment3lp.sql (SQL Assignment 3)
9/10/2022 */

--Question 1
SELECT c.CustomerID, c.ContactName, c.Address, c.City, c.Region, c.PostalCode, o.OrderID, o.OrderDate 
FROM Customers AS c JOIN Orders AS o 
ON c.CustomerID = o.CustomerID
WHERE OrderDate BETWEEN '2014-07-01' AND '2014-07-31';

--Question 2
SELECT c.CustomerID, c.ContactName, c.Address, c.City, c.Region, c.PostalCode, o.OrderID, o.OrderDate 
FROM Customers AS c, Orders AS o
WHERE c.CustomerID = o.CustomerID
AND OrderDate BETWEEN '2014-07-01' AND '2014-07-31';

--Question 3
SELECT c.CustomerID, c.CompanyName, o.OrderID
FROM Customers AS c JOIN Orders AS o
ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;

--Question 4 (I did not know if you wanted all of the letters put together as one big answer or if you wanted them separate)
SELECT e.FirstName, e.LastName, c.CompanyName AS CustomerName, o.OrderID, o.ShippedDate, p.ProductID, p.ProductName, s.SupplierID, s.CompanyName AS SupplierCompany, sh.ShipperID, sh.CompanyName AS ShipperCompany
FROM Suppliers AS s JOIN Products AS p ON s.SupplierID = p.SupplierID
                    JOIN OrderDetails AS d ON d.ProductID = p.ProductID
                    JOIN Orders AS o ON o.OrderID = d.OrderID 
					JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
                    JOIN Customers AS c ON o.CustomerID = c.CustomerID                   
				    JOIN Shippers AS sh ON sh.ShipperID = o.ShipVia
WHERE s.SupplierID = '12' and e.EmployeeID = '2' 
ORDER BY o.OrderDate, c.CustomerID;

--Question 5
SELECT o.OrderID, c.CustomerID, o.OrderDate, d.UnitPrice, d.Quantity
FROM Orders AS o JOIN Customers AS c 
ON c.Customerid = o.CustomerID 
JOIN OrderDetails AS d ON o.OrderID = d.OrderID
WHERE d.Quantity<12;

--Question 6
SELECT CompanyName, 
CASE Country
WHEN 'USA' THEN 'Inside USA'
ELSE 'Outside USA'
END AS Country
FROM Customers
WHERE Country = 'USA'
UNION
SELECT CompanyName,
CASE Country
WHEN 'USA' THEN 'Inside USA'
ELSE 'Outside USA'
END AS Country
FROM Customers
WHERE Country <> 'USA';

--Question 7
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, e.Title, j.JobDescription
FROM Employees AS e JOIN Jobs AS j ON e.Jobid = j.JobId;

--Question 8
SELECT o.OrderID, e.EmployeeID, c.CustomerID
FROM Orders AS o JOIN Customers AS c ON o.CustomerID = c.CustomerID
			     JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
WHERE o.ShippedDate < '2014-01-01';