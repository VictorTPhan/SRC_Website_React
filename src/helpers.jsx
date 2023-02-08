import {v4 as uuid} from 'uuid'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import Button from 'react-bootstrap/Button'
import React from 'react'
import DocCard from './components/DocCard'

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

export function listDocs(documents, key, limitAttr) {
  return documents
    .filter(item => satisfiesKey(item, key))
    .sort(compareDates)
    .map((element, idx) => (
      <DocCard key={uuid()} element={element} limitAttr={limitAttr} />
    ))
}
