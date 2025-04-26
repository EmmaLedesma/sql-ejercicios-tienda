USE Tienda;

SELECT 
    YEAR(fecha_venta) as año,
    MONTH(fecha_venta) as mes,
    SUM(p.precio * v.cantidad) as total_ventas
FROM Ventas v
JOIN Productos p ON v.producto_id = p.id
GROUP BY YEAR(fecha_venta), MONTH(fecha_venta)
ORDER BY año, mes;