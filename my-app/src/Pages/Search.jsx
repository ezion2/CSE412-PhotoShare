import React, { useState } from 'react';
import './../App.css'

export const Search = (props) => {
    const [searchTerm, setSearchTerm] = useState('');
    const [searchType, setSearchType] = useState('tags');
  
    function handleSearchTermChange(event) {
      setSearchTerm(event.target.value);
    }
  
    function handleSearchTypeChange(event) {
      setSearchType(event.target.value);
    }
  
    function handleSearch() {
      console.log(`Searching for ${searchTerm} in ${searchType}`);
      // Perform search based on selected search type and search term
    }
  
    return (
        <div className="search-container">
            <p style={{ fontSize: '50px' }}>Search based on tag, comments, or users</p>
            <div className="search-bar">
                <input type="text" value={searchTerm} onChange={handleSearchTermChange} placeholder="Search..." />
                <select value={searchType} onChange={handleSearchTypeChange}>
                    <option value="tags">Tags</option>
                    <option value="comments">Comments</option>
                    <option value="users">Users</option>
                </select>
                <button onClick={handleSearch}>Go</button>
            </div>
        </div>
    );
}