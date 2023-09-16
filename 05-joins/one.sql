-- Seleccionar continentes que contengan "America" en su nombre o 
-- tengan un código de 3 o 5 y ordenarlos alfabéticamente.
SELECT * FROM continent
WHERE name LIKE '%America%'
UNION
SELECT * FROM continent 
WHERE code IN (3,5)
ORDER BY name ASC;

-- Listar países con sus respectivos continentes, ordenados 
-- alfabéticamente por continente.
SELECT 
  c.name AS continent, a.name AS country
FROM 
  country a, continent c
WHERE 
  a.continent = c.code
ORDER BY 
  c.name ASC;

-- Listar países con sus respectivos continentes utilizando una 
-- INNER JOIN, ordenados alfabéticamente por nombre de país.
SELECT 
	a.name AS country,
	c.name AS continent
FROM 
	country a
INNER JOIN 
	continent c ON a.continent = c.code
ORDER BY
	a.name ASC;
  
-- Reiniciar una secuencia y agregar nuevos continentes a la tabla "continent".
ALTER SEQUENCE continent_code_seq RESTART WITH 9;
INSERT INTO continent (name) 
VALUES 
  ('North Asia'),
	('Central Asia'),
	('South Asia');

-- Listar países con su continente correspondiente utilizando un 
-- FULL OUTER JOIN, ordenados alfabéticamente por nombre de país.
SELECT 
	c.name AS country, 
	c.continent AS "continentCode",
	b.name AS "continentName"
FROM
	country c
FULL OUTER JOIN continent b ON c.continent = b.code
ORDER BY c.name ASC;

-- Listar países con su continente correspondiente utilizando un 
-- RIGHT JOIN, excluyendo aquellos sin código de país y ordenados alfabéticamente por nombre de continente.
SELECT 
	c.name AS country, 
	c.continent AS "continentCode",
	b.name AS "continentName"
FROM
	country c
RIGHT JOIN continent b ON c.continent = b.code
WHERE c.code IS NULL
ORDER BY b.name ASC;

-- Objetivo: Contar la cantidad de países por continente utilizando un RIGHT JOIN
-- ordenados por cantidad de países en orden ascendente.
SELECT 
	COUNT(a.*) AS total, 
	b.name
FROM 
	country a
RIGHT JOIN 
	continent b ON a.continent = b.code
GROUP BY 
	b.name
ORDER BY 
	total ASC

-- Contar la cantidad de países por continente, excluyendo o incluyendo aquellos 
-- que contienen "America" en su nombre, ordenados por cantidad en orden ascendente.
(SELECT
	COUNT(a.*) as total,
	b.name as "continentName"
FROM country a
INNER JOIN 
	continent b ON a.continent = b.code
WHERE 
 	b.name NOT LIKE '%America%'
GROUP BY b.name)
UNION
(SELECT
	COUNT(*) as total,
	'America' AS "continentName"
FROM country a
INNER JOIN 
	continent b ON a.continent = b.code
WHERE 
 	b.name LIKE '%America%')
ORDER BY total ASC;

-- Encontrar el país con la mayor cantidad de ciudades y mostrar su nombre.
SELECT 
	COUNT(a.name) AS total, 
	b.name as "countryName"
FROM city a
INNER JOIN 
	country b ON a.countrycode = b.code 
GROUP BY "countryName"
ORDER BY total DESC
LIMIT 1;

-- Listar idiomas únicos y sus respectivos continentes, ordenados alfabéticamente por idioma.
SELECT 
	DISTINCT a.language,
	c.name AS continent 
FROM countrylanguage a
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
WHERE a.isofficial IS TRUE
ORDER BY a.language ASC;

-- Contar la cantidad de idiomas oficiales por continente y ordenar por cantidad en orden ascendente.
SELECT COUNT(continent) AS total, continent FROM (SELECT 
	DISTINCT a.language,
	c.name AS continent 
FROM countrylanguage a
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
WHERE a.isofficial IS TRUE
) AS totales
GROUP BY continent
ORDER BY total ASC

-- Listar idiomas oficiales y sus respectivos continentes, ordenados alfabéticamente por idioma.
SELECT 
	DISTINCT d.name,
	c.name AS continent 
FROM countrylanguage a
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
INNER JOIN language d ON a.languagecode = d.code
WHERE a.isofficial IS TRUE;