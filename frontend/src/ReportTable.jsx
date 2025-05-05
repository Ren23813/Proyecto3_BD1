import { useState } from "react";


function ReportTable({ data }) {
    if (!data || data.length === 0) return <p>No hay datos para mostrar.</p>;
  
    const headers = Object.keys(data[0]);
  
    return (
      <table className="tabla">
        <thead className="a">
          <tr>
            {headers.map((key) => (
              <th key={key}>{key}</th>
            ))}
          </tr>
        </thead>
        <tbody>
          {data.map((row, i) => (
            <tr key={i}>
              {headers.map((key) => (
                <td key={key}>{row[key]}</td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    );
  }
  
  export default ReportTable;
  