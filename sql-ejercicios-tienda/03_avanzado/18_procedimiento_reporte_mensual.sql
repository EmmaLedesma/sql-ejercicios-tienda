USE Tienda;

DELIMITER //
CREATE PROCEDURE GenerarReporteMensual(IN mes INT, IN año INT)
BEGIN
    -- Ventas por producto
    SELECT 
        p.nombre as producto,
        SUM(v.cantidad) as unidades,
        SUM(p.precio * v.cantidad) as total
    FROM Ventas v
    JOIN Productos p ON v.producto_id = p.id
    WHERE MONTH(v.fecha_venta) = mes AND YEAR(v.fecha_venta) = año
    GROUP BY p.id, p.nombre
    ORDER BY total DESC;
    
    -- Total general
    SELECT 
        SUM(p.precio * v.cantidad) as ventas_totales,
        COUNT(DISTINCT v.cliente_id) as clientes_unicos
    FROM Ventas v
    JOIN Productos p ON v.producto_id = p.id
    WHERE MONTH(v.fecha_venta) = mes AND YEAR(v.fecha_venta) = año;
END//
DELIMITER ;