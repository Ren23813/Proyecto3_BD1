import React from 'react';
import { Bar, Line, Pie } from 'react-chartjs-2';
import { Chart as ChartJS, CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend, ArcElement } from 'chart.js';
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend, ArcElement);

const GenerateGraphic = ({ data }) => {
  const analizarJSON = (data) => {
    if (!data || !data.length) return;

    const keys = Object.keys(data[0]);
    if (keys.includes("calificacion") && keys.includes("estudiante")) {               //cambiar
      return "bar";
    } else if (keys.includes("fecha") && keys.includes("valor")) {                    //cambiar
      return "line";
    } else if (keys.includes("categoria") && keys.includes("cantidad")) {             //cambiar
      return "pie";
    } else {
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
        text: 'Gráfico de Análisis',
      },
    },
  };

  switch (tipo) {
    case "bar":
      chartData = {
        labels: data.map(d => d.estudiante),                                //cambiar
        datasets: [{
          label: "Calificación",
          data: data.map(d => d.calificacion),                                //cambiar
          backgroundColor: "rgba(54, 162, 235, 0.6)",
        }],
      };
      return <Bar data={chartData} options={chartOptions} />;
      
    case "line":
      chartData = {
        labels: data.map(d => d.fecha),                                //cambiar
        datasets: [{
          label: "Valor",
          data: data.map(d => d.valor),                                //cambiar
          borderColor: "rgba(75, 192, 192, 1)",
          fill: false,
        }],
      };
      return <Line data={chartData} options={chartOptions} />;
      
    case "pie":
      chartData = {
        labels: data.map(d => d.categoria),                                //cambiar
        datasets: [{
          label: "Cantidad",
          data: data.map(d => d.cantidad),                                //cambiar
          backgroundColor: [
            "rgba(255, 99, 132, 0.6)",
            "rgba(54, 162, 235, 0.6)",
            "rgba(255, 206, 86, 0.6)",
            "rgba(75, 192, 192, 0.6)",
            "rgba(153, 102, 255, 0.6)",
            "rgba(255, 159, 64, 0.6)",
          ],
        }],
      };
      return <Pie data={chartData} options={chartOptions} />;
      
    default:
      console.warn("Datos no compatibles con gráficos, mostrar como tabla");
      return <div>Tabla de Datos</div>;                                   //cambiar
  }
};

export default GenerateGraphic;
