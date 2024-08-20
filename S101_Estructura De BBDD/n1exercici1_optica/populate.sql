USE n1_exercici1_optica;

-- Poblar la tabla direccion
INSERT INTO direccion (calle, numero, ciudad, codigo_postal, pais) VALUES
('Calle Falsa', 123, 'Ciudad A', '12345', 'España'),
('Av. Real', 456, 'Ciudad B', '54321', 'España'),
('Plaza Mayor', 789, 'Ciudad C', '67890', 'España'),
('Calle Luna', 101, 'Ciudad D', '09876', 'España'),
('Calle Sol', 202, 'Ciudad E', '11223', 'España');

-- Poblar la tabla proveedor
INSERT INTO proveedor (nombre, direccion_id, telefono, nif) VALUES
('Distribuidora Óptica S.A.', 1, 931234567, '12345678A'),
('Vision World Ltd.', 2, 937654321, '12345678B'),
('Opticas Unidas', 3, 911234576, '87654321X'),
('Lentes y Más', 4, 931234567, '11111111V'),
('Fashion Eyewear Inc.', 5, 973123456, '12312312D');

-- Poblar la tabla marca
INSERT INTO marca (nombre, proveedor_id) VALUES
('Ray-Ban', 1),
('Oakley', 1),
('Persol', 4),
('Gucci', 3),
('Prada', 3);

-- Poblar la tabla empleado
INSERT INTO empleado (nombre) VALUES
('Juan Pérez'),
('María López'),
('Carlos García'),
('Ana Martínez'),
('Luis Rodríguez');

INSERT INTO direccion (calle, numero, ciudad, codigo_postal, pais) VALUES
('Calle Cañadas', 333, 'Pueblo A', '11111', 'España'),
('Avenida del Sol', 101, 'Ciudad B', '22222', 'España'),
('Plaza Mayor', 12, 'Ciudad C', '33333', 'España'),
('Calle de la Luna', 45, 'Ciudad D', '44444', 'España'),
('Boulevard de los Sueños', 200, 'Ciudad E', '55555', 'España');

-- Poblar la tabla cliente
INSERT INTO cliente (nombre, direccionPostal_id, telefono, email, recomendadoPor_id) VALUES
('Miguel Torres', 1, '600111111', 'miguel.torres@gmail.com', NULL),
('Ana Belén', 2, '600222222', 'ana.belen@gmail.com', NULL),
('Roberto García', 3, '600333333', 'roberto.garcia@gmail.com', 1),
('Lucía Fernández', 4, '600444444', 'lucia.fernandez@gmail.com', NULL),
('Javier López', 5, '600555555', 'javier.lopez@gmail.com', 3);

-- Poblar la tabla gafas
INSERT INTO gafas (marca_id, montura, graduacion_derecho, graduacion_izquierdo, color_montura, color_derecho, color_izquierdo, precio) VALUES
(1, 'pasta', '0.25', '1.25', 'verde', 'rosa', 'rosa', 120.00),
(2, 'metalica', '1.50', '1.00', 'negro', 'azul', 'azul', 150.00),
(3, 'flotante', '2.00', '2.25', 'rojo', 'gris', 'gris', 200.00),
(4, 'flotante', '0.00', '0.50', 'marrón', 'verde', 'verde', 100.00),
(5, 'pasta', '1.75', '1.75', 'azul', 'morado', 'morado', 250.00);

-- Poblar la tabla venta
INSERT INTO venta (gafas_gafas_id, cliente_id, empleado_id) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 3, 1),
(4, 4, 3),
(5, 5, 5),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(1, 5, 1);

