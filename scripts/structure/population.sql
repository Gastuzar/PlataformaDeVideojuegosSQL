-- INSERCIÓN DE DATOS

-- Inserción de Datos para la Tabla Desarrolladores
INSERT INTO Desarrolladores (nombreDesarrollador) VALUES
('Nintendo'),
('Sony Interactive Entertainment'),
('Electronic Arts'),
('Ubisoft'),
('Valve');

-- Inserción de Datos para la Tabla Videojuegos
INSERT INTO Videojuegos (titulo, desarrolladorID, fechaLanzamiento, precio) VALUES
('Super Mario Odyssey', 1, '2017-10-27', 59.99),
('The Last of Us Part II', 2, '2020-06-19', 69.99),
('FIFA 23', 3, '2022-09-30', 49.99),
('Assassin’s Creed Valhalla', 4, '2020-11-10', 39.99),
('Half-Life: Alyx', 5, '2020-03-23', 29.99);

-- Inserción de Datos para la Tabla  Usuarios
INSERT INTO Usuarios (nombreUsuario, email, password) VALUES
('GastonZarate', 'gastonzarate25@gmail.com', 'password123'),
('JulianZarate', 'julianzarate@gmail.com', 'password123'),
('CarlosDiaz', 'carlos.diaz@gmail.com', 'password123'),
('AnaGarcia', 'ana.garcia@gmail.com', 'password123'),
('CandeActis', 'Candeactis@gmail.com', 'password123');

-- Inserción de Datos para la Tabla Ventas
INSERT INTO Ventas (usuarioID, juegoID, fechaCompra, precioCompra, tipo_de_pago) VALUES
(1, 1, '2023-12-15', 59.99, 'CREDITO'),
(2, 2, '2023-12-10', 69.99, 'CRYPTOMONEDA'),
(3, 3, '2023-12-12', 44.99, 'DEBITO');

-- Inserción de Datos para la Tabla Reseñas
INSERT INTO Reseñas (usuarioID, juegoID, calificacion, comentario) VALUES
(1, 1, 5, 'Increíble experiencia, uno de los mejores juegos de Mario.'),
(2, 2, 4, 'Excelente historia, aunque el ritmo del juego fue algo lento.'),
(3, 3, 3, 'Buen juego, pero me gustaría que tuvieran más modos de juego.'),
(4, 4, 5, 'Gran mundo abierto, gráficos impresionantes.'),
(5, 5, 4, 'Un buen juego de realidad virtual, aunque podría tener más contenido.');

-- Inserción de Datos para la Tabla Biblioteca
INSERT INTO Biblioteca (usuarioID, juegoID, fecha_de_adicion) VALUES
(1, 1, '2023-11-01'),
(2, 2, '2023-11-05'),
(3, 3, '2023-11-10'),
(4, 4, '2023-11-15'),
(5, 5, '2023-11-20');

-- Inserción de Datos para la Tabla Generos
INSERT INTO Generos (nombreGenero) VALUES
('Aventura'),
('Acción'),
('Deportes'),
('RPG'),
('FPS');

-- Inserción de Datos para la Tabla Plataformas
INSERT INTO Plataformas (nombrePlataforma) VALUES
('PlayStation 5'),
('Xbox Series X'),
('Nintendo Switch'),
('PC'),
('Oculus VR');

-- Inserción de Datos para la Tabla Logros
INSERT INTO Logros (juegoID, nombreLogro, descripcion) VALUES
(1, 'Super Mario Master', 'Completa el 100% del juego.'),
(2, 'Vengador', 'Completa la historia principal.'),
(3, 'FIFA Champion', 'Gana la Copa del Mundo en FIFA 23.'),
(4, 'Viking King', 'Alcanza el nivel máximo en Assassin’s Creed Valhalla.'),
(5, 'Reality Hero', 'Supera todas las misiones en Half-Life: Alyx.');

-- Inserción de Datos para la Tabla Carrito
INSERT INTO Carrito (usuarioID, juegoID, cantidad) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 1),
(4, 5, 1),
(5, 4, 1);

-- Inserción de Datos para la Tabla BibliotecaJuegos
INSERT INTO BibliotecaJuegos (bibliotecaID, juegoID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserción de Datos para la Tabla VideojuegosGeneros
INSERT INTO VideojuegosGeneros (generoID, juegoID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Inserción de Datos para la Tabla VideojuegosPlataformas
INSERT INTO VideojuegosPlataformas (plataformaID, juegoID) VALUES
(1, 1),  -- PlayStation 5
(2, 2),  -- Xbox Series X
(3, 3),  -- Nintendo Switch
(4, 4),  -- PC
(5, 5);  -- Oculus VR

-- Inserción de Datos para la Tabla VentasJuegos
INSERT INTO VentasJuegos (ventasID, juegoID) VALUES
(1, 1), 
(2, 2), 
(3, 3);

-- Inserción de Datos para la Tabla UsuariosLogros
INSERT INTO UsuariosLogros (usuarioID, logroID, fechaDesbloqueo) VALUES
(1, 1, '2023-12-01'),
(2, 2, '2023-12-05'),
(3, 3, '2023-12-10'),
(4, 4, '2023-12-15'),
(5, 5, '2023-12-20');