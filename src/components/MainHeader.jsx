function MainHeader() {
  return (
    <div>
      <div class="mb-3">
        <label for="search-bar" class="form-label">
          Search Bar
        </label>
        <input
          type="search"
          class="form-control"
          id="search-input"
          placeholder="Enter file name"
        />
      </div>
    </div>
  );
}

export default MainHeader