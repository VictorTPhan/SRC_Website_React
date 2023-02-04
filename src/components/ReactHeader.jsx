import React from 'react'
import logo from '../logo.svg'

function ReactHeader() {
  return (
    <header className="App-header">
      <img src={logo} className="App-logo" alt="logo" />
      <p>Socially Responsible Computing</p>
      <a
        className="App-link"
        href="https://reactjs.org"
        target="_blank"
        rel="noopener noreferrer">
        Learn React
      </a>
    </header>
  )
}
export default ReactHeader
