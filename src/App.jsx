import React from 'react'
import './App.css'
import {
  BrowserRouter as Router,
  Routes as Switch,
  Route,
} from 'react-router-dom'
import Home from './components/Home'

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/" element={<Home />} />
        <Route path="/test" element={<>test</>} />
      </Switch>
    </Router>
  )
}

export default App
