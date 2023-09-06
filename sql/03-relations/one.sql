--* Eliminar un país específico con código 'NLD' y código 2 'NA' de la tabla 'country'
DELETE FROM country
WHERE code = 'NLD' AND code2 = 'NA'

--* Agregar una clave primaria a la columna 'code' en la tabla 'country'
ALTER TABLE country
ADD PRIMARY KEY (code)

--* Agregar una restricción CHECK para asegurarse de que 'surfacearea' sea mayor o igual a cero
ALTER TABLE country
ADD CHECK(surfacearea >=0)

--* Agregar una restricción CHECK para garantizar que 'continent' esté en una lista específica
ALTER TABLE country
ADD CHECK 
	(continent IN (
		'Asia', 
		'South America', 
		'North America', 
		'Oceania', 
		'Antarctica', 
		'Africa', 
		'Europe'
	));

--* Eliminar una restricción CHECK específica ('country_continent_check') de la tabla 'country'
--* y agregar una nueva que incluye 'Central America' en la lista permitida
ALTER TABLE country
DROP CONSTRAINT IF EXISTS country_continent_check;

ALTER TABLE country
ADD CHECK 
	(continent IN (
		'Asia', 
		'South America', 
		'North America', 
		'Oceania', 
		'Antarctica', 
		'Africa', 
		'Europe',
		'Central America'
	));

--* Crear un índice único llamado 'unique_country_name' en la columna 'name' de la tabla 'country'
CREATE UNIQUE INDEX "unique_country_name" ON country(name);

--* Seleccionar ciudades con nombre 'Jinzhou', código de país 'CHN' y distrito 'Liaoning' de la tabla 'city'
--* Crear un índice único en múltiples columnas de la tabla 'city
SELECT * FROM city
WHERE name = 'Jinzhou' AND countrycode = 'CHN' AND district = 'Liaoning'

CREATE UNIQUE INDEX 
	"unique_name_countrycode_district" ON city(name, countrycode, district);

--* Crear un índice en la columna 'district' de la tabla 'city'
CREATE INDEX 
	"index_district" ON city(district);

--* Agregar una restricción FOREIGN KEY para la columna 'countrycode' en la tabla 'city'
--* que referencia la columna 'code' en la tabla 'country'
INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');

ALTER TABLE city
ADD CONSTRAINT fk_countrycode
FOREIGN KEY (countrycode)
REFERENCES country (code)

--* Agregar una restricción FOREIGN KEY para la columna 'countrycode' en la tabla 'countrylanguage'
--* que referencia la columna 'code' en la tabla 'country'
ALTER TABLE countrylanguage
ADD CONSTRAINT fk_countrylanguage
FOREIGN KEY (countrycode)
REFERENCES country (code)

--* Elimina el país con código 'AFG' de la tabla 'country'
DELETE FROM country
WHERE code = 'AFG';

SELECT *
FROM country
WHERE code = 'AFG';

SELECT *
FROM city
WHERE
	countrycode = 'AFG';

SELECT *
FROM countrylanguage
WHERE countrycode = 'AFG';