import React from 'react'

const FriendsProfile = () => {
  return (
    <div className="FriendsSectionProfile">
        <h1 style={{ fontSize: 30}}>____Friends_____ 
            <button>Add Friend</button> 
            <button>Remove Friend</button>
            <h1 style={{ fontSize: 20}}>Search Friend</h1>
            <input FriendsSearchProfile="friendsSearchProfile"/>
            <button>Search</button>
        </h1>
    </div>
  )
}

export default FriendsProfile