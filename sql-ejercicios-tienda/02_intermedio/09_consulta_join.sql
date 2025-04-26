USE Tienda;

SELECT v.id, c.nombre as cliente, p.nombre as producto, v.cantidad, v.fecha_venta
FROM Ventas v
JOIN Clientes c ON v.cliente_id = c.id
JOIN Productos p ON v.producto_id = p.id;