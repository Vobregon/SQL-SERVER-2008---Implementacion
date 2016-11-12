CREATE DATABASE Biblioteca1
GO
use Biblioteca1
-----------------------------------------------------
-- Crear la base de datos BibliotecaCEPS
CREATE DATABASE  BibliotecaCEPS
ON PRIMARY(
NAME= BibliotecaCEPS_dat,
FILENAME='C:\DATA\BibliotecaCEPS.mdf',
SIZE= 30 MB,
MAXSIZE= 50 MB,
FILEGROWTH = 2 MB
)LOG ON(
NAME= BibliotecaCEPS_log,
FILENAME='C:\DATA\BibliotecaCEPS.ldf',
SIZE= 10 MB,
MAXSIZE= 20 MB,
FILEGROWTH = 2 MB
)
-- Crear las tablas de la aplicación
-- Obs:activar la base de datos BibliotecaCEPS
USE BibliotecaCEPS
GO
CREATE TABLE Libro(
idLibro     INT NOT NULL,
titulo      VARCHAR(60) NOT NULL,
numeroPaginas    INT NOT NULL
)







