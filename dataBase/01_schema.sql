-- 01_schema.sql
-- Motor: MySQL 8.0+

DROP TABLE IF EXISTS Visitan;
DROP TABLE IF EXISTS Disponibilidad;
DROP TABLE IF EXISTS Inscripcion;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Sucursal;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE Sucursal (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE Producto (
  id INT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  tipoProducto VARCHAR(100) NOT NULL
);

CREATE TABLE Inscripcion (
  idProducto INT NOT NULL,
  idCliente INT NOT NULL,
  PRIMARY KEY (idProducto, idCliente),
  CONSTRAINT fk_insc_producto FOREIGN KEY (idProducto) REFERENCES Producto(id),
  CONSTRAINT fk_insc_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Disponibilidad (
  idSucursal INT NOT NULL,
  idProducto INT NOT NULL,
  PRIMARY KEY (idSucursal, idProducto),
  CONSTRAINT fk_disp_sucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal(id),
  CONSTRAINT fk_disp_producto FOREIGN KEY (idProducto) REFERENCES Producto(id)
);

-- Para permitir múltiples visitas del mismo cliente a la misma sucursal en fechas distintas,
-- incluyo fechaVisita en la PK.
CREATE TABLE Visitan (
  idSucursal INT NOT NULL,
  idCliente INT NOT NULL,
  fechaVisita DATE NOT NULL,
  PRIMARY KEY (idSucursal, idCliente, fechaVisita),
  CONSTRAINT fk_visit_sucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal(id),
  CONSTRAINT fk_visit_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);
