import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import Myheader from './Myheader'


function App() {
  const [title, setTitle] = useState("Select a Report")

  return (
<div className= 'scaffold'>
            <div className='sidebar'>
                <button className='button' onClick={()=> setTitle("Reporte 1")}>
                    Reporte 1
                </button>
                <button className='button' onClick={()=> setTitle("Reporte 2")}>
                    Reporte 2
                </button>
                <button className='button' onClick={()=> setTitle("Reporte 3")}>
                    Reporte 3
                </button>
                <button className='button' onClick={()=> setTitle("Reporte 4")}>
                    Reporte 4
                </button>
            </div>
            <div className='report-area'>
                <h1>{title}</h1>
                <div className='report-scaffold'>
                <div style={{ color: 'black' }}>opciones</div>
                <div style={{ color: 'black' }}>query results</div>

                </div>
                
            </div>
</div>
  )
}

export default App
