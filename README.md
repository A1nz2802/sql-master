## Sección 1: Consultas y Bases de Datos

- **Creación de Tablas**: Ejemplos y explicación de cómo crear tablas en PostgreSQL.
- **Consultas SQL**: Consultas SELECT, INSERT, DELETE y UPDATE con ejemplos.
- **DROP y TRUNCATE**: Uso de DROP y TRUNCATE para eliminar tablas o datos.
- **Funciones y Operadores**: Uso de funciones como Substring, Position y Concat con ejemplos.
- **Constraints Básicos**: Aplicación de constraints en la creación de tablas.
- **Serial**: Explicación sobre el uso del tipo de dato SERIAL.

## Sección 2: Funciones de Agregación

- **Funciones de Agregación**: Uso de funciones como Count, Min, Max y Avg con ejemplos.
- **GROUP BY**: Agrupación de datos y cálculos de agregación.
- **Redondeo de Valores**: Uso de la función Round para redondear valores numéricos.
- **Filtrado con BETWEEN**: Cómo filtrar resultados dentro de rangos específicos.
- **Subconsultas (Subqueries)**: Ejemplos de su uso en consultas SQL.
- **Valores Únicos con DISTINCT**: Obtención de valores únicos de una columna.
- **Agrupación de Strings**: Cómo realizar agrupaciones por partes de strings.

## Sección 3: Relaciones y Restricciones en Bases de Datos

- **Relaciones de Bases de Datos**: Explicación sobre cómo las tablas se relacionan entre sí en una base de datos relacional.
- **Llaves Primarias (Primary Keys)**: Detalles sobre cómo definir y utilizar llaves primarias para garantizar la unicidad de los registros.
- **Llaves Candidatas (Candidate Keys)**: Exploración de las llaves candidatas y cómo seleccionar la llave primaria adecuada.
- **Llaves Externas (Foreign Keys)**: Uso de llaves foráneas para establecer relaciones entre tablas.
- **Restricciones de Columnas (Column Constraints)**: Implementación de restricciones en columnas para garantizar la integridad de los datos.
- **Restricciones de Tablas (Table Constraints)**: Aplicación de restricciones a nivel de tabla, como restricciones UNIQUE y CHECK.
- **Índices**: Explicación de cómo crear y utilizar índices para mejorar el rendimiento de las consultas.
- **Eliminaciones y Actualizaciones en Cascada**: Discusión sobre cómo funcionan las acciones automáticas de eliminación y actualización en cascada en las relaciones de bases de datos.
- **Otros Tipos de Acciones Automáticas**: Descripción de otras acciones automáticas, como RESTRICT y SET NULL, en el contexto de llaves foráneas.

## Sección 4: Mantenimiento y Operaciones en Bases de Datos

- **Actualizaciones Masivas**: Llevar a cabo actualizaciones en masa en una base de datos. Esto incluirá la modificación de múltiples registros al mismo tiempo, así como la optimización de consultas de actualización para evitar impactos negativos en el rendimiento.
- **Creación y Volcado de Información**: Crear nuevas tablas y cómo cargar información en ellas desde diversas fuentes. Esto es especialmente importante cuando se integra nueva información en una base de datos existente o se migra a una nueva plataforma.
- **Alteración de Índices y Checks**: Detallar la modificación de índices existentes para mejorar el rendimiento de las consultas y cómo ajustar restricciones CHECK para mantener la integridad de los datos en situaciones cambiantes.
- **Eliminación de Checks**: Explorar el proceso de eliminación de restricciones CHECK cuando ya no son necesarias o relevantes para la base de datos.

## Sección 5: Combinación de Tablas y Agregaciones

