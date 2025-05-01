import { useState } from 'react'
import './Header.css'


function Myheader(props){
    return(
    <div>
        <h1>
            {props.title}
        </h1>
    </div>)
}

export default Myheader