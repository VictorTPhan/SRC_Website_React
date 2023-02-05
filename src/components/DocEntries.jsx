import React, {useEffect, useState} from 'react'
import PropTypes from 'prop-types'
import {listDocs} from '../helpers'

function DocEntries({entries, filterKey}) {
  const [documents, setDocuments] = useState()

  useEffect(() => {
    setDocuments(listDocs(entries, filterKey))
  }, [entries, filterKey])

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

DocEntries.propTypes = {
  entries: PropTypes.array, // eslint-disable-line
  filterKey: PropTypes.string, // eslint-disable-line
}

export default DocEntries
