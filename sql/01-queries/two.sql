-- Crear una tabla de usuarios con columnas "name" (VARCHAR(100)) y "age" (INTEGER)
CREATE TABLE users (
  name VARCHAR(100) UNIQUE,
  age INTEGER
);

-- Insertar tres usuarios adicionales en la tabla
INSERT INTO 
	users 
VALUES 
	('Alonso Altamirano', 40),
	('Jorge Reyes', 15)
  ('Carlos Flores', 13);

-- TRUNCATE: Eliminar todos los registros de la tabla sin modificar la estructura o eliminar la tabla
TRUNCATE TABLE users;