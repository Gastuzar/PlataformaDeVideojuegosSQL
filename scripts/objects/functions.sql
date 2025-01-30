USE PlataformaVideojuegos;

-- Función: Calcular ingreso total de un usuario
DELIMITER //

DROP FUNCTION IF EXISTS calcular_ingreso_total_usuario //
CREATE FUNCTION calcular_ingreso_total_usuario(usuarioIDParam INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE ingreso_total DECIMAL(10, 2);
    SELECT SUM(precioCompra) INTO ingreso_total
    FROM Ventas
    WHERE usuarioID = usuarioIDParam;
    RETURN IFNULL(ingreso_total, 0);
END //

DELIMITER ;

-- Función: Obtener total de juegos en la biblioteca de un usuario
DELIMITER //

DROP FUNCTION IF EXISTS total_juegos_biblioteca_usuario //
CREATE FUNCTION total_juegos_biblioteca_usuario(usuarioIDParam INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalJuegos INT;
    SELECT COUNT(*) INTO totalJuegos
    FROM Biblioteca
    WHERE usuarioID = usuarioIDParam;
    RETURN totalJuegos;
END //

DELIMITER ;
