USE Tienda;

-- Índice para búsquedas frecuentes por precio
CREATE INDEX idx_productos_precio ON Productos(precio);

-- Índice para búsquedas por categoría
CREATE INDEX idx_productos_categoria ON Productos(categoria);

-- Índice para consultas de clientes activos
CREATE INDEX idx_clientes_activos ON Clientes(activo, fecha_ultima_compra);