/* Logen Peterson
SQLAssignmentFinalExamlp.sql (SQL Final Exam)
10/10/2022 */

USE master;
GO

USE Northwind;
GO

--EXTRA CREDIT
SELECT LastName, CommissionPaid, EstimatedSalary, CommissionPaid + EstimatedSalary AS Compensation
FROM Employees JOIN (
	SELECT EmployeeID, CONVERT(money, ROUND(SUM(UnitPrice * Quantity) * 0.05, 2)) AS CommissionPaid
	FROM Orders JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
	GROUP BY EmployeeID
) Commissions ON Employees.EmployeeID = Commissions.EmployeeID RIGHT JOIN (
	SELECT EmployeeID, Jobs.PayRate * 2080 AS EstimatedSalary 
	FROM Employees JOIN Jobs ON Employees.Jobid = Jobs.JobId
	WHERE Jobs.Hourly = 1
) EstimatedSalaries ON Employees.EmployeeID = EstimatedSalaries.EmployeeID
ORDER BY Compensation DESC;

--Question 1
SELECT ProductID, ProductName
FROM Products
WHERE NOT EXISTS (SELECT * FROM OrderDetails WHERE OrderDetails.ProductID = Products.ProductID);

--Question 2
SELECT CustomerID, CompanyName, Address
FROM Customers
WHERE CustomerID LIKE 'M%';

--Question 3
SELECT FirstName + ' ' + LastName AS EmployeeName, Jobs.PayRate * 2080 AS YearlySalary 
FROM Employees JOIN Jobs ON Employees.Jobid = Jobs.JobId
WHERE Jobs.Hourly = 1;

--Question 4
SELECT TOP 10 UnitPrice, ProductName
FROM Products
ORDER BY UnitPrice DESC;

--Question 5
SELECT *
FROM Customers
WHERE Region IS NULL;

--Question 6
SELECT ProductName, CompanyName AS SupplierName
FROM Products JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY CompanyName, ProductName;

--Question 7
IF DB_ID('College') IS NOT NULL
	DROP DATABASE College;
GO

CREATE DATABASE College;
GO

USE College;
GO

CREATE TABLE Student
(
	StuNum varchar(5) PRIMARY KEY,
	StuFirstName varchar(25),
	StuLastName varchar(25),
	StuMajor varchar(40)
);

CREATE TABLE Instructor
(
	InstructorID varchar(5) PRIMARY KEY,
	Ins_FName varchar(30),
	Ins_LName varchar(30),
	Ins_Phone varchar(15)
);

CREATE TABLE Class
(
	ClassCode varchar(5) PRIMARY KEY,
	SectionNum varchar(5),
	InstructorID varchar(5) FOREIGN KEY REFERENCES Instructor(InstructorID),
	Location varchar(40)
);

CREATE TABLE Enrollment
(
	ClassCode varchar(5) FOREIGN KEY REFERENCES Class(ClassCode),
	StuNum varchar(5) FOREIGN KEY REFERENCES Student(StuNum),
	EnrollDate datetime
);


--Question 8
/* An enrollment table allows for students to enroll in any class they want to without the data duplicating across tables.
Each attribute of a table can only have a single value, so it is impossible to use a single foreign key to let students enroll in multiple classes. */

