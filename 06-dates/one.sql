-- https://www.postgresql.org/docs/8.1/functions-datetime.html
-- https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-date_part/

-- Obtener la fecha y hora actual, así como diversas partes de la fecha y hora actual.
SELECT 
	now(), 
	CURRENT_DATE, 
	CURRENT_TIME, 
	DATE_PART('hours', now()) AS hours, 
	DATE_PART('minutes', now()) AS minutes, 
	DATE_PART('seconds', now()) AS seconds, 
	DATE_PART('days', now()) AS days,
	DATE_PART('months', now()) AS months,
	DATE_PART('years', now()) AS years;

-- Obtener todos los registros de empleados contratados después del 5 de febrero 
-- de 1998 y ordenarlos por fecha de contratación en orden descendente.
SELECT * 
FROM employees
WHERE hire_date > '1998-02-05'
ORDER BY hire_date DESC;

-- Encontrar la fecha de contratación más reciente y la fecha de contratación más antigua en la tabla de empleados.
SELECT 
	MAX(hire_date) AS "mostNewEmployee",
	MIN(hire_date) AS "firstEmployee"
FROM employees;

-- Obtener todos los registros de empleados contratados entre el 1 de enero de 1999 y 
-- el 4 de enero de 2000 y ordenarlos por fecha de contratación en orden ascendente.
SELECT * FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '2000-01-04'
ORDER BY hire_date ASC;

-- Calcular varias fechas basadas en la fecha de contratación máxima en la tabla de empleados
SELECT 
	MAX(hire_date),
	MAX(hire_date) + INTERVAL '1 day' AS days,
	MAX(hire_date) + INTERVAL '1 month' AS months,
	MAX(hire_date) + INTERVAL '1 year' AS years,
	MAX(hire_date) + INTERVAL '1.1 years' AS "monthYears",
	DATE_PART('year', now()),
	MAKE_INTERVAL(YEARS := 23),
	MAKE_INTERVAL(YEARS := DATE_PART('year', now()):: INTEGER),
	MAX(hire_date) + MAKE_INTERVAL(YEARS := DATE_PART('year', now()):: INTEGER)
FROM employees

-- Calcular la diferencia en años entre el año actual y el año de 
-- contratación de los empleados, tanto de forma manual como mediante cálculos.
SELECT 
	hire_date,
	MAKE_INTERVAL( YEARS := 2023 - EXTRACT( YEARS FROM hire_date )::INTEGER ) AS manual,
	MAKE_INTERVAL( YEARS := DATE_PART('years', CURRENT_DATE)::INTEGER - EXTRACT( YEARS FROM hire_date )::INTEGER ) AS computed
FROM employees
ORDER BY hire_date DESC;

-- Actualizar la fecha de contratación de los empleados, sumando 23 años a cada fecha de contratación.
UPDATE employees
SET hire_date = hire_date + INTERVAL '23 years';

-- Clasificar a los empleados en diferentes rangos de antigüedad según su fecha de contratación.
SELECT 
	first_name,
	last_name, 
	hire_date,
	CASE
		WHEN hire_date > now() - INTERVAL '1 year' THEN '1 año o menos'
		WHEN hire_date > now() - INTERVAL '3 year' THEN '1 a 3 años'
		WHEN hire_date > now() - INTERVAL '6 year' THEN '3 a 6 años'
		ELSE '6 años a más'
	END AS "serviceRange"
FROM employees
ORDER BY hire_date DESC;