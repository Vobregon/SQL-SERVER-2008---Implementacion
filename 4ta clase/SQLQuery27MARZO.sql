--01 Activar la base de datos de usuario VENTAS25
USE VENTA25
GO
--02 Crear la tabla USUARIO.
-- La columna idUsuario tiene la propiedad IDENTITY.
-- los valores de la columna idUsuario, los genera de
-- forma automatica SQL Server.
CREATE TABLE USUARIO(
idUsuario    INT NOT NULL IDENTITY,
nombre       VARCHAR(40) NOT NULL,
clave        CHAR(4) NOT NULL,
fechaActualizacion   DATETIME NOT NULL
)
-- Crear la clave primaria
ALTER TABLE USUARIO
ADD CONSTRAINT pk_usuario
PRIMARY KEY(idUsuario)
SET DATEFORMAT dmy

-- insertar filas a la tabla USUARIO.
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('jflores','1234','27/03/2014')
--
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('hvalencia','4321','28/03/2014')
-- consultar la tabla USUARIO
SELECT * FROM USUARIO
--
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('gcoronel','2234','27/03/2014')
-- Crear la restriccion UNIQUE, para evitar ingresar
-- valores duplicados en la columna nombre
ALTER TABLE USUARIO
ADD CONSTRAINT u_nombre
UNIQUE(nombre)
--
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('jfloresr','3234','27/03/2014')
--
SELECT * FROM USUARIO
-- modificar la tabla USUARIO, para agregar la columna
-- correo VARCHAR(100)
ALTER TABLE USUARIO
ADD correo VARCHAR(100) NULL
--
SELECT * FROM USUARIO
--------------------------------------------------------
-- Crear la restriccion CHECK
-- Validar que los valores de la columna fechaAtualizacion
-- sean mayores o igual a la fecha del sistema
-- GETDATE(): es una funcion del sistema, que retorna la
-- la fecha del sistema. 
--------------------------------------------------------
ALTER TABLE USUARIO
ADD CONSTRAINT chk_01
CHECK(fechaActualizacion>=GETDATE())
-- Actualizar los valores de la columna fechaActualizacion
UPDATE USUARIO
		SET fechaActualizacion ='28/03/2014'
-- Comprobar la restriccion CHECK
-- ERROR
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('atorres','4234','26/03/2014')
--EXITO
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('atorres','4234',GETDATE())
--
SELECT *  FROM USUARIO
-- Actualizar la columna correo
UPDATE USUARIO
		SET correo='jflores@hotmail.com'
WHERE idUsuario = 2
SELECT * FROM USUARIO
--
UPDATE USUARIO
		SET correo='no disponible'
WHERE idUsuario IN(3,4,6,8)
--
SELECT * FROM USUARIO
-- USO DE DEFAULT
-- Cuando no se indique un valor a  la columna correo,
-- el sistema proporcione por defecto 'no disponible'
-------------------
ALTER TABLE USUARIO
ADD CONSTRAINT u_correo
DEFAULT 'no disponible' FOR correo
-- comprobar el default recien creado
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('palva','4504',GETDATE())
--
SELECT * FROM USUARIO
-- Ejemplo de CHECK: Crear una restriccion que permita 
-- validar los caracteres ingresados en la columna clave
-- En la columna clave solo se aceptan dígitos
ALTER TABLE USUARIO
ADD CONSTRAINT chk_clave
CHECK(clave LIKE '[0-9][0-9][0-9][0-9]')
-- Validar el check
INSERT INTO USUARIO (nombre,clave,fechaActualizacion)
VALUES('jperez','5504',GETDATE())
--
SELECT * FROM USUARIO
--

		
		 





 


