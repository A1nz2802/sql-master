-- Crear la tabla countryLanguage
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;

-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);

-- Empezar con el select para confirmar lo que vamos a actualizar
SELECT * FROM language

SELECT DISTINCT(language) 
FROM countrylanguage
ORDER BY language ASC

-- Actualizar todos los registros
INSERT INTO 
	language (name) 
SELECT DISTINCT(language) 
FROM countrylanguage
ORDER BY language ASC

UPDATE countrylanguage c
SET languagecode = (
	SELECT la.code 
	FROM language la
	WHERE la.name = c.language
)
-- Cambiar tipo de dato en countrylanguage - languagecode por int4
ALTER TABLE countrylanguage
ALTER COLUMN languagecode TYPE int4
USING languagecode::integer

-- Crear el forening key y constraints de no nulo el language_code
ALTER TABLE countrylanguage
ADD CONSTRAINT "fk_languagecode"
FOREIGN KEY (languagecode)
REFERENCES language (code)

ALTER TABLE countrylanguage
ALTER COLUMN languagecode SET NOT NULL

-- Revisar lo creado
SELECT * FROM countrylanguage
SELECT * FROM language