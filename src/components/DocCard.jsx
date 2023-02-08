import React from 'react'
import {Card} from 'react-bootstrap'
import {Link} from 'react-router-dom'
import PropTypes from 'prop-types'
import {v4 as uuid} from 'uuid'
import {jsonToUl} from '../helpers2'

function DocCard({element, limitAttr}) {
  return (
    <Link
      to="/SRC_Website_React/entry"
      state={{element}}
      className="Activity-title"
      style={{textDecoration: 'none'}}>
      <Card>
        <Card.Body>
          <ul key={uuid()}>
            <Card.Title>{element['Activity title']}</Card.Title>
            {jsonToUl(element, limitAttr)}
          </ul>
        </Card.Body>
      </Card>
    </Link>
  )
}

DocCard.defaultProps = {
  limitAttr: 0,
}

DocCard.propTypes = {
  element: PropTypes.object, // eslint-disable-line
  limitAttr: PropTypes.number,
}

export default DocCard
