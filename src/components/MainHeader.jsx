import React from 'react'

function MainHeader() {
  return (
    <div>
      <div className="mb-3">
        <label htmlFor="search-input" className="form-label">
          Search Bar
          <input
            type="search"
            className="form-control"
            id="search-input"
            placeholder="Enter file name"
          />
        </label>
      </div>
    </div>
  )
}

export default MainHeader
