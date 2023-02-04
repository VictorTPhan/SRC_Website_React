import React from 'react'
import ReactHeader from './components/ReactHeader'
import MainHeader from './components/MainHeader'
import DocEntries from './components/DocEntries'
import './App.css'

function App() {
  return (
    <div className="App">
      <ReactHeader />
      <h1>Socially Responsible Computing</h1>
      <MainHeader />
      <DocEntries />
    </div>
  )
}

export default App
