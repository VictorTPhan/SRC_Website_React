import React from 'react'
import PropTypes from 'prop-types'

function SearchBar({setState}) {
  return (
    <div className="mb-3">
      <label htmlFor="search-input" className="form-label">
        Search Bar
        <input
          type="text"
          className="form-control"
          id="search-input"
          placeholder="Enter file name"
          onChange={e =>
            setState(prevState => ({...prevState, filterKey: e.target.value}))
          }
        />
      </label>
    </div>
  )
}

SearchBar.propTypes = {
  setState: PropTypes.func, // eslint-disable-line
}
export default SearchBar
