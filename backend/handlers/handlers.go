package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"proyecto3/backend/db"
	"proyecto3/backend/models"
	"strings"

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
		`
	var filters []string
	var args []interface{}
	argIdx := 1

	if newStruct.Seccion > 0 {
		filters = append(filters, "s.seccion = $"+fmt.Sprint(argIdx))
		args = append(args, newStruct.Seccion)
		argIdx++
	}
	if newStruct.CursoID > 0 {
		filters = append(filters, "c.id = $"+fmt.Sprint(argIdx))
		args = append(args, newStruct.CursoID)
		argIdx++
	}
	if newStruct.FechaInicio != "2023-01-01" && newStruct.FechaFin != "2026-01-01" {
		filters = append(filters, fmt.Sprintf("a.fechaEntrega BETWEEN $%d AND $%d", argIdx, argIdx+1))
		args = append(args, newStruct.FechaInicio, newStruct.FechaFin)
		argIdx += 2
	}
	if len(filters) > 0 {
		query += " WHERE " + strings.Join(filters, " AND ")
	}
	query += " GROUP BY c.nombre, s.seccion;"

	rows, err := db.DB.Query(query, args...)
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
		`
	var filters []string
	var args []interface{}
	argIdx := 1

	if newStruct.FechaInicio != "2023-01-01" && newStruct.FechaFin != "2026-01-01" {
		filters = append(filters, fmt.Sprintf("a.fechaEntrega BETWEEN $%d AND $%d", argIdx, argIdx+1))
		args = append(args, newStruct.FechaInicio, newStruct.FechaFin)
		argIdx += 2
	}
	if newStruct.CursoID > 0 {
		filters = append(filters, "s.id_curso = $"+fmt.Sprint(argIdx))
		args = append(args, newStruct.CursoID)
		argIdx++
	}
	if newStruct.EstudianteID > 0 {
		filters = append(filters, "e.id = $"+fmt.Sprint(argIdx))
		args = append(args, newStruct.EstudianteID)
		argIdx++
	}
	if len(filters) > 0 {
		query += " WHERE " + strings.Join(filters, " AND ")
	}
	query += " GROUP BY e.nombre, e.apellidos;"

	rows, err := db.DB.Query(query, args...)
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
	`
	var filters []string
	var args []interface{}
	argIdx := 1

	if newStruct.CicloInicio != "" && newStruct.CicloFin != "" {
		filters = append(filters, fmt.Sprintf("h.ciclo BETWEEN $%d AND $%d", argIdx, argIdx+1))
		args = append(args, newStruct.CicloInicio, newStruct.CicloFin)
		argIdx += 2
	}
	if newStruct.MinHoras > 0 {
		filters = append(filters, "h.movimiento >= $"+fmt.Sprint(argIdx))
		args = append(args, newStruct.MinHoras)
		argIdx++
	}
	if newStruct.MinPorcentaje != "" {
		filters = append(filters, "af.porcentaje_beca = $"+fmt.Sprint(argIdx))
		args = append(args, newStruct.MinPorcentaje)
		argIdx++
	}
	if len(filters) > 0 {
		query += " WHERE " + strings.Join(filters, " AND ")
	}
	query += " GROUP BY e.nombre, e.apellidos;"

	rows, err := db.DB.Query(query, args...)

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

	baseQuery := `
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
	`
	whereClauses := []string{}
	args := []interface{}{}
	argIndex := 1

	if newStruct.EstudianteID > 0 {
		whereClauses = append(whereClauses, fmt.Sprintf("e.id = $%d", argIndex))
		args = append(args, newStruct.EstudianteID)
		argIndex++
	}
	if newStruct.SeccionID > 0 {
		whereClauses = append(whereClauses, fmt.Sprintf("s.id = $%d", argIndex))
		args = append(args, newStruct.SeccionID)
		argIndex++
	}
	if newStruct.FechaLimite != "2026-01-01" {
		whereClauses = append(whereClauses, fmt.Sprintf("a.fechaEntrega <= $%d", argIndex))
		args = append(args, newStruct.FechaLimite)
		argIndex++
	}

	if len(whereClauses) > 0 {
		baseQuery += " WHERE " + strings.Join(whereClauses, " AND ")
	}
	baseQuery += " ORDER BY a.fechaEntrega DESC"

	if newStruct.Limite > 0 {
		baseQuery += fmt.Sprintf(" LIMIT $%d", argIndex)
		args = append(args, newStruct.Limite)
	}

	rows, err := db.DB.Query(baseQuery, args...)
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

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resultados)
}

func AvgSeccionProfesor(w http.ResponseWriter, r *http.Request) {
	var newStruct models.Struct5
	if err := json.NewDecoder(r.Body).Decode(&newStruct); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	baseQuery := `
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
	`

	conditions := []string{}
	args := []interface{}{}
	argIdx := 1

	if newStruct.ProfesorID > 0 {
		conditions = append(conditions, fmt.Sprintf("p.id = $%d", argIdx))
		args = append(args, newStruct.ProfesorID)
		argIdx++
	}
	if newStruct.CursoID > 0 {
		conditions = append(conditions, fmt.Sprintf("c.id = $%d", argIdx))
		args = append(args, newStruct.CursoID)
		argIdx++
	}
	if newStruct.FechaInicio != "2026-01-01" && newStruct.FechaFin != "2026-01-01" {
		conditions = append(conditions, fmt.Sprintf("a.fechaEntrega BETWEEN $%d AND $%d", argIdx, argIdx+1))
		args = append(args, newStruct.FechaInicio, newStruct.FechaFin)
		argIdx += 2
	}

	if len(conditions) > 0 {
		baseQuery += " WHERE " + strings.Join(conditions, " AND ")
	}

	baseQuery += `
		GROUP BY p.nombres, p.apellidos, c.nombre, s.seccion
		ORDER BY p.apellidos, c.nombre, s.seccion;
	`

	rows, err := db.DB.Query(baseQuery, args...)
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

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resultados)
}
