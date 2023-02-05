import {v4 as uuid} from 'uuid'
import Button from 'react-bootstrap/Button'
import React from 'react'

export async function fetchDocuments() {
  return fetch(
    'https://raw.githubusercontent.com/SociallyResponsibleComputing/SRC_Website/main/documents/Document_Metadata.json',
  )
    .then(response => response.text())
    .then(data => JSON.parse(data))
}

export function satisfiesKey(item, key) {
  if (!key) return true
  const filename = item.filename.toLowerCase()
  const activityTitle = item['Activity title'].toLowerCase()
  const programmingLanguage = item['Programming language'].toLowerCase()
  const CsTopic = item['CS topic'].toLowerCase()
  return (
    filename.includes(key.toLowerCase()) ||
    programmingLanguage.includes(key) ||
    activityTitle.includes(key) ||
    CsTopic.includes(key)
  )
}

export function compareDates(a, b) {
  if (a.date < b.date) {
    return -1
  }
  if (a.date > b.date) {
    return 1
  }
  return 0
}

/**
 * @param {Array} documents The json object
 */
export function listDocs(documents, key) {
  return documents
    .filter(item => satisfiesKey(item, key))
    .sort(compareDates)
    .map((element, i) => (
      <ul key={uuid()}>
        <Button className="Activity-title">{element['Activity title']}</Button>
        {jsonToUl(element)}
      </ul>
    ))
}

function jsonToUl(json) {
  return Object.keys(json)
    .splice(0, 2)
    .map(keyname => (
      <li key={uuid()}>
        {keyname}: {json[keyname]}
      </li>
    ))
}
