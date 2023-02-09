import React from 'react'
import {useLocation, Link} from 'react-router-dom'
import Button from 'react-bootstrap/Button'
import ListGroup from 'react-bootstrap/ListGroup'
import {jsonToUl} from '../helpers2'

function DocumentView() {
  const document = useLocation().state.element
  return (
    <div id="document-view">
      <Link to="/SRC_Website_React" style={{textDecoration: 'none'}}>
        <Button>Home</Button>
      </Link>
      <ListGroup variant="flush">{jsonToUl(document)}</ListGroup>
    </div>
  )
}

export default DocumentView
