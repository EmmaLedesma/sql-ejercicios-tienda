USE Tienda;

SELECT * FROM Productos
WHERE id NOT IN (SELECT DISTINCT producto_id FROM Ventas);