-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?
SELECT 
	COUNT(*) AS total,
	b.name AS language,
	a.languagecode AS "languageCode"
FROM countrylanguage a
INNER JOIN language b ON a.languagecode = b.code
INNER JOIN country c ON a.countrycode = c.code
INNER JOIN continent d ON c.continent = d.code
WHERE a.isofficial = true AND d.name = 'Europe'
GROUP BY b.name, a.languagecode
ORDER BY total DESC
LIMIT 1

-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)
SELECT * FROM country a 
INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE a.continent = 5 AND b.isofficial = true AND b.languagecode = 135








