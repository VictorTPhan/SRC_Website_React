import {v4 as uuid} from 'uuid'
import React from 'react'
import DocCard from './components/DocCard'

export async function fetchDocuments() {
  return fetch(
    'https://raw.githubusercontent.com/SociallyResponsibleComputing/SRC_Website_React/main/documents/Document_Metadata.json',
  )
    .then(response => response.text())
    .then(data => JSON.parse(data))
}

export function satisfiesKey(item, key) {
  if (!key) return true
  const keyLower = key.toLowerCase()
  const filename = item.filename.toLowerCase()
  const activityTitle = item['Activity title'].toLowerCase()
  const programmingLanguage = item['Programming language'].toLowerCase()
  const CsTopic = item['CS topic'].toLowerCase()
  return (
    filename.includes(keyLower) ||
    programmingLanguage.includes(keyLower) ||
    activityTitle.includes(keyLower) ||
    CsTopic.includes(keyLower)
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
    .map(element => (
      <DocCard key={uuid()} element={element} limitAttr={limitAttr} />
    ))
}
