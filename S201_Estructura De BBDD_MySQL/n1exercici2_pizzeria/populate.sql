USE n1exercici2_pizzeria;

-- Insertar datos en la tabla provincia
INSERT INTO provincia (nombre) VALUES 
('Barcelona'), 
('Lleida'), 
('Girona'), 
('Tarragona');

-- Insertar datos en la tabla localidad
INSERT INTO localidad (nombre, provincia_id) VALUES 
('Barcelona', 1), 
('Badalona', 1), 
('Hospitalet de Llobregat', 1), 
('Guissona', 2), 
('Tàrrega', 2), 
('Blanes', 3),
('Cunit', 4), 
('Calafell', 4), 
('El Vendrell', 4);

-- Insertar datos en la tabla cliente
INSERT INTO cliente (nombre, apellidos, direccion, codigo_postal, localidad_id, telefono) VALUES 
('Carlos', 'García', 'Calle Mayor 5', '08001', 1, '600123456'), 
('Laura', 'Martínez', 'Avenida Diagonal 20', '08002', 1, '600234567'), 
('Miguel', 'López', 'Calle del Sol 15', '28001', 3, '600345678'), 
('Ana', 'Sánchez', 'Calle de la Luna 3', '46001', 4, '600456789'), 
('Sara', 'Pérez', 'Calle Nueva 7', '41001', 5, '600567890');

-- Insertar datos en la tabla tienda
INSERT INTO `tienda` (direccion, codigo_postal, localidad_id) VALUES 
('Avinguda Gran Vía 45', '08001', 1), 
('Carrer dels Malsons 12', '28001', 4), 
('Passeig Marítim 15', '46001', 6),
('Pujada del Castell', '94832', 8);

-- Insertar datos en la tabla trabajador
INSERT INTO trabajador (nombre, apellidos, nif, telefono, puesto, tienda_id) VALUES 
('Luis', 'Rodríguez', '12345678Z', '600678901', 'cocinero', 1), 
('Elena', 'Fernández', '87654321X', '600789012', 'repartidor', 1), 
('David', 'Gómez', '23456789Y', '600890123', 'cocinero', 2), 
('Laura', 'Ruiz', '34567890Z', '600901234', 'repartidor', 2), 
('Javier', 'Díaz', 'Y5678901X', '600012345', 'cocinero', 3),
('Maria José', 'De Los Amores', '12345678Y', '973544074', 'cocinero', 4), 
('Laura', 'Salas Dolores', 'M3421234Z', '973678434', 'repartidor', 4);

-- Insertar datos en la tabla categoriaPizza
INSERT INTO categoriaPizza (nombre) VALUES 
('Clásica'), 
('Vegetariana'), 
('Especial');

-- Insertar datos en la tabla producto
INSERT INTO producto (tipo, nombre, descripcion, imagen, precio, categoriaPizza_id) VALUES 
('pizza', 'Margarita', 'Pizza con tomate, mozzarella y albahaca', NULL, 7.50, 1), 
('pizza', 'Vegetal', 'Pizza con tomate, mozzarella, pimientos, y champiñones', NULL, 8.50, 2), 
('pizza', 'Barbacoa', 'Pizza con carne, barbacoa y mozzarella', NULL, 9.00, 3), 
('hamburguesa', 'Hamburguesa Clásica', 'Hamburguesa con queso y lechuga', NULL, 5.50, NULL), 
('bebida', 'Coca-Cola', 'Bebida refrescante', NULL, 1.50, NULL),
('bebida', 'Fanta', 'Bebida refrescante', NULL, 1.80, NULL),
('bebida', 'Cerveza', 'Solo para mayores de edad', NULL, 2.20, NULL);

-- Insertar datos en la tabla pedido
INSERT INTO pedido (fecha_hora, tipo, precio, cliente_id, tienda_id, trabajador_id, fecha_hora_entrega) VALUES 
('2024-08-17 12:30:00', 'reparto', 18.00, 1, 1, 2, '2024-08-20 13:00:00'), 
('2024-08-18 13:00:00', 'recogida', 9.00, 2, 1, NULL, NULL), 
('2024-08-20 14:00:00', 'reparto', 12.50, 3, 2, 4, '2024-08-20 14:30:00'), 
('2024-08-20 14:30:00', 'recogida', 7.50, 4, 2, NULL, NULL), 
('2024-08-20 15:00:00', 'reparto', 15.50, 5, 3, 5, '2024-08-20 15:30:00');

-- Insertar datos en la tabla detalle_pedido
INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad) VALUES 
(1, 1, 2), 
(1, 5, 2), 
(2, 3, 1), 
(3, 2, 1), 
(3, 4, 2), 
(4, 1, 1), 
(5, 3, 1), 
(5, 5, 3);

