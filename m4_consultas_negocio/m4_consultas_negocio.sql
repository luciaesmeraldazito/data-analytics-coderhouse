-- consulta 1: resumen ejecutivo mensual --
SELECT 
	MONTH(fecha_venta) as mes,
	SUM(cantidad * precio_unitario) as total_facturado,
	COUNT(*) as cantidad_de_pedidos,
	AVG(cantidad * precio_unitario) as ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

-- consulta 2: ranking de productos --
SELECT
	TOP 5 id_producto,
	SUM(cantidad * precio_unitario) as total_facturado,
	SUM(cantidad) as unidades_vendidas
FROM ventas
GROUP BY id_producto 
ORDER BY total_facturado DESC;

-- consulta 3: clientes recurrentes --
SELECT
	id_cliente,
	COUNT(*) as cantidad_de_pedidos,
	SUM(cantidad * precio_unitario) as total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- consulta 4: meses por encima/por debajo del promedio --
SELECT
	MONTH(fecha_venta) as mes,
	SUM(cantidad * precio_unitario) as total_facturado,
	CASE
		WHEN SUM(cantidad * precio_unitario) > (
		SELECT AVG(total_mes)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mes
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS sub 
		)THEN 'Por encima'
		ELSE 'Por debajo'
	END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);


-- comentarios: 3 hallazgos --
1. El producto ID#2 tuvo la mayor cantidad de ventas (13), mientras que el producto ID#1 representó la mayor facturación (3600).
2. El cliente ID#1 representó la mayor facturación entre todos los clientes, con un total gastado de 2640.
3. El mes de marzo estuvo por debajo de la facturación promedio mensual, con un total facturado de 6444.