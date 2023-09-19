-- https://www.postgresql.org/docs/current/sql-createfunction.html
-- Crear una función que salude a un empleado.
CREATE OR REPLACE FUNCTION greet_employee( employee_name VARCHAR )
RETURNS VARCHAR
AS $$
BEGIN
	RETURN 'Hello ' || employee_name;
END;
$$
LANGUAGE plpgsql;

-- Ejecutar la función greet_employee con un nombre específico.
SELECT greet_employee('a1nz');

-- Obtener el nombre de los empleados y su saludo personalizado.
SELECT first_name, greet_employee(first_name)
FROM employees;

-- Calcular el aumento máximo posible para un empleado
-- en función de su salario actual y el salario máximo de su puesto.
CREATE OR REPLACE FUNCTION max_raise( empl_id int )
RETURNS NUMERIC(8,2) AS $$
DECLARE
	possible_raise NUMERIC(8,2);
BEGIN
	SELECT 
		max_salary - salary INTO possible_raise
	FROM employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id
	WHERE employee_id = empl_id;
	
	RETURN possible_raise;
END;
$$ LANGUAGE plpgsql;

-- Calcular el aumento máximo posible para un empleado con manejo de valor negativo.
CREATE OR REPLACE FUNCTION max_raise_2( empl_id int )
RETURNS NUMERIC(8,2) AS $$
DECLARE
	employee_job_id INT;
	current_salary NUMERIC(8,2);
	job_max_salary NUMERIC(8,2);
	possible_raise NUMERIC(8,2);
BEGIN
  SELECT 
    job_id, salary
    INTO 
    employee_job_id, current_salary
  FROM employees
  WHERE employee_id = empl_id;

  SELECT max_salary INTO job_max_salary FROM jobs WHERE job_id = employee_job_id;

  possible_raise = job_max_salary - current_salary;
  
  IF ( possible_raise < 0) THEN
  	possible_raise = 0;
  END IF;

  RETURN possible_raise;
END;
$$ LANGUAGE plpgsql;

SELECT
	employee_id,
	first_name,
	salary,
	max_salary,
	max_salary - salary AS possible_raise,
	max_raise(employee_id),
	max_raise_2(employee_id)
FROM employees
INNER JOIN jobs ON jobs.job_id = employees.job_id;

-- Calcular el aumento máximo posible para un empleado y manejar excepciones.
CREATE OR REPLACE FUNCTION max_raise_3( empl_id int )
RETURNS NUMERIC(8,2) AS $$
DECLARE
	selected_employee employees % ROWTYPE;
	selected_job jobs % ROWTYPE;
	possible_raise NUMERIC(8,2);
BEGIN
  SELECT * FROM employees
  INTO selected_employee
  WHERE employee_id = empl_id;

  SELECT * FROM jobs 
  INTO selected_job
  WHERE job_id = selected_employee.job_id;

  possible_raise = selected_job.max_salary - selected_employee.salary;
  
  IF ( possible_raise < 0) THEN
  	RAISE EXCEPTION 'Employee with max salary: %, id: %', 
		selected_employee.first_name,
		selected_employee.employee_id;
  END IF;

  RETURN possible_raise;
END;
$$ LANGUAGE plpgsql;
