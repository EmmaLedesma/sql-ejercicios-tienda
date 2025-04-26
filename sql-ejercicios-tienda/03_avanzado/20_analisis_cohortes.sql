USE Tienda;

WITH 
-- Identificar la primera compra de cada cliente
PrimeraCompra AS (
    SELECT 
        cliente_id,
        MIN(fecha_venta) as primera_fecha
    FROM Ventas
    GROUP BY cliente_id
),

-- Agrupar por cohorte (mes de primera compra)
Cohortes AS (
    SELECT
        cliente_id,
        DATE_FORMAT(primera_fecha, '%Y-%m-01') as cohorte
    FROM PrimeraCompra
),

-- Calcular actividad por mes
Actividad AS (
    SELECT
        c.cohorte,
        DATE_FORMAT(v.fecha_venta, '%Y-%m-01') as mes_actividad,
        COUNT(DISTINCT v.cliente_id) as clientes_activos
    FROM Ventas v
    JOIN Cohortes c ON v.cliente_id = c.cliente_id
    GROUP BY c.cohorte, mes_actividad
),

-- Tamaño de cada cohorte
TamanoCohorte AS (
    SELECT
        cohorte,
        COUNT(*) as tamano
    FROM Cohortes
    GROUP BY cohorte
)

-- Resultado final: retención por cohorte
SELECT
    a.cohorte,
    a.mes_actividad,
    TIMESTAMPDIFF(MONTH, a.cohorte, a.mes_actividad) as mes_numero,
    a.clientes_activos,
    t.tamano,
    (a.clientes_activos / t.tamano) * 100 as retencion_porcentaje
FROM Actividad a
JOIN TamanoCohorte t ON a.cohorte = t.cohorte
ORDER BY a.cohorte, a.mes_actividad;