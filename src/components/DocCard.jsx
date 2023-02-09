import React from 'react'
import {Card} from 'react-bootstrap'
import {Link} from 'react-router-dom'
import PropTypes from 'prop-types'
import ListGroup from 'react-bootstrap/ListGroup'
import {homePageJson} from '../helpers2'

function DocCard({element, limitAttr}) {
  return (
    <div className="bg-image hover-overlay">
      <Link
        to="/SRC_Website_React/entry"
        state={{element}}
        className="Activity-title"
        style={{textDecoration: 'none'}}>
        <Card>
          <Card.Body>
            <ListGroup variant="flush">
              <Card.Title>{element['Activity title']}</Card.Title>
              {homePageJson(element)}
            </ListGroup>
          </Card.Body>
        </Card>
        <div
          className="mask"
          style={{
            background:
              'linear-gradient(45deg, rgba(29, 236, 197, 0.05), rgba(91, 14, 214, 0.05) 100%)',
          }}
        />
      </Link>
    </div>
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
