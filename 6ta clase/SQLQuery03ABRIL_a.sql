--Activar Northwind
USE Northwind
GO
-----------------------------------------------
-- Agrupar datos: GROUP BY
-----------------------------------------------
-- Mostrar el c�digo del cliente y el n�mero
-- de pedidos realizados.
SELECT	CustomerID
		,COUNT(OrderID) AS 'Nro. de pedidos'
FROM Orders
GROUP BY CustomerID
ORDER BY 2 DESC
--  Mostrar : el c�digo de categor�a, la cantidad
-- de productos y el promedio de precios por cada categor�a
SELECT	CategoryID
		,COUNT(*) AS 'Cantidad de productos'
		,AVG(UnitPrice) AS 'Promedio de precios por categor�a'	
FROM Products
GROUP BY CategoryID

-- Mostrar: el n�mero de orden y el total neto de cada 
-- orden.
SELECT	OrderID
		,SUM(UnitPrice*Quantity * (1-discount)) AS 'Neto a pagar'
FROM [Order Details]
GROUP BY OrderID

-- Mostrar: el n�mero de orden y el total neto de cada 
-- orden. El listado solo debe mostrar las ordenes con
-- montos mayores a 1000 $.
SELECT	OrderID
		,SUM(UnitPrice*Quantity * (1-discount)) AS 'Neto a pagar'
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice*Quantity * (1-discount)) > 1000
----------------------------------------------------------
-- HAVING : se parece al WHERE, permite filtrar consultas
-- agrupadas.
----------------------------------------------------------
-- mostrar: el c�digo del empleado y el n�mero de ordenes
-- que atendio cada empleado.
SELECT	EmployeeID
		,COUNT(*) AS 'Nro. de pedidos'
FROM Orders
GROUP BY EmployeeID
-----------------------------------------------------------
-- Funciones de fecha
-----------------------------------------------------------
SET LANGUAGE spanish
--
PRINT GETDATE()
--DATEPART(p1,p2)
PRINT DATEPART(YEAR,GETDATE())
-- Mostrar un listado de los pedidos realizados en el a�o 1998.
SELECT *
FROM Orders
WHERE DATEPART(YEAR,OrderDate)= 1998
-----------------------------------------------------------------
PRINT DATEPART(MONTH,GETDATE())
-- Mostrar un listado de los pedidos realizados en el primer bimestre
-- del a�o 1997.
SELECT *
FROM Orders
WHERE DATEPART(YEAR,OrderDate) = 1997 AND
      DATEPART(MONTH,OrderDate) IN (1,2)-- 62 filas
      
------------------------------------------------------------------
-- Mostrar un listado que presente: a�o    Nro pedidos
SELECT	DATEPART(YEAR,OrderDate) AS 'A�o'
		,COUNT(OrderID) AS 'Nro. de pedidos'
FROM Orders
GROUP BY DATEPART(YEAR,OrderDate)
ORDER BY 1
 
-- Mostrar un listado que presente: mes    Nro pedidos.
-- el listado solo debe mostrar los pedidos
-- realizados en el a�o 1996.
------------------------------------------------------------------
SELECT	DATEPART(MONTH,OrderDate) AS 'Mes'
		,COUNT(OrderDate) AS 'Nro. pedidos'
FROM Orders
WHERE DATEPART(YEAR,OrderDate) = 1996
GROUP BY DATEPART(MONTH,OrderDate)
------------------------------------------------------------------
PRINT DATEPART(DAY,GETDATE())
-- Mostrar un listado de pedidos realizados en la primera quincena
-- del mes de febrero del a�o 1997.
------------------------------------------------------------------ 
SELECT *
FROM Orders
WHERE DATEPART(YEAR ,OrderDate) = 1997 AND
      DATEPART (MONTH,OrderDate) = 2 AND
      (DATEPART(DAY,OrderDate) BETWEEN 1 AND 15)-- 15 filas
-- DATENAME(p1,p2): nombre del par�metro
PRINT DATENAME(MONTH,GETDATE())
--
-- Mostrar un listado que presente: mes    Nro pedidos.
-- el listado solo debe mostrar los pedidos
-- realizados en el a�o 1997.
SELECT	DATENAME(MONTH,OrderDate) AS 'Mes'
		,COUNT(*) AS 'Nro. pedidos'
FROM Orders
WHERE DATEPART(YEAR,OrderDate) = 1997
GROUP BY DATENAME(MONTH,OrderDate),DATEPART(MONTH,OrderDate)
ORDER BY DATEPART(MONTH,OrderDate)
------------------------------------------------------------------

PRINT DATENAME(weekday,GETDATE())
------------------------------------------------------------------
-- Mostrar un listado de pedidos realizados un martes 13 o
-- un domingo 7
SELECT *
FROM Orders
WHERE (DATENAME(WEEKDAY,OrderDate) = 'martes' AND
      DATEPART(DAY,OrderDate) = 13) OR
      (DATENAME(WEEKDAY,OrderDate) = 'domingo' AND
      DATEPART(DAY,OrderDate) = 7)

------------------------------------------------------------------
--Consulta a varias Tablas
------------------------------------------------------------------
   Orders       Customers          Orders     Customers
-- Orden      NombreEmpresa        Fecha     Pa�s
-------------------------------------------------------
SELECT  Orders.OrderID
		,Customers.CompanyName
		,Orders.OrderDate
		,Customers.Country
FROM Orders 
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID 

--      
SELECT  O.OrderID
		,C.CompanyName
		,O.OrderDate
		,C.Country
FROM Orders AS O 
INNER JOIN Customers AS C
ON O.CustomerID = C.CustomerID 
      
      






 






------------------------------------------------------







