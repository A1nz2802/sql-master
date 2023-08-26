-- Seleccionar usuarios con un número específico de seguidores
SELECT 
	first_name, last_name, followers 
FROM users
WHERE 
	followers BETWEEN 4600 AND 4700
ORDER BY followers ASC;


-- Obtener estadísticas generales sobre los seguidores de los usuarios.
SELECT 
  COUNT(*) AS total_users, 
  MIN(followers) AS min_followers, 
  MAX(followers) AS max_followers,
  ROUND(AVG(followers)) AS avg_followers
FROM users;

-- Contar y agrupar usuarios por cantidad específica de seguidores.
SELECT 
	COUNT(*), followers
FROM users
WHERE followers BETWEEN 4500 AND 4999
GROUP BY followers
ORDER BY followers ASC

-- Contar usuarios por país y filtrar aquellos con más de 5 usuarios.
SELECT COUNT(*), country
FROM users
GROUP BY
	country
HAVING 
	COUNT(*) > 5
ORDER BY
	COUNT(*) DESC;

-- Obtener una lista única de países en la tabla de usuarios.
SELECT DISTINCT country FROM users;

-- Extraer dominios de correo electrónico de la dirección de correo electrónico.
SELECT email, SUBSTRING(email, POSITION('@' IN email) + 1) AS domain
FROM users

-- Contar usuarios por dominio de correo electrónico con más de uno.
SELECT 
	COUNT(*),
	SUBSTRING(email, POSITION('@' IN email) + 1) AS domain
FROM users
GROUP BY domain
HAVING COUNT(*) > 1

-- Sumar el recuento total de usuarios por dominio de correo electrónico.
SELECT sum(total)
FROM (
	SELECT 
		COUNT(*) AS total,
		SUBSTRING(email, POSITION('@' IN email) + 1) AS domain
	FROM users
	GROUP BY domain
	HAVING COUNT(*) > 1
	ORDER BY domain ASC
) AS email_domain
