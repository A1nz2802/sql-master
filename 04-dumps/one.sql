--* Crear de la tabla "continent" para almacenar continentes
CREATE TABLE continent (
	code SERIAL NOT NULL PRIMARY KEY,
	name text NOT NULL
)

--*
INSERT INTO continent (name)
	SELECT DISTINCT continent
	FROM country
	ORDER BY continent ASC

--*
INSERT INTO country_bk
	SELECT * FROM country

--*
ALTER TABLE country
DROP CONSTRAINT "country_continent_check"
	
UPDATE country a
SET continent = (
	SELECT code
	FROM continent b 
	WHERE b.name = a.continent
);

--*
ALTER TABLE country
ALTER COLUMN continent TYPE int4
USING continent::integer;

ALTER TABLE country
ADD CONSTRAINT "fk_continent"
FOREIGN KEY (continent)
REFERENCES continent (code)