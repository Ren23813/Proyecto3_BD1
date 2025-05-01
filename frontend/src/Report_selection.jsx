import { useState } from 'react'
import './Report_selection.css'

function Specs_selector(){
    const [] = useState()

    return(
<div className= 'scafold'>
            <div className='Sidebar'>
                <button onClick={()=> setTitle("Reporte 1")}>
                    Reporte 1
                </button>
                <button onClick={()=> setTitle("Reporte 2")}>
                    Reporte 2
                </button>
                <button onClick={()=> setTitle("Reporte 3")}>
                    Reporte 3
                </button>
                <button onClick={()=> setTitle("Reporte 3")}>
                    Reporte 3
                </button>
            </div>
            <div className='report_area'>
                <div className='title'></div>
                <div className='report_scafold'>
                    <div>ociones</div>
                </div>
                
            </div>
</div>
    )
}