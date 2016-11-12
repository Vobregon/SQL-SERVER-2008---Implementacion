
USE Northwind
GO

--MOSTRAR EL NOMBRE DEL CLIENTE, EL PAIS Y EL NUMERO DE PEDIDOS REALIZADOS

SELECT C.CompanyName AS 'Cliente'
,C.Country AS 'Pais'
,C.City
,COUNT (O.OrderID) AS 'Nro. de pedidos'
