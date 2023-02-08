import React from 'react'
import {useLocation} from 'react-router-dom'
import {jsonToUl} from '../helpers2'

function DocumentView() {
  const document = useLocation().state.element
  return <>{jsonToUl(document)}</>
}

export default DocumentView
