


CREATE DATABASE BibliotecaCEPS
ON PRIMARY (
NAME=BibliotecaCEPS_dat,
FILENAME='C:\DATA\BibliotecaCEPS.mdf',
SIZE=30 MB,
MAXSIZE=50 MB,
FILEGROWTH = 2 MB
)
LOG ON (
NAME=BibliotecaCEPS_log,
FILENAME='C:\BibliotecaCEPS.ldf',
SIZE=10 MB,
MAXSIZE=20 MB,
FILEGROWTH = 2 MB
)

--CREAR LAS TABLAS DE LA APLICACION
-- OBS: Activar la base de datos BibliotecaCEPS
USE BibliotecaCEPS
GO
CREATE TABLE LIBRO(
idLibro INT NOT NULL,
titulo VARCHAR (60) NOT NULL,
NUMEROPAGINAS INT NOT NULL
)
GO
CREATE TABLE AUTOR(
idAutor INT NOT NULL,
Nombre VARCHAR (60) NOT NULL,
Nacionalidad VARCHAR (20) NOT NULL
)
GO
CREATE TABLE AUTOR_LIBRO(
idAutor INT NOT NULL,
IDLIBRO INT NOT NULL

)
GO
CREATE TABLE EJEMPLAR(
idejemplar INT NOT NULL,
estado VARCHAR (20) NOT NULL,
IDLIBRO INT NOT NULL
)
-------------------------
CREATE TABLE PRESTAMO_EJEMPLAR(
idprestamo INTEGER NOT NULL,
Idejemplar INT NOT NULL
)
GO
CREATE TABLE PRESTAMO(
idPRESTAMO INTEGER NOT NULL,
FECHA DE PRESTAMO DATETIME
FECHA DE DEVOLUCION DATETIME
IDLECTOR INT

)
GO
CREATE TABLA LECTOR(
idLECTOR INT NOT NULL
NOMBRE VARCHAR (60)NOT NULL,
DIRECCION VARCHAR (80)
)
