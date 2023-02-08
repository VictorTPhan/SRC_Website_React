import React from 'react'
import {v4 as uuid} from 'uuid'

export function jsonToUl(json, limitAttr) {
  return Object.keys(json)
    .splice(0, limitAttr || Object.keys(json).length)
    .map(keyname => (
      <li key={uuid()}>
        {keyname}: {json[keyname]}
      </li>
    ))
}

export default jsonToUl
