--https://www.postgresql.org/docs/current/pgcrypto.html
-- Habilitar la extensión pgcrypto para utilizar funciones de cifrado.
CREATE EXTENSION pgcrypto;

-- Insertar un usuario con contraseña sin cifrar y otro con contraseña cifrada utilizando pgcrypto.
INSERT INTO "user" (username, password) VALUES ('a1nz', '123456')
INSERT INTO "user" (username, password) VALUES ('a1nzero', crypt('123456', gen_salt('bf')));

-- Verificar si un usuario con nombre de usuario y contraseña coincidentes existe en la base de datos.
SELECT COUNT(*) FROM "user"
WHERE username = 'a1nzero' AND password = CRYPT('123456', password);

-- Crear un procedimiento almacenado para realizar un inicio de sesión.
CREATE OR REPLACE PROCEDURE login(user_name VARCHAR, user_password VARCHAR) AS $$
DECLARE
	was_found BOOLEAN;
BEGIN
	SELECT 
		COUNT(*) INTO was_found 
	FROM "user"
	WHERE 
		username = user_name AND 
		password = CRYPT(user_password, password);
		
	IF (was_found = FALSE) THEN
		INSERT INTO session_failed (username, "when")
		VALUES (user_name, now());
		
		COMMIT;
		RAISE EXCEPTION 'Credentials are incorrect!';
	END IF;
		
	UPDATE "user"
	SET last_login = now()
	WHERE username = user_name;
	
	COMMIT;
	RAISE NOTICE 'User found %', was_found;
END;
$$ LANGUAGE plpgsql;

-- Llamar al procedimiento login con credenciales correctas e incorrectas.
CALL login('a1nzero','123456');
CALL login('a1nzeroo12','123456');

--https://www.postgresql.org/docs/current/sql-createtrigger.html
-- Crear un trigger que se activa después de actualizar la tabla "user" y registra la sesión del usuario.
CREATE OR REPLACE TRIGGER create_session_trigger AFTER UPDATE ON "user"
FOR EACH ROW EXECUTE FUNCTION create_session_log();

-- Crear una función que se utiliza en el disparador para registrar la sesión del usuario.
CREATE OR REPLACE FUNCTION create_session_log()
RETURNS TRIGGER AS $$
BEGIN

	INSERT INTO "session" (user_id, last_login)
	VALUES (NEW.id, now());
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Llamar al procedimiento login para actualizar la última sesión del usuario y verificar el registro de sesión.
CALL login('a1nzero','123456');
SELECT * FROM "session";

-- Crear un disparador (trigger) que se activa después de actualizar la tabla "user" si la última sesión cambió.
CREATE OR REPLACE TRIGGER create_session_trigger AFTER UPDATE ON "user"
FOR EACH ROW 
WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login)
EXECUTE FUNCTION create_session_log();

CREATE OR REPLACE FUNCTION create_session_log()
RETURNS TRIGGER AS $$
BEGIN

	INSERT INTO "session" (user_id, last_login)
	VALUES (NEW.id, now());
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

