/*Question 2: For this question you’ll need to use SQL. Follow this link to access the data set required for the challenge. 
Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.*/

--How many orders were shipped by Speedy Express in total?

--Find number of orders shipped by Speedy Express
SELECT COUNT(OrderID) AS 'Amt Shipped by Speedy Express'
/*Join relevant tables*/
FROM Orders o
JOIN Shippers s
ON o.ShipperID = s.ShipperID
/*On the condition that the Shipper is Speedy Express*/
WHERE s.ShipperName LIKE 'Speedy Express';

--54 Orders were shipped by Speedy Express




--What is the last name of the employee with the most orders?
/*Find the the employee with the MOST CountTotals*/
SELECT LastName AS "Last Name", MAX(CountTotal) AS "Amount Sold"
/*Finding the collective amount of ALL orders for ALL employees, while joining all relevant tables*/
FROM(SELECT Count(o.OrderID) AS CountTotal, e.LastName
FROM Orders o
JOIN Employees e
ON O.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID)

--The last name of the employee with the most orders was Peacock with 40 orders

--What product was ordered the most by customers in Germany?
—-Finding the most ordered product
SELECT ProductName AS 'Product Name', MAX(Total) AS 'Amount Ordered'
/*Finding the quantity of ALL ordered products*/
FROM(SELECT SUM(Quantity) AS Total, ProductName
/*Joining relevant tables*/
FROM(SELECT c.CustomerID, c.Country, o.OrderID, p.ProductID, od.Quantity, p.ProductName
	FROM Customers c
	JOIN Orders o ON o.CustomerID = c.CustomerID
	JOIN OrderDetails od ON od.OrderID = o.OrderID
	JOIN Products p ON p.ProductID = od.ProductID
/*On the condition that the orders are from Germany*/
WHERE c.Country LIKE 'Germany')
GROUP BY ProductID)

--The most ordered product by customers in Germany was the Boston Crab Meat with 160 orders
