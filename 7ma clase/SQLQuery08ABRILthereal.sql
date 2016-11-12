--01 Mostrar el Nombre del cliente ,el país y el número
-- de pedidos realizados.

USE Northwind
GO

SELECT	C.CompanyName AS 'Cliente'
		,C.Country AS 'País'
		,C.City
		,COUNT(O.OrderID) AS 'Nro. de pedidos'
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName,C.Country,C.City
ORDER BY 4 DESC
--
SET LANGUAGE spanish

--02
--Mostrar : el nombre de categoría, la cantidad
--de productos y el promedio de precios por cada categoría

SELECT	C.CategoryName
		,COUNT(P.ProductID) AS 'Cantidad de productos'
		,AVG(P.UnitPrice) AS 'Promedio de precios por categoría'	
FROM Products AS P
INNER JOIN Categories AS C
ON P.CategoryID= C.CategoryID
GROUP BY C.CategoryName

--03
-- Mostrar: el número de orden, el nombre del cliente
-- y el total neto de cada orden.

SELECT	O.OrderID
		,C.CompanyName
		,SUM(OD.UnitPrice*OD.Quantity * (1-OD.discount)) AS 'Neto a pagar'
FROM [Order Details] AS OD
INNER JOIN Orders AS O
ON OD.OrderID =O.OrderID
INNER JOIN Customers AS C
ON    O.CustomerID  = C.CustomerID
GROUP BY O.OrderID,C.CompanyName

--04
-- mostrar: el nombre del empleado y el número de ordenes
-- que atendio cada empleado.

SELECT	E.FirstName + ' '+ E.LastName AS 'Empleado'
		,COUNT(O.orderID) AS 'Nro. de pedidos'
FROM Employees AS E
INNER JOIN Orders AS O
ON E.EmployeeID= O.EmployeeID
GROUP BY E.FirstName + ' '+ E.LastName

-- 5. Mostrar : País     Monto Neto Vendido

SELECT	C.Country
		,SUM(OD.UnitPrice*OD.Quantity * (1-OD.discount))AS 'MONTO NETO VENDIDO'
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID=O.CustomerID
INNER JOIN [Order Details] AS OD
ON O.OrderID= OD.OrderID
GROUP BY C.Country

--06. Mostrar : Nombre Empleado   Monto Neto Vendido

SELECT	E.FirstName+''+E.LastName As 'Nombre del empleado'
		,SUM(OD.Quantity ) AS 'Monto vendido'
FROM [Order Details] AS OD
INNER JOIN Orders AS O
ON OD.OrderID =O.OrderID
INNER JOIN Employees AS E
ON    O.EmployeeID=E.EmployeeID
GROUP BY E.FirstName+''+E.LastName


--07. Mostrar : Nombre de categoria Monto Neto Vendido

SELECT	 C.CategoryName AS 'Nombre de Categoria'
		,SUM(OD.Quantity ) AS 'Monto vendido'
FROM [Order Details] AS OD
INNER JOIN Products AS P
ON OD.ProductID=P.ProductID
INNER JOIN Categories AS C
ON    C.CategoryID=C.CategoryID
GROUP BY C.CategoryName

--08. Mostrar : Nombre de Producto  Monto Neto Vendido

SELECT	P.ProductName 'Nombre del producto'
		,SUM(OD.Quantity ) AS 'Monto vendido'
FROM [Order Details] AS OD
INNER JOIN Products AS P
ON OD.ProductID =P.ProductID
GROUP BY P.ProductName

--09. Mostrar : nombre de Cliente Nombre Producto  Cantidad
-- solo del producto TOFU.

SELECT C.CompanyName
		,P.ProductName
		,SUM(OD.Quantity)
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] AS OD
ON O.OrderID= OD.OrderID
INNER JOIN Products AS P
ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'TOFU'
GROUP BY C.CompanyName
		,P.ProductName

-- 10. Mostrar : Año    Total    Descuento   Neto
             1996    999        99.9      999
             1997    999        99.9      999
             1998    999        99.9      999
             
SELECT DATEPART(YEAR,O.OrderDate) AS 'Año'
,SUM(OD.UnitPrice* OD.Quantity) AS 'Total'
,SUM(OD.UnitPrice* OD.Quantity*OD.Discount) AS 'Descuento'
,SUM(OD.UnitPrice* OD.Quantity*(1-OD.Discount)) AS 'Neto'	
FROM Orders AS O
INNER JOIN [Order Details] AS OD
ON O.OrderID = OD.OrderID
GROUP BY DATEPART(YEAR,O.OrderDate)
ORDER BY 1 
	               
-- 11. Cuanto($) neto se vendio del producto TOFU en el año
-- 1997      Año   Producto $Venta.

SELECT DATEPART(YEAR,O.OrderDate) AS 'AÑO'
,P.ProductName AS 'PRODUCTO'
,SUM(OD.UnitPrice* OD.Quantity*(1-OD.Discount)) AS 'Neto'
FROM ORDERS AS O
INNER JOIN [Order Details] AS OD
ON O.OrderID=OD.OrderID
INNER JOIN Products AS P
ON OD.ProductID=P.ProductID
WHERE DATEPART(YEAR,O.ORDERDATE)= 1997 AND
P.ProductName='TOFU'
GROUP BY P.ProductName
ORDER BY 3

-- 12. Mostrar : Nombre del empleado    Años de servicios

SELECT FirstName + '' +LastName As 'Nombre del empleado', 
       DATEDIFF(YEAR,HireDate,GETDATE()) As 'Años de servicios' 
from Employees
order by 2 desc

-- 13. Mostrar : Nombre del empleado    Edad

SELECT FirstName + '' +LastName As 'Nombre del empleado', 
       DATEDIFF(YEAR,BirthDate,GETDATE()) As 'Edad' 
from Employees
order by 2 desc

-- 14. Mostar  : Nombre del empleado    Edad  (del empleado
-- con mayor edad)

SELECT TOP 1 WITH TIES	FirstName + ' '+ LastName AS 'Empleado'
,DATEDIFF (YEAR,BirthDate,GETDATE())AS 'Edad'
 FROM Employees
 ORDER BY 2 DESC
    
SELECT * FROM Employees
ORDER BY 6

-- 15. Mostrar los datos del empleado mas joven.

SELECT top 1 with ties FirstName + '' +LastName As 'Nombre del empleado', 
       DATEDIFF(YEAR,BirthDate,GETDATE()) As 'Edad' 
from Employees
order by 2 



------------------------------------------------------- 

SELECT * FROM Employees
UPDATE Employees
SET BirthDate='19370919'
WHERE EmployeeID =1


jcarrasco@uni.edu.pe


SELECT  TOP 1*
FROM Products
ORDER BY UnitPrice DESC
--
SELECT *
FROM Products
ORDER BY UnitPrice
--
UPDATE Products
SET UnitPrice = 2.50
WHERE ProductID IN(24,13)
--
SELECT TOP 1 WITH TIES *
FROM Products
ORDER BY UnitPrice
