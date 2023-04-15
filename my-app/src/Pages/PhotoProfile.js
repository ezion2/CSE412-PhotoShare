import React from 'react';

const PhotoProfile = () => {
  return (
    <div className="containerPic ">
        <h1 style={{ fontSize: 30}}>_______________________________Photos_______________________________ 
            <button>Add Photo</button> 
            <button>Delete Photo</button>
            <h1 style={{ fontSize: 20}}>Search Photos</h1>
            <input TagsPhotosProfile="tagsPhotosProfile"/>
            <button>Search</button>
        </h1>
    </div>
  )
}

export default PhotoProfile