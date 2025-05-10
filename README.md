# Proyecto3_BD1

📊 Generador de Reportes Académicos
Aplicación web desarrollada en React + Vite que permite generar, visualizar y exportar reportes académicos personalizados desde un backend realizado en Go, alimentado por una base de datos custom en PostgreSQL (levantada por Docker). Incluye sistema de filtros, exportación a CSV y PDF, así como visualización de gráficos.

🚀 Características
🎛️ Interfaz con filtros dinámicos según el tipo de reporte.

📈 Generación de gráficas a partir de los resultados.

🧾 Exportación a CSV y PDF (renderizado para impresión).

📅 Selección de fechas con react-datepicker.


📦 Tecnologías usadas:
React,
Vite,
Docker,
Postgres,
Go


Clonar el repositorio:

`git clone https://github.com/Ren23813/Proyecto3_BD1.git`

*🛠️ Instalación frontend*

Instalar dependencias:
`bun install`
Inicia el servidor de desarrollo:
`bun run dev`
La aplicación estará disponible en http://localhost:5173.
 
 
*📡 Conexión con el backend*

En carpeta de 'backend', ejecutar:

`go build`

`go run .`

🧠 Lógica del Backend – Handlers en Go
El backend de este proyecto está construido en Go y hace uso de múltiples handlers para procesar solicitudes HTTP, realizar consultas SQL a la base de datos PostgreSQL y devolver resultados en formato JSON.

Estos handlers están definidos en el paquete handlers/ y representan los endpoints clave del sistema:

Endpoints principales:
AvgNotasSeccion
Calcula el promedio de notas por sección y curso, con filtros opcionales como ID de sección, ID de curso y rango de fechas.

AvgEstudianteCurso
Muestra el promedio de notas de un estudiante en sus cursos, incluyendo la cantidad de cursos tomados y el rango de fechas.

RepHorasbeca
Genera un reporte de horas beca trabajadas por estudiante, filtrado por ciclos, mínimo de horas o porcentaje de beca.

LatestActivities
Lista las actividades más recientes de un estudiante, ordenadas por fecha, con posibilidad de limitar la cantidad de resultados y filtrar por sección o fecha límite.

AvgSeccionProfesor
Obtiene el promedio de notas por sección asignada a un profesor, considerando filtros por ID de profesor, ID de curso y fechas.

Características técnicas:
Cada handler:
Decodifica la solicitud HTTP en structs definidos en models/.
Construye consultas SQL dinámicamente según los filtros enviados.
Ejecuta la consulta usando db.DB.Query.
Devuelve la respuesta como JSON utilizando json.NewEncoder.
Las consultas usan JOINs entre múltiples tablas para combinar información de estudiantes, cursos, secciones, actividades, etc.

Se prioriza la seguridad con parámetros preparados ($1, $2, etc.) para prevenir inyecciones SQL.



🗄️ Base de Datos – PostgreSQL

Iniciarla con: 
`docker-compose up --build`

Detenerla con `Ctrl+C`

Este proyecto depende de una base de datos PostgreSQL llamada Proyecto3, que debe estar previamente creada (mediante inicialización con Docker). A continuación se describen los aspectos esenciales de su configuración:

🧾 Estructura general
La base de datos incluye las siguientes entidades principales:

estudiantes: Datos personales y académicos.

profesores y cursos.

secciones: Asignación de cursos a secciones, profesores y ciclos.

actividades y actividades_estudiantes: Registro de evaluaciones por curso y estudiante.

horario y salones: Control de horarios y espacios físicos.

apoyo_financiero y horas_beca: Registro del porcentaje de beca y horas trabajadas.

Todas las tablas incluyen relaciones con claves foráneas bien definidas para asegurar la integridad referencial.

🧠 Funciones y Triggers
calcular_duracionHorario: Calcula automáticamente la duración de una clase al insertar un horario.

autoInsert_ActividadesEstudiantes: Al crear una nueva actividad, asigna automáticamente registros a todos los estudiantes de la sección.

verificarHorarios: Previene la asignación de salones en horarios que se traslapan.

Estas funciones están asociadas a triggers que se ejecutan en los momentos apropiados (antes o después de insertar datos).

🔐 Rol de solo lectura
Se crea un rol lector_proyecto3 con los siguientes privilegios:

Solo lectura (SELECT) sobre todas las tablas y secuencias.

Puede conectarse a la base y usar el esquema public.