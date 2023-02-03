import {fetchDocuments, satisfiesPredicate, compareDates} from '../helpers.js'

async function getJson() {
  const documents = await fetchDocuments()

  return documents
    .filter(item => satisfiesPredicate(item, ''))
    .sort(compareDates)
    .map((element, idx) => {
      //let title = document.createTextNode(`File ${idx}`)
      //json.appendChild(title)
      //let ul = document.createElement('ul')
      return (
        <ui>
          {Object.keys(element).map((keyname, i) => {
            return (
              <li>
                `${keyname}: ${element[keyname]}`
              </li>
            )
          })}
        </ui>
      )
    })
}

function DocEntries() {
  return (
    <div id="json" style={style}>
      <div></div>
      {getJson}
    </div>
  )
}

let style = {
  whiteSpace: 'pre-line',
  textAlign: 'left',
}

export default DocEntries
