-- Consultas:
-- Activar la base de datos Northwind
USE Northwind
GO
--01 Consultar la tabla Categories 
SELECT * FROM Categories -- 8 filas
--02 Consultar la tabla CustomerCustomerDemo
SELECT * FROM CustomerCustomerDemo -- 0 filas
--03 Consultar la tabla CustomerDemographics
SELECT * FROM CustomerDemographics -- 0 filas
--04 Consultar la tabla Customers
SELECT * FROM Customers -- 91 filas
--05 Consultar la tabla Employees
SELECT * FROM Employees -- filas
--06 Consultar la tabla EmployeeTerritories
SELECT * FROM EmployeeTerritories--49 filas
--07 Consultar la tabla [Order Details]
SELECT * FROM [Order Details]--2155 filas
--08 Consultar la tabla Orders
SELECT * FROM Orders -- 830 filas
--09 Consultar la tabla Products
SELECT * FROM Products -- 77 filas
--10 Consultar la tabla Region
SELECT * FROM Region -- 4 filas
--11 Consultar la tabla Shippers
SELECT * FROM Shippers -- 3 filas
--12 Consultar la tabla Suppliers
SELECT * FROM Suppliers -- 29 filas
--13 Consultar la tabla Territories
SELECT * FROM Territories -- 53 filas
-----------------------------------------------
-- SELECT 
-- * se muestran todas las columnas
-- FROM : indica el origen de los datos(tabla).
------------------------------------------------

SELECT * FROM Customers
-- Codigo    Empresa       Ciudad      Pais
--14
SELECT CustomerID,CompanyName,City,Country
FROM Customers
--
SELECT	CustomerID
		,CompanyName
		,City
		,Country
FROM Customers
--15
SELECT	CustomerID  AS 'Código'
		,CompanyName AS 'Empresa'
		,City AS 'Ciudad'
		,Country AS 'País'
FROM Customers
--16 Mostrar un listado de precios (Products)
SELECT	ProductID
		,ProductName
		,UnitPrice
		,QuantityPerUnit
FROM Products
WHERE Discontinued =0 -- 69 filas
-----------------------------------------
-- Campo calculado:es un campo virtual, que se
-- obtiene evaluando una expresión formada por
-- valores almacenados.
-- Mostrar un listado de precios (Products).Agregar una
-- columna que muestre el precio incluido IGV.
--17
SELECT	ProductID
		,ProductName
		,UnitPrice
		,UnitPrice * 1.18 AS 'Precio incluido IGV'
		,QuantityPerUnit
FROM Products
WHERE Discontinued =0 -- 69 filas
--18
SELECT  OrderID
		,ProductID
		,UnitPrice
		,Quantity
		,UnitPrice*Quantity AS 'Subtotal'
		,Discount
		,UnitPrice*Quantity*Discount AS 'Monto del descuento'
		--,UnitPrice * Quantity -(UnitPrice*Quantity*Discount) AS 'Neto'		
		,UnitPrice * Quantity *(1-Discount) AS 'Neto'
FROM [Order Details]
----------------------------------------------
-- Operadores: +,-,*,/
--             >,>=,<.<=, <>
--             AND , OR  NOT
----------------------------------------------
-- Filtrar datos:
-- WHERE (condicion)
-- WHERE (nombreColumna  OPERADOR   Expresion)
----------------------------------------------
--19 Mostrar un listado de los clientes de Mexico
SELECT *
FROM Customers
WHERE (Country ='Mexico')-- 5 filas
--20 Mostrar un listado de los clientes de Brazil y
-- Venezuela.
SELECT *
FROM Customers
WHERE Country = 'Brazil' OR 
      Country = 'Venezuela' -- 13 filas
      
--21 Mostrar los productos con precio unitario entre
-- 20 y 40 (incluido los extremos).
SELECT *
FROM Products
WHERE UnitPrice>= 20 AND
      UnitPrice<=40 -- 26 filas
--21.1 Operador BETWEEN:      
--Mostrar los productos con precio unitario entre
-- 20 y 40 (incluido los extremos).
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 20 AND 40 -- 26 filas
 
--22Mostrar los productos de la categorias 1,2,3 y 4
-- y  con precio unitario entre 10 y 50
-- (incluido los extremos)
SELECT *
FROM Products
WHERE	(CategoryID = 1 OR
		CategoryID = 2 OR
		CategoryID = 3 OR
		CategoryID = 4) AND
		UnitPrice BETWEEN 10 AND 50-- 39 filas
		 
--22.1 Mostrar los productos de la categorias 1,2,3
-- y 4 con precio unitario entre 10 y 50
-- (incluido los extremos). Utilizar el operador IN
SELECT *
FROM Products
WHERE CategoryID IN (1,2,3,4)AND
      (UnitPrice BETWEEN 10 AND 50)
