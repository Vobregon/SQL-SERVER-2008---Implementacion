--01 Mostrar el Nombre del cliente ,el pa�s y el n�mero
-- de pedidos realizados.
SELECT	C.CompanyName AS 'Cliente'
		,C.Country AS 'Pa�s'
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
--Mostrar : el nombre de categor�a, la cantidad
--de productos y el promedio de precios por cada categor�a
SELECT	C.CategoryName
		,COUNT(P.ProductID) AS 'Cantidad de productos'
		,AVG(P.UnitPrice) AS 'Promedio de precios por categor�a'	
FROM Products AS P
INNER JOIN Categories AS C
ON P.CategoryID= C.CategoryID
GROUP BY C.CategoryName
--03
-- Mostrar: el n�mero de orden, el nombre del cliente
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
-- mostrar: el nombre del empleado y el n�mero de ordenes
-- que atendio cada empleado.
SELECT	E.FirstName + ' '+ E.LastName AS 'Empleado'
		,COUNT(O.orderID) AS 'Nro. de pedidos'
FROM Employees AS E
INNER JOIN Orders AS O
ON E.EmployeeID= O.EmployeeID
GROUP BY E.FirstName + ' '+ E.LastName
-- Mostrar : Pa�s     Monto Neto Vendido
-- Mostrar : Nombre Empleado   Monto Neto Vendido
-- Mostrar : Nombre de categoria Monto Neto Vendido
-- Mostrar : Nombre de Producto  Monto Neto Vendido
-- Mostrar : nombre de Cliente Nombre Producto  Cantidad
-- solo del producto TOFU.
-- Mostrar : A�o    Total    Descuento   Neto
-- Cuanto($) neto se vendio del producto TOFU en el a�o
-- 1997      A�o   Producto $Venta.
------------------------------------------------------
-- Mostrar : Nombre del empleado    A�os de servicios
-- Mostrar : Nombre del empleado    Edad
-- Mostar  : Nombre del empleado    Edad  (del empleado
-- con mayor edad)
-- Mostrar los datos del empleado mas joven.
------------------------------------------------------- 






SELECT * FROM Employees


