
--   Query 1
--   Listar nombre completo de clientes que han visitado
--   la sucursal "Sucursal Norte" en el último mes

SELECT DISTINCT
  CONCAT(c.nombre, ' ', c.apellidos) AS nombre_completo
FROM Visitan v
JOIN Sucursal s ON s.id = v.idSucursal
JOIN Cliente c ON c.id = v.idCliente
WHERE s.nombre = 'Sucursal Norte'
  AND v.fechaVisita >= CURRENT_DATE - INTERVAL 1 MONTH
ORDER BY nombre_completo
LIMIT 25;



--   Query 2
--   Mostrar cuántos clientes distintos han visitado
--   cada sucursal, ordenado de forma descendente

SELECT
  s.nombre AS sucursal,
  COUNT(DISTINCT v.idCliente) AS total_clientes
FROM Sucursal s
LEFT JOIN Visitan v ON v.idSucursal = s.id
GROUP BY s.id, s.nombre
ORDER BY total_clientes DESC;



--   Query 3
--   Productos disponibles en Medellín pero NO en Bogotá

SELECT p.nombre
FROM Producto p
JOIN Disponibilidad d ON d.idProducto = p.id
JOIN Sucursal s ON s.id = d.idSucursal
WHERE s.ciudad = 'Medellín'
  AND p.id NOT IN (
    SELECT p2.id
    FROM Producto p2
    JOIN Disponibilidad d2 ON d2.idProducto = p2.id
    JOIN Sucursal s2 ON s2.id = d2.idSucursal
    WHERE s2.ciudad = 'Bogotá'
  );


--   Query 4
--   Clientes inscritos en más de 2 productos

SELECT
  c.nombre,
  c.apellidos,
  COUNT(i.idProducto) AS total_productos
FROM Cliente c
JOIN Inscripcion i ON i.idCliente = c.id
GROUP BY c.id, c.nombre, c.apellidos
HAVING COUNT(i.idProducto) > 2;


--   Query 5
--   Para cada cliente, mostrar su última visita
--   y la sucursal. Si no ha visitado, mostrar "Sin visitas"

SELECT
  c.id,
  CONCAT(c.nombre, ' ', c.apellidos) AS nombre_completo,
  COALESCE(vu.fechaVisita, 'Sin visitas') AS ultima_visita,
  COALESCE(s.nombre, 'Sin visitas') AS sucursal
FROM Cliente c
LEFT JOIN (
  SELECT v1.idCliente, v1.idSucursal, v1.fechaVisita
  FROM Visitan v1
  JOIN (
    SELECT idCliente, MAX(fechaVisita) AS maxFecha
    FROM Visitan
    GROUP BY idCliente
  ) mx
    ON mx.idCliente = v1.idCliente
   AND mx.maxFecha = v1.fechaVisita
) vu ON vu.idCliente = c.id
LEFT JOIN Sucursal s ON s.id = vu.idSucursal
ORDER BY c.id;
