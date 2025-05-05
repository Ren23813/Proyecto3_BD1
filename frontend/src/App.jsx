import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import ReportTable from './ReportTable'
import './ReportTable.css'

import './App.css'


function App() {
  const [title, setTitle] = useState("Select a Report");
  const [resultados, setResultados] = useState([]);

  //HandleReporte1
  const handleReporte1 = async () => {
    setTitle("Reporte 1");

    const datos = {
        seccion: 10,
        curso_id: 2,
        fecha_inicio: "2020-01-01",
        fecha_fin: "2025-02-02"
    };

    const res = await fetch("http://localhost:8080/db/avgNotasS", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(datos)
    });

    if (!res.ok) {
        const errorText = await res.text(); // <-- evita intentar .json si falló
        console.error("Error del backend:", errorText);
        setResultados([]);
        return;
      }

    const json = await res.json();
    setResultados(json);

  };

  //Handler Reporte2
  const handleReporte2 = async () => {
    setTitle("Reporte 2");

    const datos = {
        estudiante_id: 10,
        curso_id: 2,
        fecha_inicio: "2020-01-01",
        fecha_fin: "2025-02-02"
    };

    const res = await fetch("http://localhost:8080/db/avgEstudiantesC", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(datos)
    });

    if (!res.ok) {
        const errorText = await res.text(); // <-- evita intentar .json si falló
        console.error("Error del backend:", errorText);
        setResultados([]);
        return;
      }

    const json = await res.json();
    setResultados(json);

  };


  //Reporte 3
  const handleReporte3 = async () => {
    setTitle("Reporte 3");

    const datos = {
        ciclo_inicio: "2024-A",
        ciclo_fin: "2024-A",
        min_horas: 2,
        min_porcentaje: "50"
    };

    const res = await fetch("http://localhost:8080/db/repHorasB", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(datos)
    });

    if (!res.ok) {
        const errorText = await res.text(); // <-- evita intentar .json si falló
        console.error("Error del backend:", errorText);
        setResultados([]);
        return;
      }

    const json = await res.json();
    setResultados(json);

  };



  //Reporte 4
  const handleReporte4 = async () => {
    setTitle("Reporte 4");

    const datos = {
        estudiante_id: 2,
        seccion_id: 2,
        fecha_limite: "2025-02-02",
        limite: 2
    };

    const res = await fetch("http://localhost:8080/db/latestAct", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(datos)
    });

    if (!res.ok) {
        const errorText = await res.text(); // <-- evita intentar .json si falló
        console.error("Error del backend:", errorText);
        setResultados([]);
        return;
      }

    const json = await res.json();
    setResultados(json);

  };

  //Reporte 5
  const handleReporte5 = async () => {
    setTitle("Reporte 5");

    const datos = {
        profesor_id: 2,
        curso_id: 2,
        fecha_inicio: "2025-02-02",
        fecha_fin: "2025-02-02"
    };

    const res = await fetch("http://localhost:8080/db/avgSeccionP", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(datos)
    });

    if (!res.ok) {
        const errorText = await res.text(); // <-- evita intentar .json si falló
        console.error("Error del backend:", errorText);
        setResultados([]);
        return;
      }

    const json = await res.json();
    setResultados(json);

    };


  return (
<div className= 'scaffold'>
            <div className='sidebar'>
                <button className='button' onClick={handleReporte1}>
                    Reporte 1
                </button>
                <button className='button' onClick={handleReporte2}>
                    Reporte 2
                </button>
                <button className='button' onClick={handleReporte3}>
                    Reporte 3
                </button>
                <button className='button' onClick={handleReporte4}>
                    Reporte 4
                </button>
                <button className='button' onClick={handleReporte5}>
                    Reporte 5
                </button>
            </div>
            <div className='report-area'>
                <h1 className='title'>{title}</h1>
                <div className='report-scaffold'>
                    <div className= 'filters'>opciones</div>
                    <div className='results'>
                        <div className='topbar'>
                        <button className='button2' onClick={"a"}>Generar Gráficas</button>
                        <button className='button2' onClick={"a"}>Exportar como PDF</button>
                        <button className='button2' onClick={"a"}>Exportar como CSV </button>

                        </div>
                        <ReportTable data={resultados} />
                    </div>

                </div>
                
            </div>
</div>
  )
}

export default App
