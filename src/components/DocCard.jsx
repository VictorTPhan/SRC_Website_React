import React from 'react'
import {Card} from 'react-bootstrap'
import {Link} from 'react-router-dom'
import PropTypes from 'prop-types'
import {v4 as uuid} from 'uuid'
import ListGroup from 'react-bootstrap/ListGroup'
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
          <ListGroup variant="flush">
            <Card.Title>{element['Activity title']}</Card.Title>
            {jsonToUl(element, limitAttr)}
          </ListGroup>
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
