USE Tienda;

SELECT categoria, COUNT(*) as cantidad 
FROM Productos 
GROUP BY categoria;