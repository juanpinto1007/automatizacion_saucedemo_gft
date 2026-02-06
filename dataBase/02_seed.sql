-- 02_seed.sql

-- CLIENTES (10)
INSERT INTO Cliente (id, nombre, apellidos, ciudad) VALUES
(1,'Juan','Pinto','Bogotá'),
(2,'Camila','Gómez','Medellín'),
(3,'Santiago','Ruiz','Cali'),
(4,'Valentina','López','Barranquilla'),
(5,'Andrés','Torres','Bogotá'),
(6,'Laura','Martínez','Medellín'),
(7,'Carlos','Hernández','Cali'),
(8,'Diana','Ramírez','Cartagena'),
(9,'Felipe','Vargas','Bogotá'),
(10,'Mariana','Castro','Medellín');

-- SUCURSALES (10)
INSERT INTO Sucursal (id, nombre, ciudad) VALUES
(1,'Sucursal Norte','Bogotá'),
(2,'Sucursal Sur','Bogotá'),
(3,'Sucursal Centro','Medellín'),
(4,'Sucursal Laureles','Medellín'),
(5,'Sucursal San Fernando','Cali'),
(6,'Sucursal Granada','Cali'),
(7,'Sucursal Prado','Barranquilla'),
(8,'Sucursal Manga','Cartagena'),
(9,'Sucursal Envigado','Medellín'),
(10,'Sucursal Usaquén','Bogotá');

-- PRODUCTOS (10)
INSERT INTO Producto (id, nombre, tipoProducto) VALUES
(1,'Membresía Básica','Membresía'),
(2,'Membresía Premium','Membresía'),
(3,'Clase Yoga','Clases'),
(4,'Clase Spinning','Clases'),
(5,'Spa Relax','Servicios'),
(6,'Spa Deportivo','Servicios'),
(7,'Entrenamiento Personal','Servicios'),
(8,'Clase Pilates','Clases'),
(9,'Membresía Anual','Membresía'),
(10,'Nutrición Deportiva','Servicios');

-- INSCRIPCION (10)  -> (cliente inscrito a productos)
INSERT INTO Inscripcion (idProducto, idCliente) VALUES
(1,1),(3,1),(4,1),
(2,2),(3,2),
(1,3),(8,3),
(9,4),
(5,5),
(7,6);

-- DISPONIBILIDAD (10) -> (producto disponible en sucursal)
INSERT INTO Disponibilidad (idSucursal, idProducto) VALUES
(3,1),
(3,3),
(4,4),
(9,8),
(4,10),
(1,1),
(2,2),
(10,9),
(5,5),
(6,6);

-- VISITAN (10) -> visitas con fechas (algunas dentro del último mes)
INSERT INTO Visitan (idSucursal, idCliente, fechaVisita) VALUES
(1,1, CURDATE() - INTERVAL 10 DAY),
(1,2, CURDATE() - INTERVAL 20 DAY),
(1,3, CURDATE() - INTERVAL 40 DAY),
(3,2, CURDATE() - INTERVAL 5 DAY),
(3,6, CURDATE() - INTERVAL 12 DAY),
(4,10, CURDATE() - INTERVAL 2 DAY),
(5,7, CURDATE() - INTERVAL 15 DAY),
(6,3, CURDATE() - INTERVAL 25 DAY),
(10,5, CURDATE() - INTERVAL 8 DAY),
(9,4, CURDATE() - INTERVAL 18 DAY);
