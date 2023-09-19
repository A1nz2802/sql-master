-- Crear una función que devuelve una tabla con información de países y sus regiones.
CREATE OR REPLACE FUNCTION country_region()
RETURNS TABLE (
	id CHARACTER(2), 
	name VARCHAR(40), 
	region VARCHAR(25)
)
AS $$
BEGIN
	RETURN QUERY
	SELECT
		country_id,
		country_name,
		region_name
	FROM countries
	INNER JOIN regions ON countries.region_id = regions.region_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM country_region();

-- Crear un procedimiento almacenado para insertar una nueva región en la base de datos.
CREATE OR REPLACE PROCEDURE insert_region_proc( INT, VARCHAR )
AS $$
BEGIN
	INSERT INTO regions (region_id, region_name)
	VALUES ( $1, $2 );
	
	RAISE NOTICE 'Variable 1: %', $1
	
	--ROLLBACK;
	COMMIT;
END;
$$ LANGUAGE plpgsql;

-- Llamar al procedimiento insert_region_proc para insertar una nueva región.
CALL insert_region_proc(5, 'Central America');

-- Crear un procedimiento almacenado para calcular 
-- y aplicar aumentos de salario controlados a empleados.
CREATE OR REPLACE PROCEDURE controlled_raise ( percentage NUMERIC ) AS $$
DECLARE
	real_percentage NUMERIC(8,2);
	raise_amount NUMERIC(8,2);
	total_employees INT;
BEGIN
	real_percentage := percentage / 100;
	
	-- Calcular el aumento máximo posible y almacenarlo en raise_amount.
	SELECT
		max_raise(employee_id) * real_percentage INTO raise_amount
	FROM employees;
	
	-- Insertar registros de aumento de salario en raise_history.
	INSERT INTO raise_history (date, employee_id, base_salary, amount, percentage)
	SELECT 
		CURRENT_DATE AS date,
		employee_id,
		salary,
		raise_amount,
		percentage
	FROM employees;
	
	-- Aplicar los aumentos de salario a los empleados.
	UPDATE employees
	SET salary = raise_amount + salary;
	
	COMMIT;
	
	-- Contar el número total de empleados afectados por el aumento.
	SELECT COUNT(*) INTO total_employees
	FROM employees;
	
	RAISE NOTICE 'Afectados % empleados', total_employees;

END;
$$ LANGUAGE 'plpgsql';

-- Llamar al procedimiento controlled_raise para aplicar aumentos de salario controlados.
CALL controlled_raise(1);
