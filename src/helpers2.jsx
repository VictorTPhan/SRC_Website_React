import React from 'react'
import {v4 as uuid} from 'uuid'
import ListGroup from 'react-bootstrap/ListGroup'

export function jsonToUl(json, limitAttr) {
  return Object.keys(json)
    .splice(0, limitAttr || Object.keys(json).length)
    .map(keyname => (
      <ListGroup.Item key={uuid()}>
        {keyname}: {json[keyname]}
      </ListGroup.Item>
    ))
}

export function homePageJson(json) {
  return (
    <>
      <ListGroup.Item key={uuid()}>
        <b>Filename:</b> {json.filename}
      </ListGroup.Item>
      <ListGroup.Item key={uuid()}>
        <b>Contributor email:</b> {json['Contributor (email)']}
      </ListGroup.Item>
      <ListGroup.Item key={uuid()}>
        <b>Description:</b>
        {json.Description}
      </ListGroup.Item>
    </>
  )
}

export default jsonToUl
