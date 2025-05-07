package handlers

import (
	"database/sql"
	"encoding/json"
	"net/http"
	"proyecto3/backend/db"
	"proyecto3/backend/models"

	_ "github.com/lib/pq"
)

func AvgNotasSeccion(w http.ResponseWriter, r *http.Request) {
	var newStruct models.Struct1
	if err := json.NewDecoder(r.Body).Decode(&newStruct); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	query := `
	SELECT 
		c.nombre AS curso,
		s.seccion,
		COUNT(ae.id_estudiante) AS cantidad_alumnos,
		ROUND(AVG((ae.valorRelativo / 100.0) * a.valorNeto), 2) AS promedio_notas
	FROM 
		actividades_estudiantes ae
	JOIN actividades a ON ae.id_actividad = a.id
	JOIN secciones s ON a.id_seccion = s.id
	JOIN cursos c ON s.id_curso = c.id
	WHERE 
		s.seccion = $1
		AND c.id = $2
		AND a.fechaEntrega BETWEEN $3 AND $4
	GROUP BY c.nombre, s.seccion;
`

	rows, err := db.DB.Query(query, newStruct.Seccion, newStruct.CursoID, newStruct.FechaInicio, newStruct.FechaFin)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var resultados []models.ResultadoAvgNotasSeccion

	for rows.Next() {
		var r models.ResultadoAvgNotasSeccion
		if err := rows.Scan(&r.Curso, &r.Seccion, &r.CantidadAlumnos, &r.PromedioNotas); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		resultados = append(resultados, r)
	}

	if err := rows.Err(); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Devolver como JSON
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resultados)

}

func AvgEstudianteCurso(w http.ResponseWriter, r *http.Request) {
	var newStruct models.Struct2
	if err := json.NewDecoder(r.Body).Decode(&newStruct); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	var rows *sql.Rows
	var err error

	if newStruct.IsEmpty() {
		query := `
			SELECT 
				c.nombre AS curso,
				s.seccion,
				COUNT(ae.id_estudiante) AS cantidad_alumnos,
				ROUND(AVG((ae.valorRelativo / 100.0) * a.valorNeto), 2) AS promedio_notas
			FROM 
				actividades_estudiantes ae
			JOIN actividades a ON ae.id_actividad = a.id
			JOIN secciones s ON a.id_seccion = s.id
			JOIN cursos c ON s.id_curso = c.id
			GROUP BY c.nombre, s.seccion;
		`
		rows, err = db.DB.Query(query)
	} else {
		query := `
			SELECT 
				e.nombre || ' ' || e.apellidos AS estudiante,
				ROUND(AVG((ae.valorRelativo / 100.0) * a.valorNeto), 2) AS promedio,
				COUNT(DISTINCT s.id) AS cantidad_cursos,
				MIN(a.fechaEntrega) AS desde,
				MAX(a.fechaEntrega) AS hasta
			FROM 
				estudiantes e
			JOIN actividades_estudiantes ae ON e.id = ae.id_estudiante
			JOIN actividades a ON ae.id_actividad = a.id
			JOIN secciones s ON a.id_seccion = s.id
			WHERE 
				e.id = $1
				AND a.fechaEntrega BETWEEN $2 AND $3
				AND ae.entregado = true
				AND s.id_curso = $4
			GROUP BY e.nombre, e.apellidos;
		`

		rows, err := db.DB.Query(query, newStruct.EstudianteID, newStruct.FechaInicio, newStruct.FechaFin, newStruct.CursoID)
	}
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var resultados []models.ResultadoPromedioEstudiante

	for rows.Next() {
		var r models.ResultadoPromedioEstudiante
		if err := rows.Scan(&r.Estudiante, &r.Promedio, &r.CantidadCursos, &r.Desde, &r.Hasta); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		resultados = append(resultados, r)
	}

	if err := rows.Err(); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resultados)
}

