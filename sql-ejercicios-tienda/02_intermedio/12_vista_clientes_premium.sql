USE Tienda;

CREATE VIEW Clientes_Premium AS
SELECT c.id, c.nombre, SUM(p.precio * v.cantidad) as total_gastado
FROM Clientes c
JOIN Ventas v ON c.id = v.cliente_id
JOIN Productos p ON v.producto_id = p.id
GROUP BY c.id, c.nombre
HAVING total_gastado > 1000;