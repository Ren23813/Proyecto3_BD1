import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'

import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import ReportTable from './ReportTable'
import './ReportTable.css'
import './App.css'

import {usePDF} from 'react-to-pdf'

function App() {
  const [title, setTitle] = useState("Select a Report");
  const [resultados, setResultados] = useState([]);
  const [opcion, setOpcion] = useState("reporte1")
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [seccion, setSeccion] = useState(0);
  const [cursoid, setCursoid] = useState(0);
  const [limite, setLimite] = useState (0);
  const [aa, setAa] = useState (0);
  const [bb, setBb] = useState (0);
  const [cc, setCc] = useState (0);
  const [selectedInicio, setSelectedInicio] = useState(new Date());
  const [selectedFin, setSelectedFin] = useState(new Date());
  const { toPDF, targetRef } = usePDF({ filename: 'pagina.pdf' });


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
                  handleReporte("Reporte 1", "avgNotasS", { seccion: 11, curso_id: 2, fecha_inicio: "2020-01-01", fecha_fin: "2025-02-02" })}}>
                  Reporte 1
                </button>

                <button className='button' onClick={()=> {
                  setOpcion("reporte2")
                  handleReporte("Reporte 2", "avgEstudiantesC", {estudiante_id: 1, curso_id: 1, fecha_inicio: "2020-01-01", fecha_fin: "2025-02-02"})}}>
                  Reporte 2
                </button>

                <button className='button' onClick={()=> {
                  setOpcion("reporte3")
                  handleReporte("Reporte 3", "repHorasB", {ciclo_inicio: "2024-A", ciclo_fin: "2024-A", min_horas: 2,min_porcentaje: "50"})}}>
                  Reporte 3
                </button>
                
                <button className='button' onClick={()=> {
                  setOpcion("reporte4")
                  handleReporte("Reporte 4", "latestAct", {estudiante_id: 2,seccion_id: 2,fecha_limite: "2025-02-02",limite: 2 })}}>
                  Reporte 4
                </button>

                <button className='button' onClick={()=> {
                  setOpcion("reporte5")
                  handleReporte("Reporte 5", "avgSeccionP", {profesor_id: 2,curso_id: 2,fecha_inicio: "2025-02-02",fecha_fin: "2025-02-02"})}}>
                  Reporte 5
                </button>

                
            </div>
            <div className='report-area'>
                <h1 className='title'>{title}</h1>
                <div className='report-scaffold'>

                    {/* opciones de filtro que cambian */}
                    <div className= 'filters'>
                      {opcion === "reporte1" && 
                        (<div className='change'>
                          <label className='opcionTitle'>Sección:</label>
                          <input className='inputs' type="number" value={seccion} onChange={(e) => setSeccion(parseInt(e.target.value))} />
                          <label className='opcionTitle'>Curso id: </label>
                          <input className='inputs' type="number" value={cursoid} onChange={(e) => setCursoid(parseInt(e.target.value))} />
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
                            handleReporte("Reporte 1", "avgNotasS", { seccion: seccion, curso_id: cursoid, fecha_inicio: selectedInicio, fecha_fin: selectedFin })}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                      
                      {opcion === "reporte2" && 
                        (<div className='change'>
                          <label className='opcionTitle'>Estudiante id:</label>
                          <input className='inputs' type="number" value={seccion} onChange={(e) => setSeccion(parseInt(e.target.value))} />
                          <label className='opcionTitle'>Curso id: </label>
                          <input className='inputs' type="number" value={cursoid} onChange={(e) => setCursoid(parseInt(e.target.value))} />
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
                            handleReporte("Reporte 2", "avgEstudiantesC", {estudiante_id: seccion, curso_id: cursoid, fecha_inicio: selectedInicio, fecha_fin: selectedFin})}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }
                      

                      {opcion === "reporte3" && 
                        (<div className='change'>
                          <label className='opcionTitle'>Ciclo inicio:</label>
                          <input className='inputs' type="text" value={bb} onChange={(e) => setBb(e.target.value)} />
                          <label className='opcionTitle'>Ciclo fin: </label>
                          <input className='inputs' type="text" value={cc} onChange={(e) => setCc(e.target.value)} />
                          
                          <label className='opcionTitle'>Min horas: </label>
                          <input className='inputs' type="number" value={limite} onChange={(e) => setLimite(parseInt(e.target.value))} />
                          
                          <label className='opcionTitle'>Porcentaje: </label>
                          <input className='inputs' type="text" value={aa} onChange={(e) => setAa(e.target.value)} />

                          <button className='button small' onClick={()=> {
                            handleReporte("Reporte 3", "repHorasB", {ciclo_inicio: bb, ciclo_fin: cc, min_horas: limite,min_porcentaje: aa})}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                      {opcion === "reporte4" && 
                        (<div className='change'>
                          <label className='opcionTitle'>Estudiante id:</label>
                          <input className='inputs' type="number" value={seccion} onChange={(e) => setSeccion(parseInt(e.target.value))} />
                          <label className='opcionTitle'>Seccion id: </label>
                          <input className='inputs' type="number" value={cursoid} onChange={(e) => setCursoid(parseInt(e.target.value))} />
           
                          
          

                          <label className='opcionTitle'>Fecha limite: </label>
                          
                          <DatePicker
                            className='inputs'
                            selected={selectedFin}
                            onChange={(date) => setSelectedFin(date)}
                            dateFormat="yyyy-MM-dd"
                           
                          />
                          <label className='opcionTitle'>Limite: </label>
                          <input className='inputs' type="number" value={limite} onChange={(e) => setLimite(parseInt(e.target.value))} />
                          
                          

                          <button className='button small' onClick={()=> {
                            handleReporte("Reporte 4", "latestAct", {estudiante_id: seccion ,seccion_id: cursoid,fecha_limite: selectedFin,limite: limite })}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                      


                      {/*opcion 5*/}
                      {opcion === "reporte5" && 
                        (<div className='change'>
                          <label className='opcionTitle'>Profesor id:</label>
                          <input className='inputs' type="number" value={seccion} onChange={(e) => setSeccion(parseInt(e.target.value))} />
                          <label className='opcionTitle'>Curso id: </label>
                          <input className='inputs' type="number" value={cursoid} onChange={(e) => setCursoid(parseInt(e.target.value))} />
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
                            handleReporte("Reporte 5", "avgSeccionP", {profesor_id: seccion,curso_id: cursoid,fecha_inicio: selectedInicio,fecha_fin: selectedFin})}}>
                            Aplicar Filtros
                          </button>
                        

                        </div>)
                      }

                    </div>

                    <div className='results'>
                        <div className='topbar'>
                        <button className='button2' onClick={"a"}>Generar Gráficas</button>
                        <button className='button2'  onClick={() => {setTimeout(() => {toPDF();}, 100); }}>Exportar como PDF</button> 
                        <button className='button2' onClick={"a"}>Exportar como CSV </button>
                      </div>
                        <div ref={targetRef}   style={{backgroundColor: 'white',padding: '20px',color: 'black',}}>
                            <ReportTable data={resultados} />                          
                        </div>
                    </div>

                </div>
                
            </div>
</div>
  )
}

export default App
