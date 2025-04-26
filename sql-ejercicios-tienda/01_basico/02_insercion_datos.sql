USE Tienda;

-- Insertar productos
INSERT INTO Productos (nombre, precio, stock, categoria) VALUES
('Laptop', 25000.00, 10, 'Electrónicos'),
('Smartphone', 15000.00, 15, 'Electrónicos'),
('Tablet', 8000.00, 5, 'Electrónicos'),
('Camisa', 1200.00, 20, 'Ropa'),
('Zapatos', 3500.00, 8, 'Ropa');

-- Insertar clientes
INSERT INTO Clientes (nombre, email, fecha_ultima_compra, activo) VALUES
('Juan Pérez', 'juan@hotmail.com', '2023-05-15', TRUE),
('María García', 'maria@gmail.com', '2023-04-20', TRUE),
('Carlos López', 'carlos@live.com', '2022-12-10', FALSE);