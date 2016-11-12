-- CREAR LA BASE DE DATOS VENTAS 27, utilizando 2 archivos
-- Activar la base de datos de usuario VENTAS27
-- Crear las tablas, las pks y fks al momento de crear las tablas
-- Crear las siguientes restricciones
-- OJO: La columna COD_TIPO_PROD es: CHAR (6)
-- Ingresar 3 filas a cada una de las tablas

Create DATABASE Ventas27A 
ON PRIMARY (
NAME = Ventas27A_dat,
FILENAME='C:\DATA\Ventas27A.mdf',
SIZE=30 MB,
MAXSIZE=50 MB,
FILEGROWTH = 2 MB
)
LOG ON (
NAME = Ventas27A_log,
FILENAME='C:\Ventas27A.ldf',
SIZE=10 MB,
MAXSIZE=20 MB,
FILEGROWTH = 2 MB
)
go

use Ventas27A
go

CREATE TABLE DISTRITO(
COD_DIST VARCHAR (10) NOT NULL, 
DESCRIP_DIST  VARCHAR (30) NOT NULL,
PRIMARY KEY(COD_DIST)
)

CREATE TABLE CLIENTE_JURIDICO(
COD_CLI VARCHAR(10) NOT NULL,REFERENCES CLIENTE,
RAZON_SOCIAL_CLI VARCHAR(50)NOT NULL,
RUC_CLI VARCHAR(20)NOT NULL,
CONTACTO_CLI VARCHAR(50) NOT NULL,
COD_CARGO_CLI VARCHAR(10)NOT NULL,
PRIMARY KEY (COD_CLI)
)

CREATE TABLE EMPLEADO(
COD_EMP VARCHAR (10) NOT NULL,
NOMBRES_EMP VARCHAR (20) NOT NULL,
APE_PATER_EMP VARCHAR (30) NOT NULL,
APE_MATER_EMP VARCHAR (30) NOT NULL,
FECHA_NAC_EMP DATETIME NOT NULL,
DIRECCION_EMP VARCHAR(50)NOT NULL,
TELEFONO_EMP VARCHAR (10) NOT NULL,
CODDIST_EMP VARCHAR (10) NOT NULL,
CORREO_E_EMP VARCHAR (25) NOT NULL,
FECHA_INGRESO_EMP DATETIME NOT NULL,
COD_SUPERVISOR VARCHAR (10) NOT NULL
PRIMARY KEY (COD_EMP)
)

CREATE TABLE CLIENTE(
COD_CLI VARCHAR (10) NOT NULL,
DIRECCION_CLI VARCHAR(50)NOT NULL,
TELEFONO_CLI VARCHAR (10) NOT NULL,
CODDIST_CLI VARCHAR (10) NOT NULL,
CORREO_E_EMP VARCHAR (25) NOT NULL,
WEB VARCHAR(40)NOT NULL
PRIMARY KEY (COD_CLI)
)

CREATE TABLE CLIENTE_NATURAL(
COD_CLI VARCHAR (10) NOT NULL,REFERENCES CLIENTE,
NOMBRES_CLI VARCHAR (20) NOT NULL,
APE_PATER_CLI VARCHAR (30) NOT NULL,
APE_MATER_CLI VARCHAR (30) NOT NULL,
PRIMARY KEY (COD_CLI)
)


CREATE TABLE DETALLE_BOLETA(
COD_BOL VARCHAR (10) NOT NULL,
COD_PRO VARCHAR (10) NOT NULL,
Cantidad INT NOT NULL,
PRECIOVENTA DECIMAL (8,2) NOT NULL
PRIMARY KEY (COD_BOL,COD_PRO)
)


CREATE TABLE BOLETA(
COD_BOL VARCHAR (10) NOT NULL,REFERENCES BOLETA
COD_EMP VARCHAR (10) NOT NULL,REFERENCES PRODUCTO
FECHA_BOL DATETIME NOT NULL,
COD_CLI VARCHAR (10) NOT NULL,
ESTADO_BOL VARCHAR (10) NOT NULL
PRIMARY KEY (COD_BOL,COD_PRO)
)

CREATE TABLE PRODUCTO(
COD_PRO VARCHAR (10) NOT NULL,
DESCRIP_PRO VARCHAR (40) NOT NULL,
PRECIO_PRO DECIMAL (8,2) NOT NULL,
STOCK_ACT_PRO INT NOT NULL,
STOCK_MIN_PRO INT NOT NULL,
COD_TIPO_PRO VARCHAR (10) NOT NULL
PRIMARY KEY (COD_PRO)
)


CREATE TABLE TIPO_PRODUCTO(
COD_TIPO_PROD CHAR (6) NOT NULL,
DESCRIP_TIPO_PROD VARCHAR (40) NOT NULL
PRIMARY KEY (COD_TIPO_PROD)

)
