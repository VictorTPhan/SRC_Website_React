import React, {useState, useEffect} from 'react'
import {fetchDocuments, satisfiesPredicate, compareDates} from '../helpers'

async function getJson() {
  const documents = await fetchDocuments()

  return documents
    .filter(item => satisfiesPredicate(item, ''))
    .sort(compareDates)
    .map((element, idx) => (
      <ui>
        {Object.keys(element).map((keyname, i) => (
          <li>
            `$
            {keyname}: ${element[keyname]}`
          </li>
        ))}
      </ui>
    ))
}

function DocEntries() {
  const [documents, setDocuments] = useState()

  useEffect(() => {}, [])
  return (
    <div id="json" style={style}>
      <div />
      {getJson}
    </div>
  )
}

let style = {
  whiteSpace: 'pre-line',
  textAlign: 'left',
}

export default DocEntries
