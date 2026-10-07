--Coderhouse Análisis de Datos--
--Alumna: Lucía Esmeralda Zito--
--Pre-entrega M5: Consultas con JOINs para el proyecto--
--Título: Cruzando tablas para enriquecer el análisis--

USE Ventas_Tech_DB;

--Primero actualizo la base de datos con tablas y columnas que están en mi proyecto--

-- 1. Tabla Territorios (dimensión geográfica)--
CREATE TABLE Territorios (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(100),
    pais VARCHAR(100),
    zona VARCHAR(100),
    ciudad VARCHAR(100),
    provincia VARCHAR(100)
);

-- 2. Agregar columnas a Clientes--
ALTER TABLE Clientes ADD segmento VARCHAR(50);
ALTER TABLE Clientes ADD id_territorio INT FOREIGN KEY REFERENCES Territorios(id_territorio);
ALTER TABLE Clientes ADD genero VARCHAR(20);
ALTER TABLE Clientes ADD rango_etario VARCHAR(30);
ALTER TABLE Clientes ADD edad INT;

-- 3. Agregar columnas a Productos
ALTER TABLE Productos ADD categoria VARCHAR(100);
ALTER TABLE Productos ADD subcategoria VARCHAR(100);
ALTER TABLE Productos ADD costo DECIMAL(12,2);

-- 4. Agregar columnas a Ventas
ALTER TABLE Ventas ADD total_venta DECIMAL(12,2);
ALTER TABLE Ventas ADD canal VARCHAR(50);

--Ahora cargo datos en la tabla nueva y en las columnas nuevas--

--1. Cargar datos a  Territorios --
INSERT INTO Territorios
    (id_territorio, region, pais, zona, ciudad, provincia)
    VALUES
    (1, 'Centro', 'Argentina', 'AMBA',       'Buenos Aires', 'Buenos Aires'),
    (2, 'Centro', 'Argentina', 'Centro',     'Córdoba',      'Córdoba'),
    (3, 'Centro', 'Argentina', 'Litoral',    'Rosario',      'Santa Fe'),
    (4, 'Cuyo',   'Argentina', 'Cuyo',       'Mendoza',      'Mendoza'),
    (5, 'Norte',  'Argentina', 'NOA',        'Tucumán',      'Tucumán');

--2. Actualizar datos de Clientes --
UPDATE Clientes
SET
    segmento = 'Premium',
    id_territorio = 1,
    genero = 'Femenino',
    rango_etario = '31-40',
    edad = 35
WHERE id_cliente = 1;

UPDATE Clientes
SET
    segmento = 'Estándar',
    id_territorio = 2,
    genero = 'Masculino',
    rango_etario = '41-50',
    edad = 45
WHERE id_cliente = 2;

UPDATE Clientes
SET
    segmento = 'Premium',
    id_territorio = 3,
    género = 'Femenino',
    rango_etario = '26-30',
    edad = 29
WHERE id_cliente = 3;

UPDATE Clientes
SET
    segmento = 'Estándar',
    id_territorio = 4,
    género = 'Masculino',
    rango_etario = '51-60',
    edad = 54
WHERE id_cliente = 4;

UPDATE Clientes
SET
    segmento = 'Premium',
    id_territorio = 5,
    género = 'Femenino',
    rango_etario = '31-40',
    edad = 38
WHERE id_cliente = 5;

--3. Actualizar datos de Productos --

UPDATE Productos
SET
    categoria = 'Computación',
    subcategoria = 'Laptops',
    costo = 850.00
WHERE id_producto = 1;

UPDATE Productos
SET
    categoria = 'Accesorios',
    subcategoria = 'Mouse',
    costo = 18.00
WHERE id_producto = 2;

UPDATE Productos
SET
    categoria = 'Computación',
    subcategoria = 'Monitores',
    costo = 320.00
WHERE id_producto = 3;

UPDATE Productos
SET
    categoria = 'Audio',
    subcategoria = 'Auriculares',
    costo = 75.00
WHERE id_producto = 4;

UPDATE Productos
SET
    categoria = 'Almacenamiento',
    subcategoria = 'SSD',
    costo = 85.00
WHERE id_producto = 5;

UPDATE Productos
SET
    categoria = 'Accesorios',
    subcategoria = 'Teclados',
    costo = 60.00
WHERE id_producto = 6;

-- 4. Calcular total de cada venta --

UPDATE Ventas
SET total_venta = cantidad * precio_unitario;

-- 5. Asignar Canal de Venta --

UPDATE Ventas
SET canal = 'Tienda física'
WHERE id_venta IN (1, 3, 5, 7, 9);

UPDATE Ventas
SET canal = 'Online'
WHERE id_venta IN (2, 4, 6, 8, 10);

-- 6. Validación-- 

SELECT * FROM Territorios;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;

--Consulta 1 — Vista base del proyecto (INNER JOIN)--

SELECT
    v.fecha_venta AS fecha,
    c.id_cliente,
    c.nombre AS cliente,
    p.nombre_producto AS producto,
    v.cantidad,
    v.precio_unitario,
    v.total_venta,
    c.segmento,
    p.categoria,
    p.subcategoria,
    t.region,
    t.provincia,
    t.ciudad,
    v.canal
FROM Ventas v
INNER JOIN Clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN Productos p
    ON v.id_producto = p.id_producto
INNER JOIN Territorios t
    ON c.id_territorio = t.id_territorio;

-- Consulta 2 — Clientes sin ventas (LEFT JOIN) --
SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM Clientes c
LEFT JOIN Ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- Consulta 3 — Productos sin ventas (LEFT JOIN) --
SELECT
    p.nombre_producto,
    p.categoria,
    p.precio
FROM Productos p
LEFT JOIN Ventas v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

-- Consulta 4 — Consolidado por canal (UNION ALL) --
SELECT canal, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Online' AS canal
    FROM Ventas WHERE fecha_venta BETWEEN '2024-03-05' AND '2024-03-10'
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Presencial' AS canal
    FROM Ventas WHERE fecha_venta BETWEEN '2024-03-11' AND '2024-03-15'
) AS consolidado
GROUP BY canal;
