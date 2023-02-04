import React, {useEffect, useState} from 'react'
import {v4 as uuid} from 'uuid'
import {fetchDocuments, satisfiesPredicate, compareDates} from '../helpers'

async function getJson() {
  const documents = await fetchDocuments()

  return documents
    .filter(item => satisfiesPredicate(item, ''))
    .sort(compareDates)
    .map((element, i) => (
      <ul key={uuid()}>
        <p style={{marginTop: 10}}>File {i}</p>
        {Object.keys(element).map(keyname => (
          <li key={uuid()}>
            {keyname}: {element[keyname]}
          </li>
        ))}
      </ul>
    ))
}

function DocEntries() {
  const [documents, setDocuments] = useState()

  useEffect(() => {
    getJson().then(res => setDocuments(res))
  }, [])
  return (
    <div id="json" style={style}>
      <div />
      {documents}
    </div>
  )
}

let style = {
  whiteSpace: 'pre-line',
  textAlign: 'left',
}

export default DocEntries
