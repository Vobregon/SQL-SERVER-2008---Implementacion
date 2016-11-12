--Activar la base de datos de usuario MarketPERU
USE MarketPERU
GO
--01
SELECT *
FROM CATEGORIA
--02
SELECT *
FROM GUIA -- Se utiliza para vender
--03
SELECT *
FROM GUIA_DETALLE 
--04
SELECT *
FROM LOCAL
-- 05
SELECT *
FROM ORDEN --Se crea cuando MarketPERU compra 
-- a los proveedores.
--06
SELECT *
FROM ORDEN_DETALLE
--07
SELECT *
FROM PRODUCTO
--08
SELECT *
FROM PROVEEDOR


