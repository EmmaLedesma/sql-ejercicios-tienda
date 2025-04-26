USE Tienda;

-- Primero añadimos columnas de ubicación
ALTER TABLE Clientes ADD COLUMN latitud DECIMAL(10, 8);
ALTER TABLE Clientes ADD COLUMN longitud DECIMAL(11, 8);

--Cconsulta para clientes dentro de un radio (ejemplo con coordenadas de Buenos Aires)
SELECT 
    id, 
    nombre,
    (6371 * ACOS(
        COS(RADIANS(-34.6037)) * COS(RADIANS(latitud)) * 
        COS(RADIANS(longitud) - RADIANS(-58.3816)) + 
        SIN(RADIANS(-34.6037)) * SIN(RADIANS(latitud))
    )) as distancia_km
FROM Clientes
HAVING distancia_km < 10 -- Dentro de 10km
ORDER BY distancia_km;