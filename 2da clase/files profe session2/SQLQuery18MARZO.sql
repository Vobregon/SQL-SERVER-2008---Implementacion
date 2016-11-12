-- Crear la base de datos de Usuario UAP
------------------------------------------
--01 Activar la base del sistema master
USE master
GO
--02
CREATE DATABASE UAP
ON PRIMARY(
NAME=UAP_dat,
FILENAME='C:\DATA\UAP.mdf',
SIZE =30 MB,
MAXSIZE= 50 MB,
FILEGROWTH = 2 MB  
)
LOG ON (
NAME=UAP_log,
FILENAME='C:\DATA\UAP.ldf',
SIZE =10 MB,
MAXSIZE= 20 MB,
FILEGROWTH = 2 MB
)
GO
--------------------------------------------
--Procedimientos almacenados
-- Es un programa que se ejecuta en el servidor. 
------------------------------------------------
Tipos
PA Del sistema
PA de usuario 
PA extendidos.


-- PA del sistema: son programas que estan preparados
-- para ejecutarse  (EXECUTE nombrePA).
EXECUTE sp_helpdb
--
EXECUTE sp_helpdb UAP
--Modificar la base de datos UAP
-- Agregar archivos (.ndf)
ALTER DATABASE UAP
ADD FILE(
NAME=UAP_dat_01,
FILENAME='C:\DATA\UAP.ndf',
SIZE =20 MB,
MAXSIZE= 40 MB,
FILEGROWTH = 2 MB
)
-- Modificar la base de datos UAP, agregando tamaño 
-- al archivo .mdf
ALTER DATABASE UAP
MODIFY FILE(
NAME=UAP_dat,
SIZE = 50 MB,
MAXSIZE = 70 MB
)
EXECUTE sp_helpdb UAP
---------------------------------------------------
-- Creación de tablas
---------------------------------------------------
1. Conocer el número de tablas
2. Para cada tabla , se debe conocer el número de columnas
3. Para cada columna:  tipo de dato asociado
						amplitud
						numero de decimales
3.1 pàra cada columna determinar la caracteristica NULL | NOT NULL						
4. Que columnas forman la clave primaria (pk)
5. Que columnas forman la clave foranea (fk)
5.1 Que columna de las tablas tienen la caracteristica IDENTITY
6. Otras restricciones que se deben de aplicar  a cada
  una de las columnas (UNIQUE, CHECK, DEFAULT).
7. Que columnas van a formar indices  							 
------------------------------------------------------------
-- Datos:	cadena de caracteres 
			numericos :enteros
					   decimales
			fecha
			imagenes
			bit  (0,1)
			
			      		   				        



 

