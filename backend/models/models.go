package models

type Struct1 struct {
	Seccion     int    `json:"seccion"`
	CursoID     int    `json:"curso_id"`
	FechaInicio string `json:"fecha_inicio"`
	FechaFin    string `json:"fecha_fin"`
}

type Struct2 struct {
	EstudianteID int    `json:"estudiante_id"`
	CursoID      int    `json:"curso_id"`
	FechaInicio  string `json:"fecha_inicio"`
	FechaFin     string `json:"fecha_fin"`
}

type Struct3 struct {
	CicloInicio   string `json:"ciclo_inicio"`
	CicloFin      string `json:"ciclo_fin"`
	MinHoras      int    `json:"min_horas"`
	MinPorcentaje string `json:"min_porcentaje"`
}

type Struct4 struct {
	EstudianteID int    `json:"estudiante_id"`
	SeccionID    int    `json:"seccion_id"`
	FechaLimite  string `json:"fecha_limite"`
	Limite       int    `json:"limite"`
}

type Struct5 struct {
	ProfesorID  int    `json:"profesor_id"`
	CursoID     int    `json:"curso_id"`
	FechaInicio string `json:"fecha_inicio"`
	FechaFin    string `json:"fecha_fin"`
}

type ResultadoAvgNotasSeccion struct {
	Curso           string  `json:"curso"`
	Seccion         int     `json:"seccion"`
	CantidadAlumnos int     `json:"cantidad_alumnos"`
	PromedioNotas   float64 `json:"promedio_notas"`
}

type ResultadoPromedioEstudiante struct {
	Estudiante     string  `json:"estudiante"`
	Promedio       float64 `json:"promedio"`
	CantidadCursos int     `json:"cantidad_cursos"`
	Desde          string  `json:"desde"`
	Hasta          string  `json:"hasta"`
}

type ResultadoHorasBeca struct {
	Estudiante          string `json:"estudiante"`
	TotalHoras          int    `json:"total_horas"`
	CantidadMovimientos int    `json:"cantidad_movimientos"`
}

type ResultadoActividadReciente struct {
	Estudiante   string  `json:"estudiante"`
	Actividad    string  `json:"actividad"`
	Descripcion  string  `json:"descripcion"`
	ValorNeto    float64 `json:"valor_neto"`
	FechaEntrega string  `json:"fecha_entrega"`
	Seccion      int     `json:"seccion"`
	Curso        string  `json:"curso"`
}

type ResultadoPromedioSeccionProfesor struct {
	ProfesorNombre      string  `json:"profesor_nombre"`
	Curso               string  `json:"curso"`
	Seccion             int     `json:"seccion"`
	PromedioNotas       float64 `json:"promedio_notas"`
	CantidadEstudiantes int     `json:"cantidad_estudiantes"`
}
