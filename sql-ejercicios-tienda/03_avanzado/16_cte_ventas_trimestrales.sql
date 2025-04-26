USE Tienda;

WITH VentasTrimestrales AS (
    SELECT 
        YEAR(fecha_venta) as año,
        QUARTER(fecha_venta) as trimestre,
        SUM(p.precio * v.cantidad) as ventas_trimestre
    FROM Ventas v
    JOIN Productos p ON v.producto_id = p.id
    GROUP BY año, trimestre
)
SELECT 
    año,
    trimestre,
    ventas_trimestre,
    SUM(ventas_trimestre) OVER (PARTITION BY año ORDER BY trimestre) as ventas_acumuladas
FROM VentasTrimestrales
ORDER BY año, trimestre;