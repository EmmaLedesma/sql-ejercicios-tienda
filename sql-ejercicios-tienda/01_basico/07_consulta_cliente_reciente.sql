USE Tienda;

SELECT * FROM Clientes 
WHERE fecha_ultima_compra >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) 
AND activo = TRUE;