-- Subconsultas: Una subconsulta es un comando
-- SELECT dentro de otro comando SELECT
USE MarketPERU
GO
--
SELECT * FROM PRODUCTO
-- Mostrar un listado de todos los productos con
-- precioProveedor mayor o igual al promedio
-- de precios
--
SELECT AVG(PrecioProveedor)
FROM PRODUCTO -- > 5.7468
--
SELECT * FROM PRODUCTO
WHERE PrecioProveedor >=5.7468 --> 52 filas
-- utilizando una subConsulta-----------------------
SELECT * FROM PRODUCTO
WHERE PrecioProveedor >=(SELECT AVG(PrecioProveedor)
						FROM PRODUCTO) --> 52 filas
GO
-----------------------------------------------------
-- Genere un listado que muestre el nombre y el precio de los
-- productos con precio igual al producto mas caro.
SELECT	Nombre
		,PrecioProveedor
FROM PRODUCTO
WHERE PrecioProveedor =(SELECT MAX(PrecioProveedor)
						FROM PRODUCTO)
GO
-- Mostrar un listado con las siguientes columnas:
-- IDproducto, Nombre, PrecioProveedor de los productos que
-- abastece la empresa Lacteos del centro
SELECT	IdProducto
		,Nombre
		,PrecioProveedor
FROM PRODUCTO
WHERE IdProveedor =(SELECT IdProveedor
					FROM PROVEEDOR
					WHERE Nombre= 'Lacteos del centro')
GO   --> 10 filas
--
SELECT * FROM PRODUCTO --> 138
SELECT * FROM ORDEN_DETALLE
ORDER BY IdProducto -->126
-- Genere un listado de todos los productos que NO se han
-- registrado en una Orden. Mostrar el código y el nombre del
-- producto
SELECT	P1.IdProducto
		,P1.Nombre
FROM PRODUCTO AS P1
WHERE NOT EXISTS(SELECT IdProducto
                 FROM ORDEN_DETALLE AS O
                 WHERE O.IdProducto=P1.IdProducto)
GO --> 96 filas
-- Genere un listado de todos los productos que  se han
-- registrado en una Orden. Mostrar el código y el nombre del
-- producto
SELECT	P1.IdProducto
		,P1.Nombre
FROM PRODUCTO AS P1
WHERE EXISTS(SELECT IdProducto
                 FROM ORDEN_DETALLE AS O
                 WHERE O.IdProducto=P1.IdProducto)
GO -->42 filas.
-- Mostrar un listado con las siguiente columnas:Idproducto
-- Nombre y el precioProveedor de los productos con precioProveedor
-- menor al promedio de todos los precios
SELECT	IdProducto
		,Nombre
		,PrecioProveedor	
FROM PRODUCTO
WHERE PrecioProveedor <(SELECT  AVG(PrecioProveedor)
                        FROM PRODUCTO)
GO -- > 86 filas
------------------------------------------------------
-- Una subconsulta puede reemplazar a una consulta
-- a varias tablas
USE Northwind
GO
--
SELECT	P.ProductID
		,P.ProductName
		,C.CategoryName
		,S.CompanyName
FROM Products AS P
INNER JOIN Categories AS C
ON P.CategoryID= C.CategoryID
INNER JOIN Suppliers AS S
ON P.SupplierID = S.SupplierID
----------------------------------------------
SELECT	P.ProductID
		,P.ProductName
		,(SELECT C.CategoryName
		  FROM Categories AS C
		  WHERE P.CategoryID= C.CategoryID) AS 'Categoria'
		,(SELECT S.CompanyName
		  FROM Suppliers AS S
		  WHERE P.SupplierID= S.SupplierID) AS 'Proveedor' 
FROM Products AS P
---------------------------------------------------------
--Mostrar: El NroPedido Fecha  PrecioMasCaro
SELECT	 O.OrderID
		,O.OrderDate
		,(SELECT MAX(UnitPrice) 
		  FROM [Order Details] AS OD
		  WHERE O.OrderID= OD.OrderID) AS 'Precio mas caro' 
FROM Orders AS O
  


 







 




 

