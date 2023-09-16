-- Seleccionar el ID, nombre en mayúsculas, nombre en minúsculas, longitud del nombre,
-- una constante calculada, una cadena concatenada y una cadena concatenada alternativa usando pipelines.
SELECT 
	id, UPPER(name) AS "upperName",
	LOWER(name) AS "lowerName",
	LENGTH(name),
	(20 * 2) AS constante,
	CONCAT('*', id, '-', name, '*'),
	'*' || id || '-' || name || '*' AS "concatPipeline"
FROM users

-- Obtener el primer nombre y apellido
SELECT 
	name AS "fullName",
	SUBSTRING(name, 0, POSITION(' ' IN name)) AS "firstName",
	SUBSTRING(name, POSITION(' ' IN name) + 1) AS "lastName"
FROM users

-- Agregar 2 nuevas columnas
ALTER TABLE users
ADD COLUMN first_name varchar(100) null, 
ADD COLUMN last_name varchar(100) null

-- Eliminar las columnas agregadas
ALTER TABLE users
DROP COLUMN first_name,
DROP COLUMN last_name

-- Actualizar la tabla agregando first_name y last_name
UPDATE users
SET first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
last_name = SUBSTRING(name, POSITION(' ' IN name) + 1)