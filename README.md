# RetailPro — Proyecto de Data Analytics

Proyecto de análisis de ventas desarrollado en el marco de la formación en **Data Analytics de Coderhouse**. El objetivo es transformar los datos comerciales de RetailPro, una empresa ficticia, en información útil para analizar el desempeño del negocio y facilitar la toma de decisiones.

El proyecto utiliza una base de datos relacional que permite integrar información de distintas tablas y realizar consultas para explorar el desempeño comercial.

**Objetivo del proyecto**

Construir una base de datos relacional y realizar consultas analíticas para estudiar el comportamiento de las ventas, identificar tendencias y generar información relevante para el negocio.

El análisis se centra en las siguientes dimensiones:

- **Ventas:**      facturación, cantidades vendidas y evolución temporal.
- **Productos:**      desempeño por producto, categoría y subcategoría.
- **Clientes:**      segmentos de clientes y recurrencia de compra.
- **Territorios:**      distribución geográfica de las ventas.
- **Canales:**      comparación del desempeño comercial según el canal de venta.

**Herramientas y tecnologías**

- **Microsoft      SQL Server:** creación, consulta y análisis de bases de datos      relacionales.
- **SQL:**      manipulación de datos, consultas de agregación, funciones de agrupación y      combinación de tablas mediante JOIN.
- **Git y      GitHub:** control de versiones y documentación del proyecto.
- **Power      BI:** herramienta de visualización y análisis para el      desarrollo del dashboard del proyecto.

**Modelo de datos**

La base de datos Ventas_Tech_DB contiene las siguientes tablas principales:

| &#x20;&#x20;&#x20; |
| ------------------ |

**Tabla**

| &#x20;&#x20;&#x20; |
| ------------------ |

**Descripción**

| &#x20;&#x20;&#x20; |
| ------------------ |

Ventas

| &#x20;&#x20;&#x20; |
| ------------------ |

Registra   las transacciones comerciales, las cantidades, los importes y los canales de   venta.

| &#x20;&#x20;&#x20; |
| ------------------ |

Clientes

| &#x20;&#x20;&#x20; |
| ------------------ |

Contiene   información de los clientes y sus segmentos.

| &#x20;&#x20;&#x20; |
| ------------------ |

Productos

| &#x20;&#x20;&#x20; |
| ------------------ |

Contiene   los productos, sus categorías y subcategorías.

| &#x20;&#x20;&#x20; |
| ------------------ |

Territorios

| &#x20;&#x20;&#x20; |
| ------------------ |

Organiza   la información geográfica de las ventas.

Las tablas se relacionan mediante identificadores, lo que permite combinar la información comercial y analizar las ventas desde distintas perspectivas.

**Estructura del repositorio**

El repositorio reúne las entregas y los scripts SQL desarrollados durante el proyecto.

data-analytics-coderhouse/

               README.md

               Pipeline_ETL_Zito_Lucia

               Zito_Lucia_Checkpoint2.pbix

               m4_consultas_negocio

               m5_consultas_joins

               sql-checkpoint











Pipeline_ETL_Zito_Lucia: Archivo de PowerBI con los datos transformados.

Zito_Lucia_Checkpoint2.pbix: Archivo de BI con las relaciones entre tablas establecidas y la tabla de fechas creada.

m4_consultas_negocio: consulta de SQL con resultados sobre el resumen ejecutivo mensual de marzo, ranking de productos, clientes recurrentes, meses por encima/por debajo del promedio.

m5_consultas_joins: consulta de SQL con resultados sobre la vista base del proyecto y las ventas por canal.&#x20;

sql-checkpoint: creación de tablas, inserción de datos y validación.&#x20;

**Consultas y análisis realizados**

**1. Vista base de ventas con INNER JOIN**

Combina información de ventas, clientes, productos y territorios en una consulta. El resultado reúne datos comerciales, características de los clientes y ubicación geográfica para facilitar el análisis posterior.

**2. Resumen ejecutivo mensual**

Calcula la facturación, la cantidad de registros de venta y el ticket promedio por mes. Permite explorar la evolución de la actividad comercial.

**3. Ranking de productos**

Identifica los cinco productos con mayor facturación y calcula las unidades vendidas de cada uno. Permite comparar la contribución de los productos al ingreso total.

**4. Análisis de clientes recurrentes**

Identifica los clientes con más de una compra y calcula la cantidad de compras y el gasto acumulado de cada uno.

**5. Comparación con el promedio mensual**

Clasifica los meses según si su facturación está por encima o por debajo del promedio de facturación mensual calculado a partir de los datos.

**Cómo ejecutar los scripts SQL**

**Requisitos**

- Microsoft      SQL Server.
- SQL      Server Management Studio (SSMS) u otra herramienta compatible para      ejecutar consultas SQL.
- Una      copia local de este repositorio.

**Pasos&#x20;**

1.     Clonar el repositorio:

git clone [https://github.com/luciaesmeraldazito/data-analytics-coderhouse.git](https://github.com/luciaesmeraldazito/data-analytics-coderhouse.git)

1. Abrir      SQL Server Management Studio y conectarse a la instancia de SQL Server.
2. Ejecutar      primero los scripts que crean la base de datos, definen las tablas y      cargan los datos, si corresponden a la entrega.
3. Seleccionar      la base de datos Ventas_Tech_DB antes de ejecutar las      consultas que dependen de ella.
4. Abrir      el archivo m5_consultas_joins.sql y ejecutar las consultas      en el orden indicado en sus comentarios.
5. Para      los demás scripts analíticos, verificar sus dependencias y ejecutarlos una      vez que las tablas necesarias estén disponibles.

**Importante:** si los scripts dependen de tablas o datos creados previamente, es necesario ejecutar primero los archivos que preparan la estructura de la base de datos y cargan la información. Antes de ejecutar scripts que eliminen o recreen tablas, verificar sus efectos para evitar perder datos.

**Estado del proyecto**

El proyecto se encuentra en desarrollo. Las consultas SQL permiten integrar y analizar la información comercial. La etapa de visualización en Power BI se completará posteriormente.

---

*Proyecto académico realizado como parte de la formación en Data Analytics de Coderhouse.*
