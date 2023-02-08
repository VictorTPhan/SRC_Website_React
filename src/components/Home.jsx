import React, {useEffect, useState} from 'react'
import ReactHeader from './ReactHeader'
import MainHeader from './MainHeader'
import DocEntries from './DocEntries'
import {fetchDocuments} from '../helpers'
import SearchBar from './SearchBar'

function Home() {
  const [state, setState] = useState({
    docs: [{msg: 'uninitialized'}],
    filterKey: '',
  })

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

export default Home
