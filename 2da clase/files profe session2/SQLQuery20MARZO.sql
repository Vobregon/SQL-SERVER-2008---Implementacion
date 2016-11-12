CREATE DATABASE Biblioteca1
GO

USE Biblioteca1
------------------------------------------------------------------

Crear la base de datos BibliotecaCEPS

CREATE DATABASE BibliotecaCEPS
ON PRIMARY (
NAME= BibliotecaCEPS_dat,
FILENAME='C:\DATA\BibliotecaCEPS.mdf',
SIZE = 30MB,
MAXSIZE = 50MB,
FILEGROWTH = 2MB
)LOG ON (
NAME=BibliotecaCEPS_log,
FILENAME='C:\DATA\BibliotecaCEPS.ldf',
SIZE = 10MB,
MAXSIZE = 20MB,
FILEGROWTH = 2MB
)

--Crear las tablas de la aplicacion
--Obs: Activar la base de datos BibliotecaCEPS

CREATE TABLE LIBRO(
idLibro INT NOT NULL,
titulo  VARCHAR (60) NOT NULL,
numerodepaginas INT NOT NULL
)

CREATE TABLE EJEMPLAR(
idejemplar INT NOT NULL,
estado  VARCHAR (60) NOT NULL,
idlibro INT NOT NULL
)


CREATE TABLE EJEMPLAR_PRESTAMO(
idejemplar INT NOT NULL,
idprestamo INT NOT NULL
)


CREATE TABLE AUTOR_LIBRO(
idautor INT NOT NULL,
idlibro INT NOT NULL
)



CREATE TABLE PRESTAMO(
fechadeprestamo VARCHAR (60) NOT NULL,
fechadevolucion VARCHAR (60) NULL,
idlector INT NOT NULL
)


CREATE TABLE LECTOR(
nombre VARCHAR (60) NOT NULL,
direccion VARCHAR (60) NOT NULL
)


CREATE TABLE AUTOR(
nombre VARCHAR (60) NOT NULL,
nacionalidad VARCHAR (20) NULL
)