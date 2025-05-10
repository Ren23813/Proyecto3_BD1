import React from 'react';
import { Bar, Pie, Radar} from 'react-chartjs-2';
import {Chart as ChartJS, CategoryScale,LinearScale,BarElement,Title,Tooltip,Legend,ArcElement,RadialLinearScale,LineElement,PointElement} from 'chart.js';
ChartJS.register(LineElement,PointElement,CategoryScale,LinearScale,BarElement,Title,Tooltip,Legend,ArcElement,RadialLinearScale);



const GenerateGraphic = ({ data }) => {

  const generarColores = (cantidad) => {
  const base = [
    'rgba(255, 99, 132, 0.6)', 'rgba(54, 162, 235, 0.6)', 'rgba(255, 206, 86, 0.6)',
    'rgba(75, 192, 192, 0.6)', 'rgba(153, 102, 255, 0.6)', 'rgba(255, 159, 64, 0.6)',
  ];
  return Array.from({ length: cantidad }, (_, i) => base[i % base.length]);
};


  const analizarJSON = (data) => {
    if (!data || !data.length) return;

    const keys = Object.keys(data[0]);
    if (keys.includes("profesor_nombre") && keys.includes("promedio_notas")) {             
      return "radar";
    }
    else if (keys.includes("seccion") && keys.includes("promedio_notas")) {               
      return "bar1";
    } else if (keys.includes("estudiante") && keys.includes("promedio")) {                    
      return "bar2";
    } else if (keys.includes("estudiante") && keys.includes("total_horas")) {             
      return "pie";
    } 
    else if (keys.includes("estudiante") && keys.includes("valor_neto")) {             
      return "bar3"; 
    }
    else {
      return "tabla";
    }
  };

  const tipo = analizarJSON(data);
  let chartData
  let chartOptions = {
    responsive: true,
    plugins: {
      title: {
        display: true,
        text: 'Gráfico de reportes',
      },
    },
  };

  switch (tipo) {
  case "bar1":
    chartData = {
      labels: data.map(d => d.seccion),
      datasets: [{
        label: "Promedio de notas",
        data: data.map(d => d.promedio_notas),
        backgroundColor: generarColores(data.length),
      }],
    };
    chartOptions = {
      ...chartOptions,
      scales: {
        x: { title: { display: true, text: "Sección" } },
        y: { title: { display: true, text: "Promedio de Notas" } }
      }
    };
    return <Bar data={chartData} options={chartOptions} />;

  case "bar2":
    chartData = {
      labels: data.map(d => d.estudiante),
      datasets: [{
        label: "Promedio por estudiante",
        data: data.map(d => d.promedio),
        backgroundColor: generarColores(data.length),
      }],
    };
    chartOptions = {
      ...chartOptions,
      scales: {
        x: { title: { display: true, text: "Estudiante" } },
        y: { title: { display: true, text: "Promedio" } }
      }
    };
    return <Bar data={chartData} options={chartOptions} />;

  case "pie":
    chartData = {
      labels: data.map(d => d.estudiante),
      datasets: [{
        label: "Total horas",
        data: data.map(d => d.total_horas),
        backgroundColor: generarColores(data.length),
      }],
    };
    return <Pie data={chartData} options={chartOptions} />;

  case "bar3":
    chartData = {
      labels: data.map(d => d.estudiante),
      datasets: [{
        label: "Valor de las actividades",
        data: data.map(d => d.valor_neto),
        backgroundColor: generarColores(data.length),
      }],
    };
    chartOptions = {
      ...chartOptions,
      scales: {
        x: { title: { display: true, text: "Estudiante" } },
        y: { title: { display: true, text: "Valor Neto" } }
      }
    };
    return <Bar data={chartData} options={chartOptions} />;

  case "radar":
    chartData = {
      labels: data.map(d => d.profesor_nombre),
      datasets: [{
        label: "Promedio por profesor",
        data: data.map(d => d.promedio_notas),
        backgroundColor: "rgba(54, 162, 235, 0.2)",
        borderColor: "rgba(54, 162, 235, 1)",
        pointBackgroundColor: generarColores(data.length),
      }],
    };
    return <Radar data={chartData} options={chartOptions} />;

  default:
    console.warn("Datos no compatibles con gráficos, mostrar como tabla");
    return <div>Tabla de Datos</div>;
  }
};

export default GenerateGraphic;
