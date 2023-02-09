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

export default jsonToUl
