--Debe crearse en una database llamada Proyecto3

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'lector_proyecto3') THEN
		CREATE ROLE lector_proyecto3 LOGIN PASSWORD 'mucha_chamba';
    END IF;
END $$;
GRANT CONNECT ON DATABASE "Proyecto3" TO lector_proyecto3;
GRANT USAGE ON SCHEMA public TO lector_proyecto3;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO lector_proyecto3;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO lector_proyecto3;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO lector_proyecto3;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO lector_proyecto3;


CREATE TABLE IF NOT EXISTS salones (id SERIAL PRIMARY KEY, edificio VARCHAR(50) NOT NULL, numero INT NOT NULL, capacidad INT NOT NULL);
CREATE TABLE IF NOT EXISTS estudiantes (id SERIAL PRIMARY KEY, nombre VARCHAR(250) NOT NULL, apellidos VARCHAR(250) NOT NULL, fecha_nacimiento DATE NOT NULL, correo VARCHAR(250) NOT NULL UNIQUE, fecha_ingreso DATE NOT NULL, fecha_egreso DATE);
CREATE TABLE IF NOT EXISTS cursos (id SERIAL PRIMARY KEY, nombre VARCHAR(250) NOT NULL, creditos INT);
CREATE TABLE IF NOT EXISTS profesores (id SERIAL PRIMARY KEY, nombres VARCHAR(300) NOT NULL, apellidos VARCHAR(300) NOT NULL, correo VARCHAR(255) NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS secciones (id SERIAL PRIMARY KEY, seccion INT NOT NULL, id_curso INT NOT NULL, CONSTRAINT fk_SeccionesCursos FOREIGN KEY (id_curso) REFERENCES cursos(id),id_profesor INT,CONSTRAINT fk_SeccionesProfesor FOREIGN KEY (id_profesor) REFERENCES profesores(id), ciclo VARCHAR(250));
CREATE TABLE IF NOT EXISTS apoyo_financiero (id SERIAL PRIMARY KEY, id_estudiante INT NOT NULL, CONSTRAINT fk_ApoyoEstudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id), porcentaje_beca INT NOT NULL, activo BOOLEAN NOT NULL);
CREATE TABLE IF NOT EXISTS horas_beca (id SERIAL PRIMARY KEY, id_apoyo INT NOT NULL, CONSTRAINT fk_HorasApoyo FOREIGN KEY (id_apoyo) REFERENCES apoyo_financiero(id), movimiento INT,descripcion VARCHAR(250), ciclo VARCHAR(50));

CREATE TABLE IF NOT EXISTS actividades (id SERIAL PRIMARY KEY, id_seccion INT NOT NULL, CONSTRAINT fk_ActividadesSeccion FOREIGN KEY (id_seccion) REFERENCES secciones(id), nombre VARCHAR(250) NOT NULL, descripcion VARCHAR(255), valorNeto NUMERIC(10,1), fechaEntrega DATE);
CREATE TABLE IF NOT EXISTS actividades_estudiantes (id SERIAL PRIMARY KEY, id_estudiante INT NOT NULL, CONSTRAINT fk_ActividadesEEstudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id), id_actividad INT NOT NULL, CONSTRAINT fk_ActividadesEActividad FOREIGN KEY (id_actividad) REFERENCES actividades(id), entregado BOOLEAN, valorRelativo NUMERIC(10,1) CHECK (valorRelativo >=0 AND valorRelativo <=100));
CREATE TABLE IF NOT EXISTS secciones_estudiantes (id SERIAL PRIMARY KEY, id_estudiante INT NOT NULL, CONSTRAINT fk_SeccionesEEStudiante FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),id_seccion INT NOT NULL, CONSTRAINT fk_SeccionesESeccion FOREIGN KEY (id_seccion) REFERENCES secciones(id), aprobado BOOLEAN DEFAULT FALSE);
CREATE TABLE IF NOT EXISTS horario (id SERIAL PRIMARY KEY, id_seccion INT NOT NULL, CONSTRAINT fk_HorarioSeccion FOREIGN KEY (id_seccion) REFERENCES secciones(id), id_salon INT NOT NULL, CONSTRAINT fk_HorarioSalon FOREIGN KEY (id_salon) REFERENCES salones(id), dia VARCHAR(50) NOT NULL, hora_inicio TIME NOT NULL CHECK (hora_inicio <= '20:00:00'), hora_fin TIME NOT NULL CHECK (hora_fin <= '21:00:00'),CHECK (hora_fin > hora_inicio), duracion TIME NOT NULL);


CREATE OR REPLACE FUNCTION calcular_duracionHorario()
RETURNS TRIGGER AS $$
BEGIN
    NEW.duracion := NEW.hora_fin - NEW.hora_inicio;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION autoInsert_ActividadesEstudiantes()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO actividades_estudiantes(id_estudiante, id_actividad, entregado, valorRelativo)
	SELECT id_estudiante, NEW.id, FALSE, NULL
	FROM secciones_estudiantes WHERE id_seccion = NEW.id_seccion;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION verificarHorarios()
RETURNS TRIGGER AS $$
BEGIN 
	IF EXISTS(
		SELECT 1
        FROM horario
        WHERE id_salon = NEW.id_salon
        AND dia = NEW.dia
        AND (
            (NEW.hora_inicio >= hora_inicio AND NEW.hora_inicio < hora_fin)
            OR (NEW.hora_fin > hora_inicio AND NEW.hora_fin <= hora_fin)
            OR (hora_inicio >= NEW.hora_inicio AND hora_inicio < NEW.hora_fin)
            OR (hora_fin > NEW.hora_inicio AND hora_fin <= NEW.hora_fin)
        )
    ) 
	THEN RAISE EXCEPTION 'El salón ya está ocupado en este horario.';
    END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS before_insert_horario ON horario;
CREATE TRIGGER before_insert_horario
BEFORE INSERT ON horario
FOR EACH ROW
EXECUTE FUNCTION calcular_duracionHorario();

DROP TRIGGER IF EXISTS after_insert_actividades ON actividades;
CREATE TRIGGER after_insert_actividades
AFTER INSERT ON actividades
FOR EACH ROW
EXECUTE FUNCTION autoInsert_ActividadesEstudiantes();

DROP TRIGGER IF EXISTS before_insert_horario2 ON horario;
CREATE TRIGGER before_insert_horario2
BEFORE INSERT ON horario
FOR EACH ROW
EXECUTE FUNCTION verificarHorarios();
