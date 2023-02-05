import React, {useEffect, useState} from 'react'
import ReactHeader from './components/ReactHeader'
import MainHeader from './components/MainHeader'
import DocEntries from './components/DocEntries'
import {fetchDocuments} from './helpers'
import './App.css'
import SearchBar from './components/SearchBar'

function App() {
  const [state, setState] = useState({docs: ['uninitialized'], filterKey: ''})

  useEffect(() => {
    fetchDocuments().then(docs => {
      setState(prevState => ({...prevState, docs}))
    })
  }, [])

  return (
    <div className="App">
      <ReactHeader />
      <MainHeader />
      <SearchBar setState={setState} />
      <DocEntries entries={state.docs} filterKey={state.filterKey} />
    </div>
  )
}

export default App
