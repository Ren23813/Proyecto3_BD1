import { useState, useEffect } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'

import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import ReportTable from './ReportTable'
import './ReportTable.css'
import './App.css'
import GenerateGraphic from './GraphsGenerator'

import {usePDF} from 'react-to-pdf'

function App() {
  const [title, setTitle] = useState("Select a Report");
  const [resultados, setResultados] = useState([]);
  const [opcion, setOpcion] = useState("reporte1")
  const [seccion, setSeccion] = useState(0);
  const [estudiante, setEstudiante] = useState(0);
  const [cursoid, setCursoid] = useState(0);
  const [limite, setLimite] = useState (0);
  const [aa, setAa] = useState (0);
  const [bb, setBb] = useState (0);
  const [cc, setCc] = useState (0);
  const [selectedInicio, setSelectedInicio] = useState(new Date('2023-01-01'));
  const [selectedFin, setSelectedFin] = useState(new Date('2025-12-12'));
  const { toPDF, targetRef } = usePDF({ filename: 'pagina.pdf' });
  const [modoPDF, setModoPDF] = useState(false);
  const [secciones, setSecciones] = useState([]);
  const [cursos, setCursos] = useState([]);
  const [estudiantes, setEstudiantes] = useState([]);
  const [profesor, setProfesor] = useState(0);
  const [profesores, setProfesores] = useState([]);
  const ciclos = [
  { valor: "2024-A", etiqueta: "2024-A" },
  { valor: "2024-B", etiqueta: "2024-B" },
  { valor: "2025-A", etiqueta: "2025-A" },
  { valor: "2025-B", etiqueta: "2025-B" },
  ];

  const porcentaje = [
  { valor: 0, etiqueta: "0%" },
  { valor: 25, etiqueta: "25%" },
  { valor: 50, etiqueta: "50%" },
  { valor: 75, etiqueta: "75%" },
  { valor: 100, etiqueta: "100%" },
  ];


  useEffect(() => {
    fetch("http://localhost:8080/db/secciones")
      .then((res) => res.json())
      .then((data) => setSecciones(data))
      .catch((err) => console.error("Error al cargar secciones:", err));
  }, []);

  useEffect(() => {
    fetch("http://localhost:8080/db/cursos")
      .then((res) => res.json())
      .then((data) => setCursos(data))
      .catch((err) => console.error("Error al cargar cursos:", err));
  }, []);

  useEffect(() => {
    fetch("http://localhost:8080/db/estudiantes")
      .then((res) => res.json())
      .then((data) => setEstudiantes(data))
      .catch((err) => console.error("Error al cargar cursos:", err));
  }, []);

  useEffect(() => {
    fetch("http://localhost:8080/db/profesores")
      .then((res) => res.json())
      .then((data) => setProfesores(data))
      .catch((err) => console.error("Error al cargar cursos:", err));
  }, []);


  //función para la exportación de datos json a csv
  const exportToCSV = (data, filename = 'reporte.csv') => {
    if (!data || !data.length) return;
  
    const replacer = (key, value) => value === null ? '' : value; 
    const header = Object.keys(data[0]);
    const csv = [
      header.join(','),
      ...data.map(row => header.map(field => JSON.stringify(row[field], replacer)).join(','))
    ].join('\r\n');
  
    // Descargar el archivo
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.setAttribute('download', filename);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  //HandlerReportes: función para llamar lod datos
  const handleReporte = async (titulo, endpoint, datos) =>{
    setTitle(titulo)

    try {
      const res = await fetch(`http://localhost:8080/db/${endpoint}`,{
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(datos),
      });

      if (!res.ok) {
        const errorText = await res.text();
        console.error("Error en el backend:", errorText);
        setResultados([]);
        return;
      }

      const json = await res.json();
      setResultados(json);

    }catch (err){
      console.error("Error de red:",err);
      setResultados([]);
    }
  };
  


  return (
  <div className= 'scaffold'>
            <div className='sidebar'>
                <button className='button' onClick={() => {
                  setOpcion("reporte1")
                  handleReporte("Promedio de los cursos", "avgNotasS", { seccion: 0, curso_id: 0, fecha_inicio: "2023-01-01", fecha_fin: "2026-01-01" })}}>
                  Promedio de los cursos
                </button>

                <button className='button' onClick={()=> {
                  setOpcion("reporte2")
                  handleReporte("Promedio de los estudiantes", "avgEstudiantesC", {estudiante_id: 0, curso_id: 0, fecha_inicio: "2023-01-01", fecha_fin: "2026-01-01"})}}>
                  Promedio de los estudiante
                </button>

                <button className='button' onClick={()=> {
                  setOpcion("reporte3")
                  handleReporte("Horas beca estudiantes", "repHorasB", {ciclo_inicio: "", ciclo_fin: "", min_horas: 0,min_porcentaje: 0})}}>
                  Horas beca estudiantes
                </button>
                
                <button className='button' onClick={()=> {
                  setOpcion("reporte4")
                  handleReporte("Actividades asignadas", "latestAct", {estudiante_id: 0,seccion_id: 0,fecha_limite: "2026-01-01",limite: 0 })}}>
                  Actividades asignadas
                </button>

                <button className='button' onClick={()=> {
                  setOpcion("reporte5")
                  handleReporte("Secciones de profesores", "avgSeccionP", {profesor_id: 0,curso_id: 0,fecha_inicio: "2023-01-01",fecha_fin: "2026-01-01"})}}>
                  Secciones de profesores
                </button>

                
            </div>
            <div className='report-area'>
                <h1 className='title'>{title}</h1>
                <div className='report-scaffold'>

                    {/* opciones de filtro que cambian */}
                    <div className= 'filters'>
                      {opcion === "reporte1" && 
                        (<div className='change'>

                          <label className='opcionTitle'>Filtrar por curso: </label>
                          <select className='selects' value = {cursoid} onChange={(e) => setCursoid(parseInt(e.target.value))}>
                            <option value={0}>Todos los cursos</option>
                          {cursos.map((s) => (
                            
                            <option key={s.id} value={s.id}>
                              {s.nombre}
                              
                              
                            </option>
                          ))}

                          </select>


                          <label className='opcionTitle'>Filtrar por sección:</label>
                          <select id = "seccion" className='selects' value = {seccion} onChange={(e) => setSeccion(parseInt(e.target.value))}>
                            <option value={0}>Todas las secciones</option>
                          {secciones.map((s) => (
                            
                            <option key={s.id} value={s.id}>
                              {s.id}
                              
                              
                            </option>
                          ))}

                          </select>

                          
                          <label className='opcionTitle'>Fecha inicio: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedInicio}
                            onChange={(date) => setSelectedInicio(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />

                          <label className='opcionTitle'>Fecha fin: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedFin}
                            onChange={(date) => setSelectedFin(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />
                          <button className='button small' onClick={()=> {
                            handleReporte("Promedio de los cursos", "avgNotasS", { seccion: seccion, curso_id: cursoid, fecha_inicio: selectedInicio, fecha_fin: selectedFin })}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                      
                      {opcion === "reporte2" && 
                        (<div className='change'>
              
                          
                          
                          <label className='opcionTitle'>Filtrar por curso: </label>
                          <select className='selects' value = {cursoid} onChange={(e) => setCursoid(parseInt(e.target.value))}>
                            <option value={0}>Todos los cursos</option>
                          {cursos.map((s) => (
                            
                            <option key={s.id} value={s.id}>
                              {s.nombre}
                              
                              
                            </option>
                          ))}

                          </select>

                          <label className='opcionTitle'>Filtrar por estudiante:</label>
                          <select className='selects' value = {estudiante} onChange={(e) => setEstudiante(parseInt(e.target.value))}>
                            <option value={0}>Todos los estudiantes</option>
                          {estudiantes.map((s) => (
                            
                            <option key={s.id} value={s.id}>
                              {s.nombre}
                              
                              
                            </option>
                          ))}

                          </select>


                        
                          <label className='opcionTitle'>Fecha inicio: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedInicio}
                            onChange={(date) => setSelectedInicio(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />

                          <label className='opcionTitle'>Fecha fin: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedFin}
                            onChange={(date) => setSelectedFin(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />

                          <button className='button small' onClick={()=> {
                            handleReporte("Promedio de los estudiantes", "avgEstudiantesC", {estudiante_id: estudiante, curso_id: cursoid, fecha_inicio: selectedInicio, fecha_fin: selectedFin})}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }
                      

                      {opcion === "reporte3" && 
                        (<div className='change'>
                          <label className='opcionTitle'>Ciclo de inicio: </label>
                          <select
                            className='selects'
                            value={bb}
                            onChange={(e) => setBb(e.target.value)}
                          >
                            <option value=""> </option>
                            {ciclos.map((opt) => (
                              <option key={opt.valor} value={opt.valor}>
                                {opt.etiqueta}
                              </option>
                            ))}
                          </select>

                        
                          <label className='opcionTitle'>Ciclo fin: </label>
                          <select
                            className='selects'
                            value={cc}
                            onChange={(e) => setCc(e.target.value)}
                          >
                            <option value=""> </option>
                            {ciclos.map((opt) => (
                              <option key={opt.valor} value={opt.valor}>
                                {opt.etiqueta}
                              </option>
                            ))}
                          </select>

                          
                        
                          
                          <label className='opcionTitle'>Porcentaje de beca: </label>
                   
                          <select
                            className='selects'
                            value={aa}
                            onChange={(e) => setAa(e.target.value)}
                          >
                            
                            {porcentaje.map((opt) => (
                              <option key={opt.valor} value={opt.valor}>
                                {opt.etiqueta}
                              </option>
                            ))}
                          </select>

                          <label className='opcionTitle'>Horas pendientes: </label>
                          <input className='inputs' type="number" value={limite} onChange={(e) => setLimite(parseInt(e.target.value))} />

                          <button className='button small' onClick={()=> {
                            handleReporte("Horas beca estudiantes", "repHorasB", {ciclo_inicio: bb, ciclo_fin: cc, min_horas: limite,min_porcentaje: parseInt(aa) || 0})}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                      {opcion === "reporte4" && 
                        (<div className='change'>
                  
                          <label className='opcionTitle'>Filtrar por sección:</label>
                          <select id = "seccion" className='selects' value = {seccion} onChange={(e) => setSeccion(parseInt(e.target.value))}>
                            <option value={0}> Todas las secciones</option>
                          {secciones.map((s) => (
                            
                            <option key={s.id} value={s.id}>
                              {s.seccion}
                              
                              
                            </option>
                          ))}

                          </select>

                          <label className='opcionTitle'>Filtrar por estudiante:</label>
                          <select className='selects' value = {estudiante} onChange={(e) => setEstudiante(parseInt(e.target.value))}>
                            <option value={0}>Todos los estudiantes</option>
                          {estudiantes.map((s) => (
                            
                            <option key={s.id} value={s.id}>
                              {s.nombre}
                              
                              
                            </option>
                          ))}

                          </select>

                          <label className='opcionTitle'>Fecha limite: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedFin}
                            onChange={(date) => setSelectedFin(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />
                          <label className='opcionTitle'>Limite de datos para mostrar: </label>
                          <input className='inputs' type="number" value={limite} onChange={(e) => setLimite(parseInt(e.target.value))} />
                          
                          

                          <button className='button small' onClick={()=> {
                            handleReporte("Actividades asignadas", "latestAct", {estudiante_id: estudiante,seccion_id: seccion,fecha_limite: selectedFin,limite: limite })}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                      


                      {/*opcion 5*/}
                      {opcion === "reporte5" && 
                        (<div className='change'>
                          <label className='opcionTitle'>Filtrar por profesor: </label>
                          <select className='selects' value = {profesor} onChange={(e) => setProfesor(parseInt(e.target.value))}>
                            <option value={0}>Todos los profesores</option>
                          {profesores.map((s) => (
                       
                            
                            <option key={s.id} value={s.id}>
                              {s.nombres}
                              
                              
                            </option>
                          ))}

                          </select>
                          <label className='opcionTitle'>Filtrar por curso: </label>
                          <select className='selects' value = {cursoid} onChange={(e) => setCursoid(parseInt(e.target.value))}>
                            <option value={0}>Todos los cursos</option>
                          {cursos.map((s) => (
                            
                            <option key={s.id} value={s.id}>
                              {s.nombre}
                              
                              
                            </option>
                          ))}

                          </select>
                         
                          <label className='opcionTitle'>Fecha inicio: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedInicio}
                            onChange={(date) => setSelectedInicio(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />

                          <label className='opcionTitle'>Fecha fin: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedFin}
                            onChange={(date) => setSelectedFin(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />

                          <button className='button small' onClick={()=> {
                            handleReporte("Secciones de profesores", "avgSeccionP", {profesor_id: profesor,curso_id: cursoid,fecha_inicio: selectedInicio,fecha_fin: selectedFin})}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                    </div>

                    <div className='results'>
                        <div className='topbar'>
                        <button className='button2' onClick={()=>GenerateGraphic(resultados)}>Generar Gráficas</button>
                        <button className='button2' 
                          onClick={() => {setModoPDF(true) 
                            setTimeout(() => {
                            toPDF(); 
                            setModoPDF(false); }, 200); }}
                        >Exportar como PDF</button>                        
                        <button className='button2' onClick={()=>exportToCSV(resultados)}>Exportar como CSV </button>
                      </div>
                        <div ref={targetRef}   style={{backgroundColor: 'white',padding: '20px',color: 'black'}}>
                            <ReportTable data={modoPDF ? resultados.slice(0, 125) : resultados} />                          
                        </div>
                    </div>

                </div>
                
            </div>
</div>
  )
}

export default App
