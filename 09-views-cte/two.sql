-- https://www.postgresql.org/docs/current/queries-with.html
-- Calcular estadísticas de publicaciones para el año 2024 con más de 600 aplausos.
WITH posts_week_2024 AS (
	SELECT 
		DATE_TRUNC('week', a.created_at) AS weeks,
		SUM(b.counter) AS total_claps,
		COUNT( DISTINCT a.post_id ) AS number_of_posts,
		COUNT(*) AS number_of_claps
	FROM posts a
	INNER JOIN claps b ON b.post_id = a.post_id
	GROUP BY weeks
	ORDER BY weeks DESC
)

SELECT * FROM posts_week_2024
WHERE weeks BETWEEN '2024-01-01' AND '2024-12-31' AND total_claps >= 600;

-- Obtener el total de aplausos por cada publicación del año 2023.
WITH claps_per_post AS (
	SELECT 
		post_id,
		SUM(counter)
	FROM claps
	GROUP BY post_id
), posts_from_2023 AS (
	SELECT *
	FROM posts
	WHERE created_at BETWEEN '2023-01-01' AND '2023-12-31'
)

SELECT * FROM claps_per_post
WHERE claps_per_post.post_id IN ( SELECT post_id FROM posts_from_2023 );

-- Crear una secuencia descendente desde 5 hasta 1.
WITH RECURSIVE countdown(val) AS (
		SELECT 5 AS val
	UNION
		SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT * FROM countdown;

-- Crear una secuencia ascendente desde 1 hasta 10.
WITH RECURSIVE counter(val) AS (
		SELECT 1 AS val
	UNION
		SELECT val + 1 FROM counter WHERE val < 10
)
SELECT * FROM counter;

-- Calcular la tabla de multiplicar del número 5 hasta 5 * 12.
WITH RECURSIVE multiplication_table(base, val, result) AS (
		SELECT 
			5 AS base, 
			1 AS val, 
			5*1 AS result
	UNION
		SELECT 
			5 AS base, 
			val + 1, 
			(val + 1) * base 
		FROM multiplication_table
		WHERE val < 12
)
SELECT * FROM multiplication_table;

-- Crear una jerarquía de jefes y subordinados con un límite de profundidad de 4.
WITH RECURSIVE bosses AS (
		SELECT id, name, reports_to, 1 AS depth
		FROM employees
		WHERE id = 1
	UNION
		SELECT employees.id, employees.name, employees.reports_to, depth + 1
		FROM employees
		INNER JOIN bosses ON bosses.id = employees.reports_to
		WHERE depth < 4
)
SELECT * FROM bosses;

-- Crear una jerarquía de jefes y subordinados con un límite de profundidad de 10 y 
-- mostrar los nombres de los jefes.
WITH RECURSIVE bosses AS (
		SELECT id, name, reports_to, 1 AS depth
		FROM employees
		WHERE id = 1
	UNION
		SELECT employees.id, employees.name, employees.reports_to, depth + 1
		FROM employees
		INNER JOIN bosses ON bosses.id = employees.reports_to
		WHERE depth < 10
)
SELECT 
	bosses.*, 
	employees.name AS reports_to_name 
FROM bosses
LEFT JOIN employees ON employees.id = bosses.reports_to
ORDER BY depth;

-- Obtener los seguidores y líderes de usuarios.
SELECT 
	followers.*,
	leader.name AS leader,
	follower.name AS follower
FROM followers
INNER JOIN "user" leader ON leader.id = followers.leader_id
INNER JOIN "user" follower ON follower.id = followers.follower_id

-- Obtener los seguidores de un líder específico (ID 1).
SELECT * FROM followers
WHERE leader_id IN (
	SELECT follower_id 
	FROM followers
	WHERE leader_id = 1
);