- **Joins**: Combinar tablas en consultas SQL utilizando INNER JOIN, LEFT JOIN y RIGHT JOIN.
- **Clausula UNION**: Uso de la cláusula UNION para combinar resultados de múltiples consultas en una sola tabla.
- **FULL OUTER JOIN**: Obtener todos los registros de ambas tablas, incluyendo aquellos que no tienen correspondencia en la otra tabla.
- **AGGREGACIONES + JOINS**: Funciones de agregación como COUNT, SUM y AVG en combinación con joins para realizar cálculos de resumen en conjuntos de datos relacionados.
- **Múltiples Joins**: Exploración de casos más avanzados que involucran múltiples joins en una sola consulta.

## Sección 6: Trabajo con Fechas

- **Tipo de Dato Date**: Introducción al tipo de dato Date en PostgreSQL, utilizado para mantener referencias a fechas y realizar cálculos relacionados con ellas.
- **Intervalos**: Aprender sobre los intervalos de tiempo y cómo se utilizan en PostgreSQL para calcular diferencias entre fechas, rangos de tiempo y más.
- **Generar Intervalos**: Cómo generar intervalos de tiempo personalizados y utilizarlos en consultas para realizar operaciones con fechas.
- **Operadores con Fechas**: Uso de operadores específicos para trabajar con fechas, como la comparación de fechas, suma y resta de intervalos, y más.
- **Funciones de Fechas**: Exploración de las funciones incorporadas de PostgreSQL para manipular y formatear fechas, como EXTRACT, DATE_TRUNC y TO_CHAR.
- **Cláusula CASE WHEN**: Cómo utilizar la cláusula CASE WHEN en combinación con fechas para realizar evaluaciones condicionales y transformaciones en consultas SQL.
- **Diferencia entre Fechas y Años**: Cálculos de diferencia entre fechas en días, meses, años, y cómo manejar la diferencia en años en casos específicos.
- **Extraer Segmentos de la Fecha**: Cómo extraer partes específicas de una fecha, como el año, mes o día, para realizar análisis y agrupaciones basadas en segmentos temporales.

## Sección 7: Generación de Identificadores Únicos

- **SERIAL**: Utilización del tipo de dato SERIAL para generar identificadores automáticamente y garantizar unicidad en las filas de una tabla.
- **Identity**: Uso del tipo de dato Identity para crear columnas con valores únicos generados automáticamente, proporcionando una alternativa a SERIAL.
- **Llave Primaria Compuesta**: Consideraciones sobre cómo definir y utilizar llaves primarias compuestas que constan de múltiples columnas para identificar de manera única las filas.
- **UUIDs**: Implementar identificadores únicos universales (UUIDs) para garantizar la unicidad global de registros en múltiples bases de datos y sistemas.
- **Secuencias Personalizadas**: Crear secuencias personalizadas para generar identificadores únicos con configuraciones específicas de inicio, incremento y otros atributos.

## Sección 8: Diseño de Bases de Datos y Diagramas E-R

- **Programas para Diseñar Bases de Datos**: Exploraremos diversas herramientas y programas que facilitan el diseño visual de bases de datos.
- **Exportar Diagramas a PostgreSQL y Otros**: Exportar los diagramas de entidad-relación (E-R) a PostgreSQL.
- **Estructuras**: Diseñaremos la estructura de la base de datos, incluyendo la creación de tablas y la definición de llaves primarias y foráneas.
- **Consultas Posibles**: Analizar consultas que se pueden realizar en función del diseño de la base de datos, lo que nos ayudará a optimizar la eficiencia y la velocidad de nuestras consultas.
- **Diversas Funcionalidades Necesarias**: Examinar otras funcionalidades esenciales, como la creación de índices y restricciones, que son cruciales para garantizar la integridad de los datos.
- **Buenas Prácticas y Estándares**: Discutir las buenas prácticas y los estándares en cuanto a nombres de tablas, vistas y otros elementos de la base de datos para mantener un diseño limpio y coherente.
- **Ejercicios Adicionales de Diseño de Bases de Datos**: Realizar ejercicios adicionales para practicar y reforzar el diseño de bases de datos.

## Sección 9: Vistas, Vistas Materializadas y Common Table Expressions (CTE)

