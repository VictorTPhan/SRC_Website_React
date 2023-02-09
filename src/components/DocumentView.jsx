import React from 'react'
import {useLocation, Link} from 'react-router-dom'
import Button from 'react-bootstrap/Button'
import ListGroup from 'react-bootstrap/ListGroup'
import {jsonToUl} from '../helpers2'

function getUrl(filename) {
  return `https://github.com/SociallyResponsibleComputing/SRC_Website_React/blob/main/documents/${encodeURI(
    filename,
  )}?raw=true`
}

/*
async function fetchDocuments(filename) {
  return fetch(
    `https://github.com/SociallyResponsibleComputing/SRC_Website_React/blob/main/documents/${encodeURI(
  )
    .then(res => res.blob())
    .then(blob => blob)
}
*/

function DocumentView() {
  const document = useLocation().state.element
  console.log(document)
  return (
    <div id="document-view">
      <Link
        to="/SRC_Website_React"
        style={{
          textDecoration: 'none',
        }}>
        <Button>Home</Button>
      </Link>
      <Button style={{width: 200, marginTop: 40}}>
        <a href={getUrl(document.filename)} download style={{color: 'white'}}>
          Click to download
        </a>
      </Button>
      <ListGroup variant="flush">{jsonToUl(document)}</ListGroup>
    </div>
  )
}

export default DocumentView
