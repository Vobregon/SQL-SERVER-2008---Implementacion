--Activar Northwind
USE Northwind
GO
-----------------------------------------------
-- Agrupar datos: GROUP BY
-----------------------------------------------
-- Mostrar el código del cliente y el número
-- de pedidos realizados.
SELECT	CustomerID
		,COUNT(OrderID) AS 'Nro. de pedidos'
FROM Orders
GROUP BY CustomerID
ORDER BY 2 DESC
--  Mostrar : el código de categoría, la cantidad
-- de productos y el promedio de precios por cada categoría
SELECT	CategoryID
		,COUNT(*) AS 'Cantidad de productos'
		,AVG(UnitPrice) AS 'Promedio de precios por categoría'	
FROM Products
GROUP BY CategoryID

-- Mostrar: el número de orden y el total neto de cada 
-- orden.
SELECT	OrderID
		,SUM(UnitPrice*Quantity * (1-discount)) AS 'Neto a pagar'
FROM [Order Details]
GROUP BY OrderID

-- Mostrar: el número de orden y el total neto de cada 
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
-- mostrar: el código del empleado y el número de ordenes
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
-- Mostrar un listado de los pedidos realizados en el año 1998.
SELECT *
FROM Orders
WHERE DATEPART(YEAR,OrderDate)= 1998
-----------------------------------------------------------------
PRINT DATEPART(MONTH,GETDATE())
-- Mostrar un listado de los pedidos realizados en el primer bimestre
-- del año 1997.
SELECT *
FROM Orders
WHERE DATEPART(YEAR,OrderDate) = 1997 AND
      DATEPART(MONTH,OrderDate) IN (1,2)-- 62 filas
      
------------------------------------------------------------------
-- Mostrar un listado que presente: año    Nro pedidos
SELECT	DATEPART(YEAR,OrderDate) AS 'Año'
		,COUNT(OrderID) AS 'Nro. de pedidos'
FROM Orders
GROUP BY DATEPART(YEAR,OrderDate)
ORDER BY 1
 
-- Mostrar un listado que presente: mes    Nro pedidos.
-- el listado solo debe mostrar los pedidos
-- realizados en el año 1996.
------------------------------------------------------------------
SELECT	DATEPART(MONTH,OrderDate) AS 'Mes'
		,COUNT(OrderDate) AS 'Nro. pedidos'
FROM Orders
WHERE DATEPART(YEAR,OrderDate) = 1996
GROUP BY DATEPART(MONTH,OrderDate)
------------------------------------------------------------------
PRINT DATEPART(DAY,GETDATE())
-- Mostrar un listado de pedidos realizados en la primera quincena
-- del mes de febrero del año 1997.
------------------------------------------------------------------ 
SELECT *
FROM Orders
WHERE DATEPART(YEAR ,OrderDate) = 1997 AND
      DATEPART (MONTH,OrderDate) = 2 AND
      (DATEPART(DAY,OrderDate) BETWEEN 1 AND 15)-- 15 filas
-- DATENAME(p1,p2): nombre del parámetro
PRINT DATENAME(MONTH,GETDATE())
--
-- Mostrar un listado que presente: mes    Nro pedidos.
-- el listado solo debe mostrar los pedidos
-- realizados en el año 1997.
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
-- Orden      NombreEmpresa        Fecha     País
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







