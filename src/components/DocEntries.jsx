import React, {useEffect, useState} from 'react'
import {fetchDocuments, satisfiesPredicate, compareDates} from '../helpers'

async function getJson() {
  const documents = await fetchDocuments()

  return documents
    .filter(item => satisfiesPredicate(item, ''))
    .sort(compareDates)
    .map(element => (
      <ui>
        {Object.keys(element).map(keyname => (
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
