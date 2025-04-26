USE Tienda;

SELECT 
    p.nombre,
    SUM(v.cantidad) as unidades_vendidas,
    RANK() OVER (ORDER BY SUM(v.cantidad) DESC) as ranking
FROM Productos p
JOIN Ventas v ON p.id = v.producto_id
GROUP BY p.id, p.nombre
ORDER BY unidades_vendidas DESC;