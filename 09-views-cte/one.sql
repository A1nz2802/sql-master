-- https://www.postgresql.org/docs/8.3/sql-alterview.html
-- Crear una vista que muestra el recuento de comentarios por 
-- semana junto con los aplausos totales.
CREATE OR REPLACE VIEW comments_per_week AS 
SELECT 
	DATE_TRUNC('week', a.created_at) AS weeks,
	COUNT( DISTINCT a.post_id ),
	SUM(b.counter) AS total_claps
FROM posts a
INNER JOIN claps b ON b.post_id = a.post_id
GROUP BY weeks
ORDER BY weeks DESC;

SELECT * FROM comments_per_week;

DROP VIEW comments_per_week;

-- Crear una vista materializada que muestra el recuento de comentarios 
-- por semana junto con los aplausos totales.
CREATE MATERIALIZED VIEW comments_per_week AS 
SELECT 
	DATE_TRUNC('week', a.created_at) AS weeks,
	COUNT( DISTINCT a.post_id ),
	SUM(b.counter) AS total_claps
FROM posts a
INNER JOIN claps b ON b.post_id = a.post_id
GROUP BY weeks
ORDER BY weeks DESC;

-- Actualizar la vista materializada con datos frescos.
REFRESH MATERIALIZED VIEW comments_per_week;

-- Cambiar el nombre de la vista materializada.
ALTER VIEW comments_per_week RENAME TO posts_per_week;

-- Cambiar el nombre de la vista materializada.
ALTER MATERIALIZED VIEW comments_per_week RENAME TO posts_per_week;