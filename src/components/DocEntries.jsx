import React, {useEffect, useState} from 'react'
import PropTypes from 'prop-types'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import {listDocs} from '../helpers'

function DocEntries({entries, filterKey}) {
  const [documents, setDocuments] = useState()

  useEffect(() => {
    const docComponents = listDocs(entries, filterKey, 2)
    // setDocuments(listDocs(entries, filterKey, 2))
    setDocuments(docComponents)
  }, [entries, filterKey])

  return (
    <div className="json">
      <div />
      <Container>
        <Row>{documents}</Row>
      </Container>
    </div>
  )
}

DocEntries.propTypes = {
  entries: PropTypes.array, // eslint-disable-line
  filterKey: PropTypes.string, // eslint-disable-line
}

export default DocEntries
