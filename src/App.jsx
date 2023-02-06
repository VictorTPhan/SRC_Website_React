import React from 'react'
import './App.css'
import {
  BrowserRouter as Router,
  Routes as Switch,
  Route,
} from 'react-router-dom'
import Home from './components/Home'
import DocumentView from './components/DocumentView'

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/SRC_Website_React" element={<Home />} />
        <Route path="/SRC_Website_React/entry" element={<DocumentView />} />
        <Route path="/test" element={<>test</>} />
      </Switch>
    </Router>
  )
}

export default App
