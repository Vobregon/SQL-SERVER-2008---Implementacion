--01 Activar la base de datos del sistema master
USE master
GO
-- 02 Crear la base de datos VENTA25
CREATE DATABASE VENTA25
ON PRIMARY(
NAME=VENTA25_dat,
FILENAME='C:\DATA\VENTA25.mdf',
SIZE= 30 MB,
MAXSIZE= 50 MB,
FILEGROWTH= 2 MB
)
LOG ON(
NAME=VENTA25_log,
FILENAME='C:\DATA\VENTA25.ldf',
SIZE= 10 MB,
MAXSIZE= 20 MB,
FILEGROWTH= 2 MB
)
GO
--03 Activar la base de datos de usuario VENTAS25
USE VENTA25
GO
--04 Crear las tablas de la base de datos VENTAS25
CREATE TABLE CLIENTE(
idCliente      INT NOT NULL,
nombre		   VARCHAR(50) NOT NULL,
direccion	   VARCHAR(60) NOT NULL,
ruc				CHAR(11) NOT NULL,
telefono        CHAR(7) NULL,
web             VARCHAR(80) NULL	
)
--------------------------------------------------
SET LANGUAGE spanish
-- insertar filas a la tabla CLIENTE
INSERT INTO CLIENTE(idCliente,nombre,direccion,ruc,telefono,web)
VALUES(1,'CEPS UNI','Av. Tupac Amaru 210','12345678900','4321212'
,'www.cepsuni.edu.pe')
--
INSERT INTO CLIENTE(idCliente,nombre,direccion,ruc,telefono,web)
VALUES(1,'SISTEMAS UNI','Av. Tupac Amaru 610','22345678900','5321212'
,'www.sistemasuni.edu.pe')
--
DELETE FROM CLIENTE
-- Antes de ingresar datos crear todas las restricciones.
---------------------------------------------------------
ALTER TABLE CLIENTE
ADD CONSTRAINT pk_cliente
PRIMARY KEY(idCliente)
-- probar la restriccion de clave primaria
INSERT INTO CLIENTE(idCliente,nombre,direccion,ruc,telefono,web)
VALUES(1,'CEPS UNI','Av. Tupac Amaru 210','12345678900','4321212'
,'www.cepsuni.edu.pe')
--
INSERT INTO CLIENTE(idCliente,nombre,direccion,ruc,telefono,web)
VALUES(2,'SISTEMAS UNI','Av. Tupac Amaru 610','22345678900','5321212'
,'www.sistemasuni.edu.pe')
--
SELECT * FROM CLIENTE
--
CREATE TABLE FACTURA(
idFactura      INT NOT NULL,
fecha		   DATETIME NOT NULL,
monto			DECIMAL(10,2)NOT NULL,
idCliente       INT NOT NULL -- clave foranea
)
GO
--
ALTER TABLE FACTURA
ADD CONSTRAINT   pk_factura
PRIMARY KEY(idFactura)
--
ALTER TABLE FACTURA
ADD CONSTRAINT fk_cliente
FOREIGN KEY (idCliente)
REFERENCES CLIENTE(idCliente)
--