func RepHorasbeca(w http.ResponseWriter, r *http.Request) {
	var newStruct models.Struct3
	if err := json.NewDecoder(r.Body).Decode(&newStruct); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	query := `
		SELECT 
			e.nombre || ' ' || e.apellidos AS estudiante,
			SUM(h.movimiento) AS total_horas,
			COUNT(*) AS cantidad_movimientos
		FROM 
			horas_beca h
		JOIN apoyo_financiero af ON h.id_apoyo = af.id
		JOIN estudiantes e ON af.id_estudiante = e.id
		WHERE 
			h.ciclo BETWEEN $1 AND $2
			AND h.movimiento >= $3
			AND af.porcentaje_beca >= $4
		GROUP BY e.nombre, e.apellidos;
	`

	rows, err := db.DB.Query(query, newStruct.CicloInicio, newStruct.CicloFin, newStruct.MinHoras, newStruct.MinPorcentaje)

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var resultados []models.ResultadoHorasBeca

	for rows.Next() {
		var r models.ResultadoHorasBeca
		if err := rows.Scan(&r.Estudiante, &r.TotalHoras, &r.CantidadMovimientos); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		resultados = append(resultados, r)
	}

	if err := rows.Err(); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Devolver como JSON
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resultados)
}

func LatestActivities(w http.ResponseWriter, r *http.Request) {
	var newStruct models.Struct4
	if err := json.NewDecoder(r.Body).Decode(&newStruct); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	query := `
		SELECT 
			e.nombre || ' ' || e.apellidos AS estudiante,
			a.nombre AS actividad,
			a.descripcion,
			a.valorNeto,
			a.fechaEntrega,
			s.seccion,
			c.nombre AS curso
		FROM 
			actividades_estudiantes ae
		JOIN actividades a ON ae.id_actividad = a.id
		JOIN secciones s ON a.id_seccion = s.id
		JOIN cursos c ON s.id_curso = c.id
		JOIN estudiantes e ON ae.id_estudiante = e.id
		WHERE 
			($1::int IS NULL OR e.id = $1)
			AND ($2::int IS NULL OR s.id = $2)
			AND ($3::date IS NULL OR a.fechaEntrega <= $3)
		ORDER BY a.fechaEntrega DESC
		LIMIT $4;
	`

	rows, err := db.DB.Query(query, newStruct.EstudianteID, newStruct.SeccionID, newStruct.FechaLimite, newStruct.Limite)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var resultados []models.ResultadoActividadReciente

	for rows.Next() {
		var r models.ResultadoActividadReciente
		if err := rows.Scan(&r.Estudiante, &r.Actividad, &r.Descripcion, &r.ValorNeto, &r.FechaEntrega, &r.Seccion, &r.Curso); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		resultados = append(resultados, r)
	}

	if err := rows.Err(); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Devolver como JSON
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resultados)
}

func AvgSeccionProfesor(w http.ResponseWriter, r *http.Request) {
	var newStruct models.Struct5
	if err := json.NewDecoder(r.Body).Decode(&newStruct); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	query := `
		SELECT 
			p.nombres || ' ' || p.apellidos AS profesor,
			c.nombre AS curso,
			s.seccion,
			ROUND(AVG((ae.valorRelativo / 100.0) * a.valorNeto), 2) AS promedio_seccion,
			COUNT(DISTINCT ae.id_estudiante) AS cantidad_estudiantes
		FROM 
			secciones s
		JOIN profesores p ON s.id_profesor = p.id
		JOIN cursos c ON s.id_curso = c.id
		JOIN actividades a ON a.id_seccion = s.id
		JOIN actividades_estudiantes ae ON ae.id_actividad = a.id
		WHERE 
			($1::int IS NULL OR p.id = $1)
			AND ($2::int IS NULL OR c.id = $2)
			AND a.fechaEntrega BETWEEN $3 AND $4
		GROUP BY p.nombres, p.apellidos, c.nombre, s.seccion
		ORDER BY p.apellidos, c.nombre, s.seccion;
	`

	rows, err := db.DB.Query(query, newStruct.ProfesorID, newStruct.CursoID, newStruct.FechaInicio, newStruct.FechaFin)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var resultados []models.ResultadoPromedioSeccionProfesor

	for rows.Next() {
		var r models.ResultadoPromedioSeccionProfesor
		if err := rows.Scan(&r.ProfesorNombre, &r.Curso, &r.Seccion, &r.PromedioNotas, &r.CantidadEstudiantes); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		resultados = append(resultados, r)
	}

	if err := rows.Err(); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Devolver como JSON
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resultados)
}
