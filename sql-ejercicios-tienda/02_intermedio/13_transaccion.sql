USE Tienda;

START TRANSACTION;

INSERT INTO Ventas (cliente_id, producto_id, cantidad, fecha_venta)
VALUES (1, 1, 1, CURDATE());

UPDATE Productos SET stock = stock - 1 WHERE id = 1;

COMMIT;