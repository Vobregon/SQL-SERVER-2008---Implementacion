--CREAR LA BASE DE DATOS DE USUARIO UAP

------------------------------------------------------------------

--ACTIVAR LA BASE DE DATOS DEL SISTEMA MASTER
USE master
GO
--02
CREATE DATABASE UAP
ON PRIMARY (
NAME=UAP_dat,
FILENAME='C:\DATA\UAP.mdf',
SIZE=30 MB,
MAXSIZE=50 MB,
FILEGROWTH = 2 MB
)
LOG ON (
NAME=UAP_log,
FILENAME='C:\DATA\UAP.ldf',
SIZE=10 MB,
MAXSIZE=20 MB,
FILEGROWTH = 2 MB
)
GO

----------------------------------------------------------------------------------------

--PROCEDIMIENTOS ALMACENADOS

-- ES UN PROGRAMA QUE SE EJECUTA EN EL SERVIDOR.
----------------------------------------------------------------------------------------

TIPOS
PA Del sistema
PA de usuario
PA extendidos

--PA del sistema: Son programas que estan preprardos 
--para ejecutarse (EXECUTE nombrePA).

EXECUTE sp_helpdb
--
EXECUTE sp_helpdb UAP
--Modificar la base de datos UAP
--Agregar archivos (con extension.ndf)
ALTER DATABASE UAP
ADD FILE(
NAME=UAP_DAT_01,
FILENAME='C:\DATA\UAP.ndf',
SIZE=20 MB,
MAXSIZE=40 MB,
FILEGROWTH = 2 MB
)
--Modificar la base de datos UAP, agregando tamaño
--al archivo .mdf
ALTER DATABASE UAP
MODIFY FILE(
NAME=UAP_dat,
SIZE = 50 MB,
MAXSIZE = 70 MB
)
EXECUTE sp_helpdb UAP



)
------------------------------------------------------------------------------------------------
--CREACION DE TABLAS
------------------------------------------------------------------------------------------------
1. Conocer el numero de tablas
2. Para cada tabla se debe conocer el numero de columnas
3. Para cada columna conocer: tipo de dato asociado, amplitud,numero de decimales
3.1 Para cada columna determinar la caracteristica NULL o NOT NULL
4. Que columnas forman la clave primaria (pk)
5. Que columnas forman la clave foranea (fk)
5.1 Que columnas de las tablas tienen la caracteristica IDENTITY
6. Otras restricciones que se deben de aplicar a cada una de las columnas (UNIQUE, CHECK, DEFAULT)
7. Que columnas van a formar indices
------------------------------------------------------------------------------------------------
--Datos: cadena de caracteres
			numericos: enteros o decimales
			fecha
			imagenes
			bit (0.1)
			