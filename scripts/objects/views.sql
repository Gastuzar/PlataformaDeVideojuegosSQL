USE PlataformaVideojuegos;

-- Vista 1: Usuarios y sus compras
DROP VIEW IF EXISTS vista_usuarios_compras;
CREATE OR REPLACE VIEW vista_usuarios_compras AS
SELECT 
    u.usuarioID, 
    u.nombreUsuario, 
    v.juegoID, 
    j.titulo AS tituloJuego, 
    v.fechaCompra, 
    v.precioCompra
FROM Usuarios u
JOIN Ventas v ON u.usuarioID = v.usuarioID
JOIN Videojuegos j ON v.juegoID = j.juegoID;

-- Vista 2: Resumen de ventas por videojuego
DROP VIEW IF EXISTS vista_resumen_ventas;
CREATE OR REPLACE VIEW vista_resumen_ventas AS
SELECT 
    j.juegoID, 
    j.titulo AS tituloJuego, 
    COUNT(v.ventasID) AS totalVentas, 
    SUM(v.precioCompra) AS ingresosTotales, 
    AVG(v.precioCompra) AS precioPromedio
FROM Ventas v
JOIN Videojuegos j ON v.juegoID = j.juegoID
GROUP BY j.juegoID, j.titulo;

-- Vista 3: Biblioteca de los Usuarios
DROP VIEW IF EXISTS vista_biblioteca_usuarios;
CREATE OR REPLACE VIEW vista_biblioteca_usuarios AS
SELECT 
    u.usuarioID, 
    u.nombreUsuario, 
    b.juegoID, 
    j.titulo AS tituloJuego, 
    b.fecha_de_adicion
FROM Usuarios u
JOIN Biblioteca b ON u.usuarioID = b.usuarioID
JOIN Videojuegos j ON b.juegoID = j.juegoID;

-- Vista 4: Mejores Videojuegos según las Reseñas
DROP VIEW IF EXISTS vista_mejores_videojuegos;
CREATE OR REPLACE VIEW vista_mejores_videojuegos AS
SELECT 
    j.juegoID, 
    j.titulo AS tituloJuego, 
    AVG(r.calificacion) AS calificacionPromedio,
    COUNT(r.reseñaID) AS totalReseñas
FROM Videojuegos j
JOIN Reseñas r ON j.juegoID = r.juegoID
GROUP BY j.juegoID, j.titulo
ORDER BY calificacionPromedio DESC;

-- Vista 5: Ventas por Tipo de Pago
DROP VIEW IF EXISTS vista_ventas_tipo_pago;
CREATE OR REPLACE VIEW vista_ventas_tipo_pago AS
SELECT 
    v.tipo_de_pago, 
    COUNT(v.ventasID) AS totalVentas, 
    SUM(v.precioCompra) AS ingresosTotales,
    AVG(v.precioCompra) AS precioPromedio
FROM Ventas v
GROUP BY v.tipo_de_pago;





