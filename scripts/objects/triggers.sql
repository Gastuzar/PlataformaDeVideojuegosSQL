USE PlataformaVideojuegos;

-- Trigger: Ajustar precio de ventas con criptomoneda
DELIMITER //

DROP TRIGGER IF EXISTS ajustar_precio_venta //
CREATE TRIGGER ajustar_precio_venta
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
    IF NEW.tipo_de_pago = 'CRYPTOMONEDA' THEN
        SET NEW.precioCompra = NEW.precioCompra * 0.9;
    END IF;
END //

DELIMITER ;

-- Trigger para registrar cambios en el precio de un juego
DELIMITER //

CREATE TABLE IF NOT EXISTS AuditoriaCambioPrecios (
    auditoriaID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    juegoID INT NOT NULL,
    tituloJuego VARCHAR(100),
    precioAnterior DECIMAL(10, 2),
    precioNuevo DECIMAL(10, 2),
    fechaCambio DATETIME NOT NULL,
    usuarioResponsable VARCHAR(50)
);

DROP TRIGGER IF EXISTS registrar_cambio_precio //
CREATE TRIGGER registrar_cambio_precio
BEFORE UPDATE ON Videojuegos
FOR EACH ROW
BEGIN
    -- Verificar si el precio ha cambiado
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO AuditoriaCambioPrecios (
            juegoID, 
            tituloJuego, 
            precioAnterior, 
            precioNuevo, 
            fechaCambio, 
            usuarioResponsable
        )
        VALUES (
            OLD.juegoID, 
            OLD.titulo, 
            OLD.precio, 
            NEW.precio, 
            NOW(), 
            'Gaston' 
        );
    END IF;
END //

DELIMITER ;
