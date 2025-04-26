USE Tienda;

CREATE TABLE Auditoria_Productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL,
    accion VARCHAR(10) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(50)
);

DELIMITER //
CREATE TRIGGER tr_auditoria_productos
BEFORE DELETE ON Productos
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Productos (producto_id, accion, usuario)
    VALUES (OLD.id, 'DELETE', CURRENT_USER());
END//
DELIMITER ;