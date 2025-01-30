USE PlataformaVideojuegos;

-- Procedimiento: Registrar una nueva venta
DELIMITER //

DROP PROCEDURE IF EXISTS registrar_nueva_venta //
CREATE PROCEDURE registrar_nueva_venta(
    IN p_usuarioID INT, 
    IN p_juegoID INT, 
    IN p_precioCompra DECIMAL(10, 2), 
    IN p_tipoPago ENUM('DEBITO', 'CRYPTOMONEDA', 'CREDITO')
)
BEGIN
    INSERT INTO Ventas (usuarioID, juegoID, fechaCompra, precioCompra, tipo_de_pago)
    VALUES (p_usuarioID, p_juegoID, CURDATE(), p_precioCompra, p_tipoPago);
END //

DELIMITER ;

-- Procedimiento: Agregar juego a biblioteca de un usuario
DELIMITER //

DROP PROCEDURE IF EXISTS agregar_juego_a_biblioteca //
CREATE PROCEDURE agregar_juego_a_biblioteca(
    IN p_usuarioID INT,
    IN p_juegoID INT
)
BEGIN
    -- Verificar si el juego ya está en la biblioteca
    IF NOT EXISTS (
        SELECT 1 
        FROM Biblioteca 
        WHERE usuarioID = p_usuarioID AND juegoID = p_juegoID
    ) THEN
        -- Agregar el juego a la biblioteca
        INSERT INTO Biblioteca (usuarioID, juegoID, fecha_de_adicion)
        VALUES (p_usuarioID, p_juegoID, CURDATE());
    ELSE
        -- Error: el juego ya está en la biblioteca
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El juego ya está en la biblioteca del usuario';
    END IF;
END //

DELIMITER ;


