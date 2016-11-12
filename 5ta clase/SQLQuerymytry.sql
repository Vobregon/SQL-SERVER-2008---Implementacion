
-- CONSULTAS:
-- Activar la base de datos

USE Northwind
GO

-- 01 Consultar la tabla Categories

SELECT * FROM Categories -- 8 filas

-- 02 Consultar la tabla CustomerCustomerDemo

SELECT * FROM CustomerCustomerDemo -- 0 filas

--03 Consultar la tabla CustomerDemographics

SELECT * FROM CustomerDemographics -- 0 filas

-- 04 Consultar la tabla Customers

SELECT * FROM Customers -- 91 filas

-- 05 Consultar la tabla Employees

SELECT * FROM Employees -- 9 filas

-- 06 Consultar la tabla EmployeeTerritories

SELECT * FROM EmployeeTerritories -- 49 filas

-- 07 Consultar la tabla [Order Details]

SELECT * FROM [Order Details] -- 2155 filas

-- 08 Consultar la tabla Orders

SELECT * FROM Orders -- 830 filas

-- 09 Consultar la tabla Products

SELECT * FROM Products -- 77 filas

-- 10 Consultar la tabla Region

SELECT * FROM Region -- 4 filas

-- 11 Consultar la tabla Shippers

SELECT * FROM Shippers -- 3 filas

-- 12 Consultar la tabla Suppliers

SELECT * FROM Suppliers 29 filas

-- 13 Consultar la tabla Territories

SELECT * FROM Territories -- 53 filas

--------------------------------------------------------------------------------------------------

-- SELECT
-- * se muestran todas las columnas
-- FROM: indica el origen de los datos (tabla)
--------------------------------------------------------------------------------------------------

---
SELECT * FROM Customers

SELECT * FROM Products

SELECT ProductName,UnitPrice
FROM Products

SELECT ProductID,ProductName,UnitPrice,QuantityPerUnit
FROM Products
WHERE Discontinued = 0 ------ 69 filas

---------------------------------------------------------------------------------------------------

-- Campo Calculado: Es un campo virtual que se obtiene evaluando una expresion formada por valores almacenados

-- Mostrar un listado de precioS (Products), agregar columna que muestre el precio incluido IGV

SELECT * FROM [Order Details]

SELECT OrderID
, ProductID
,UnitPrice
,Quantity
,UnitPrice*Quantity as 'Subtotal'

FROM [Order Details]



---------------------------------------------------------------------------------------------------

-- operadores: +,-,*,/
--             >,>=,<,<=,<>
--             AND, OR, NOT

---------------------------------------------------------------------------------------------------

-- FILTRAR DATOS:

-- WHERE (condicion)
-- WHERE (nombreColumna  OPERADOR  Expresion)

---------------------------------------------------------------------------------------------------

-- Mostrar un listado de los clientes de Mexico

SELECT * FROM Customers
WHERE (Country = 'Mexico')

-- Mostrar un listado de los clientes de Brasil y Venezuela

SELECT * FROM Customers
WHERE (Country = 'Venezuela')

SELECT * FROM Customers
WHERE (Country = 'Brazil')

SELECT * FROM Customers
WHERE Country = 'Brazil' OR
	Country =  'Venezuela'


-- 21 Mostrar los productos con precio unitario entre 20 y 40 (incluido los extremos).

SELECT * FROM Products
WHERE UnitPrice>= 20 AND
UnitPrice<=40 ------------------------- 26 filas

-- 21.1 OPERADOR BETWEEN:

-- Mostar los productos con precio unitrio entre 20 y 40 (incluido los extremos)

SELECT * FROM Products
WHERE UnitPrice between 20 AND 40--------------- 26 filas

-- 22 Mostrar los productos de la categoria 1,2,3 y 4 y con precio unitario entre 10 y 50 (incluido los extremos)

SELECT * FROM Products
WHERE SupplierID = 3 AND
(UnitPrice > 20 and UnitPrice < 50)

-----------------------------------------------------------------------------

SELECT * FROM ORDERS
WHERE OrderDate BETWEEN '19980101' AND '19981231'

-----------------------------------------------------------------------------

-- Mostrar las ordenes emitidas el ultimo bimestre del año 1997

SELECT * FROM ORDERS
WHERE OrderDate BETWEEN '19971101' AND '19971231'

---------------------------------------------------------------------------------
-- Busqueda en cadena de caracteres
---------------------------------------------------------------------------------

-- Uso de comodines
-- %: reemplaza a cero o mas caracteres
-- Mostrar un listado de los clientes que tengan como primer caracter en el nombre la letra C

SELECT * FROM Customers
WHERE CompanyName LIKE 'C%'

--

SELECT * FROM Customers
WHERE CompanyName LIKE 'C%'AND
CompanyName LIKE '%A'

SELECT * FROM Products
WHERE ProductName LIKE '%QUESO%'

-----------------------------------------------------------------------------------------------

REEMPLAZA UN UNICO CARACTER

-- 28 Mostrar los productos que tengan como 3er caracter la letra A en el nombre

SELECT * FROM Products
WHERE ProductName LIKE '__A%'

-------------------------------------------------------------------------------------------------

--- [ABC]

--- Mostrar un listado de clientes que tengan como primer caracter en el nombr la letra a,b,c y d

SELECT * FROM Customers
WHERE CompanyName LIKE '[ABCD]%'

---Mostrar un listado de clientes que NO tengan como primer caracter en el nombr la letra a,b,c y d

SELECT * FROM Customers
WHERE CompanyName LIKE '[^ABCD]%'

-------------------------------------------------------------------------------------------------


-- MAX()
-- MIN()
-- AVG()
-- SUM()
-- COUNT()

-------------------------------------------------------------------------------------------------
SELECT MAX (UnitPrice) AS 'Precio mas caro'
FROM Products

SELECT MIN (UnitPrice) AS 'Precio mas bajo'
FROM Products

SELECT AVG (UnitPrice) AS 'Promedio de precios'
FROM Products

---Cuantos productos vende Nortwind en la actualidad

SELECT COUNT (ProductID) AS 'Cantidad de Productos'
FROM Products
WHERE Discontinued = 0

-- Cuantos productos de la categoria 1,2 y 7 vende Nortwind en la actualidad

SELECT COUNT (ProductID) AS 'Cantidad de Productos'
FROM Products
WHERE CategoryID IN (1,2,7) AND
Discontinued = 0

-- Obtener el stock valorado

SELECT SUM(UnitPrice * UnitsInStock) AS 'Stock valorado'
FROM Products

-- Cuantos pedidos se realizaron en el año 1997
-- Cuanto se vendio hasta hoy (NETO)
-- Cuanto se desconto en total
-- Obtener el precio mas alto, mas bajo y el promedio de los productos de la categoria 7

SELECT MAX (UnitPrice)AS 'MAS ALTO',
 MIN (UnitPrice)AS 'MAS BAJO',
 AVG (UnitPrice)'PROMEDIO'
FROM Products
WHERE CategoryID=7 AND Discontinued = 0











