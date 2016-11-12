


USE MarketPERU
GO

SELECT * FROM PRODUCTO

-- 1. Generar una lista que muestre todos los productos
-- de las categorias 1,2,3

SELECT * FROM PRODUCTO
WHERE (IdCategoria=1 or
IdCategoria=2 or
IdCategoria=3)

-- 2. Generar una lista que muestre cuantas unidades de cada
-- producto se ha solicitado a los proveedores

SELECT IdProducto
, CantidadSolicitada
FROM ORDEN_DETALLE
ORDER BY IdProducto
-------------------------------------------------------
SELECT IdProducto
, SUM(CantidadSolicitada)AS 'Cantidad Solicitada'
FROM ORDEN_DETALLE
GROUP BY IdProducto
ORDER BY 2 DESC
-------------------------------------------------------
SELECT ORDEN_DETALLE.IdProducto
, PRODUCTO.Nombre
,SUM(ORDEN_DETALLE.CantidadSolicitada) AS 'Cantidad Solicitada' 
FROM ORDEN_DETALLE
INNER JOIN PRODUCTO
ON ORDEN_DETALLE.IdProducto=PRODUCTO.IdProducto
GROUP BY ORDEN_DETALLE.IdProducto
ORDER BY 3 DESC


--3.Muestre un listado de los productos cuyo stock actual se 
-- encuentra por debajo del stock minimo

SELECT * FROM PRODUCTO
WHERE StockActual<=StockMinimo

-- 4.Muestre una lista con los campos IdProducto, Nombre 
-- del Proveedor y Nombre del Producto

SELECT PRODUCTO.IdProducto
,PROVEEDOR.Nombre
,PRODUCTO.Nombre
FROM PRODUCTO
INNER JOIN PROVEEDOR
ON PRODUCTO.IdProveedor=PROVEEDOR.IdProveedor

--5. Muestre una linea de Productos cuyo tercer caracter en 
--el nombre es O y que ademas el nombre termina en vocal

SELECT * FROM PRODUCTO
WHERE Nombre LIKE '__O%[AEIOU]'

-- 6 Muestre el producto o productos cuyo precio es el mas caro

SELECT MAX(PrecioProveedor) AS 'MAS ALTO'
FROM PRODUCTO
where Descontinuado = 0

-- 7 Muestre los productos con los 2 precios mas bajos

SELECT TOP 2 WITH TIES Nombre AS 'Nombre del Producto'
,PrecioProveedor
FROM PRODUCTO
ORDER BY 2 DESC

-- 8 Genere un listado de todas las categoria de productos y que muestre el precio mas bajo 
-- en cada categoria

SELECT IdCategoria
,MIN(PrecioProveedor) AS 'MAS BAJO'
FROM PRODUCTO
GROUP BY (IdCategoria)


-- 9 Muestre el nombre de las categorias con los DOS precios mas bajos

SELECT TOP 2 WITH TIES *
FROM PRODUCTO
ORDER BY PrecioProveedor

-- 10 Genere un listado que muestre la cantidad de guias de remision emitidas para cada local

SELECT L.Direccion AS 'LOCAL'
,COUNT (GD.Cantidad) AS 'Cantidad'
FROM LOCAL AS L
INNER JOIN GUIA AS G
ON L.IdLocal=G.IdLocal
INNER JOIN GUIA_DETALLE AS GD
ON G.IdGuia=GD.IdGuia
GROUP BY L.Direccion 
ORDER BY 2 DESC

-- 11 Cuantos productos existen por Categoria

SELECT NOMBRE AS 'CATEGORIA'
,COUNT(StockActual) AS 'Cantidad de productos'
FROM PRODUCTO
WHERE Descontinuado =0
GROUP BY NOMBRE


-- 12 Genere un listado con las ordenes que tengan el ESTADO agotado

SELECT P.NOMBRE AS 'CATEGORIA'
,OD.ESTADO
FROM PRODUCTO AS P
INNER JOIN ORDEN_DETALLE AS OD
ON P.IdProducto=OD.IdProducto
WHERE OD.Estado='AGOTADO'


-- 13 Genere un listado con los productos que abastece el proveedor Papelera Pachacamac

SELECT PR.Nombre AS 'PROVEEDOR'
,P.IdProducto AS 'COD PROD' 
,P.Nombre AS 'PRODUCTO'
FROM PRODUCTO AS P
INNER JOIN PROVEEDOR AS PR
ON P.IdProveedor   =PR.IdProveedor
WHERE PR.Nombre='Papelera Pachacamac'

-- 14 Muestre los productos que tenga en el nombre la palabra CHOCOLATE

SELECT * FROM PRODUCTO
WHERE Nombre LIKE '%CHOCOLATE%'