--23 Que productos son abastecidos por el proveedor
-- 3. La lista solo debe mostrar los productos
-- con precio unitario mayor a 20 y menor a 50
SELECT *
FROM Products
WHERE SupplierID = 3 AND
      (UnitPrice> 20 AND UnitPrice < 50)
--------------------------------------------------
--24 Mostrar las ordenes realizadas en el año 1998
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '19980101' AND '19981231'
--25 Mostrar las ordenes emitidas el ultimo bimestre
-- del año 1997
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '19971101' AND '19971231'
-- 82 filas.
--------------------------------------------------       
-- Búsqueda en cadena de caracteres.
--------------------------------------------------
-- Uso de comodines 
-- % : reemplaza a cero o mas caracteres.
--26 Mostrar un listado de los clientes que tengan
-- como primer caracter en el nombre la letra C
SELECT *
FROM Customers
WHERE CompanyName LIKE 'C%'
--
--27 Mostrar un listado de los clientes que tengan
-- como primer  y último caracter en el nombre
-- la letra a

select * from Customers
where CompanyName like 'A%A'

--28 Mostrar los productos que tengan en el nombre
-- la palabra queso.

SELECT * FROM Products
WHERE ProductName LIKE '%QUESO%'
----------------------------------------------
--  _ : Reemplaza un único caracter

--28 Mostrar los productos que tengan como 
-- tercer caracter la letra a en el nombre
SELECT *
FROM Products
WHERE ProductName LIKE '__a%'
---------------------------------------------
--[abc]
-- Mostrar un listado de clientes que tengan como
-- primer caracter en el nombre la letra a,b,c y d
SELECT *
FROM Customers
WHERE CompanyName LIKE '[ABCD]%'
----------------------------------------------
--[^abc]
-- Mostrar un listado de clientes que NO tengan como
-- primer caracter en el nombre la letra a,b,c y d
SELECT *
FROM Customers
WHERE CompanyName LIKE '[^ABCD]%'
---------------------------------------------------
--[a-c]
-- Mostrar un listado de clientes que tengan como
-- primer caracter en el nombre la letra a,b,c,d
-- e,f,g y h
SELECT *
FROM Customers
WHERE CompanyName LIKE '[A-H]%'
ORDER BY CompanyName
----------------------------------
SELECT * FROM Products
ORDER BY UnitPrice
--
SELECT * FROM Products
ORDER BY UnitPrice DESC
--
SELECT * FROM Products
ORDER BY CategoryID,UnitPrice DESC
-------------------------------------------------
SELECT * FROM Products
ORDER BY 3
-------------------------------------------------
-- Funciones de agregado
-------------------------------------------------
-- MAX()
-- MIN()
-- AVG()
-- SUM()
-- COUNT()
---------------------------------------------
SELECT MAX(UnitPrice) AS 'Precio mas caro'
FROM Products
--
SELECT MIN(UnitPrice) AS 'Precio mas bajo'
FROM Products
--
SELECT AVG(UnitPrice) AS 'Promedio de precios'
FROM Products
-- Cuantos productos vende Northwind, en la
-- actualidad.
SELECT COUNT(ProductID) AS 'Cantidad de productos'
FROM Products
WHERE Discontinued =0
-- Cuantos productos de la categoria 1,2 y 7 
-- vende Northwind en la actualidad.
SELECT COUNT(ProductID) AS 'Cantidad de productos'
FROM Products
WHERE CategoryID IN (1,2,7) AND
       Discontinued =0
    
-- Obtener el stock valorado.
SELECT SUM(UnitPrice * UnitsInStock) AS 'Stock valorado'
FROM Products
-- Cuantos pedidos se realizaron en el año  1997.
SELECT COUNT (OrderID) AS 'Cantidad de pedidos' 
FROM Orders
WHERE OrderDate BETWEEN '19970101' AND '19971231'

-- Cuanto se vendio en total.(NETO)
SELECT SUM(UnitPrice * Quantity * (1- discount)) AS 'Neto'
FROM [Order Details]
-- Cuanto se desconto en total.
SELECT SUM(UnitPrice*Quantity*Discount) AS 'Monto descuento'
FROM [Order Details]
-- Obtener el precio mas alto,mas bajo y el promedio
-- de los productos de la categoria 7.

select  MAX(UnitPrice) AS 'MAS ALTO', 
		MIN(UnitPrice)AS 'MAS BAJO',
		AVG(UnitPrice)AS 'PROMEDIO'
from Products
WHERE CategoryID=7 AND Discontinued=0








 












 