- **Vistas**: Crear y utilizar vistas en PostgreSQL. Las vistas son consultas SQL predefinidas que se almacenan como objetos en la base de datos y proporcionan una forma de simplificar consultas complejas y reutilizar resultados.
- **Vistas Materializadas**: Explorar las vistas materializadas, que son una variante de las vistas tradicionales. A diferencia de las vistas normales, las vistas materializadas almacenan físicamente los resultados de las consultas, lo que las hace ideales para mejorar el rendimiento en consultas repetitivas.
- **Common Table Expressions (CTE)**: Comprender cómo utilizar CTE, que son consultas temporales que se definen en el contexto de una consulta principal. Las CTE son especialmente útiles para consultas recursivas y para dividir consultas complejas en partes más manejables.
- **CTE Recursivos**: Crear CTE recursivas, que son una forma poderosa de realizar consultas jerárquicas en bases de datos, utilizar CTE recursivos para problemas como la jerarquía de empleados o la búsqueda en árboles de datos.

## Sección 10: Funciones

- **Creación de Funciones**: Crear y reemplazar funciones en PostgreSQL para encapsular la lógica de negocios y reutilizar código.
- **Argumentos y Tipos**: Definir argumentos y especificar tipos de datos en las funciones para hacerlas flexibles y versátiles.
- **Almacenamiento de Datos**: Explorar el uso de variables en tus funciones para almacenar y manipular datos de manera efectiva.
- **Registros y Variables Compuestas**: Trabajar con registros completos o variables compuestas, manejar conjuntos de datos complejos.
- **Retorno de Valores**: Especificar el valor de retorno de una función y devolver datos resultantes.
- **Manejo de Excepciones**: Manejar excepciones y errores de manera controlada.
- **Condiciones y Control de Flujo**: Usar declaraciones condicionales y control de flujo para tomar decisiones lógicas y realizar acciones específicas.
- **Lenguaje plpgsql**: Todas las funciones que crearás en esta sección se basarán en el lenguaje plpgsql, un lenguaje estructurado que te permitirá crear funciones de manera efectiva.

## Sección 11: Procedimientos Almacenados

- **Escritura de Procedimientos Almacenados**: Escribir procedimientos almacenados en PostgreSQL y cómo se estructuran.
- **Sintaxis de Procedimientos**: Explorar la sintaxis necesaria para crear y ejecutar procedimientos almacenados.
- **Variables en Procedimientos**: Declarar y utilizar variables en procedimientos almacenados para el almacenamiento temporal de datos.
- **Argumentos en Procedimientos**: Comprender como pasar argumentos a los procedimientos almacenados para hacerlos flexibles y reutilizables.
- **Commit y Rollback**: Instrucciones COMMIT y ROLLBACK y cómo se utilizan para confirmar o deshacer las transacciones en procedimientos almacenados.
- **Raise Notice**: Uso de RAISE NOTICE para emitir mensajes informativos y depurar tus procedimientos almacenados.
- **Llamado de Funciones en Procedimientos**: Utilizar funciones dentro de procedimientos almacenados para reutilizar la lógica de negocio existente.

## Sección 12: Triggers

- **Disparadores (Triggers)**: Aprender cómo crear y utilizar disparadores en PostgreSQL. Descubrir cómo definir cuándo y cómo se deben ejecutar las acciones en respuesta a eventos en la base de datos.
- **Sintaxis de Disparadores**: Explorar la sintaxis necesaria para definir disparadores y las diferentes opciones disponibles para configurar su comportamiento.
- **Eventos Disparadores Comunes**: Ejemplos prácticos de eventos comunes que pueden desencadenar acciones automáticas en la base de datos, como la actualización de campos o la eliminación de registros.
- **Seguridad en PostgreSQL**: Instalar y utilizar una extensión para encriptar y validar contraseñas directamente en PostgreSQL, proporcionando una capa adicional de seguridad.
