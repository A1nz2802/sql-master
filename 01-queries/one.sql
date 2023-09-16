-- Crear una tabla de usuarios con nombre (hasta 10 caracteres) y edad
CREATE TABLE users (
  name VARCHAR(10) UNIQUE,
  age INTEGER
);

-- Cambiar el tipo de datos de la columna "name" a VARCHAR(100)
ALTER TABLE users 
ALTER COLUMN name SET DATA TYPE VARCHAR(100);

-- Insertar dos usuarios en la tabla
INSERT INTO users 
VALUES 
	('Jorge Mundaca', 22),
	('Manuel Perez', 32)

-- Actualizar el nombre de un usuario con edad 32
UPDATE users
SET name = 'Christopher Perez'
WHERE age = 32;

-- Insertar tres usuarios adicionales en la tabla
INSERT INTO 
	users 
VALUES 
	('Alonso Altamirano', 40),
	('Jorge Reyes', 15)
  ('Carlos Flores', 13);

-- LIMIT:  Limitar el número de registros a obtener
-- OFFSET: Saltar registros antes de obtener los resultados
SELECT * FROM users
LIMIT 2
OFFSET 2;

-- Eliminar registros donde el nombre comienza con "_orge"
DELETE FROM users
WHERE name LIKE '_orge%';

-- Eliminar la tabla de usuarios
DROP TABLE users;