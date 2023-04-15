import React from "react";
import TitleProfile from './TitleProfile';
import PhotoProfile from './PhotoProfile';
import AlbumProfile from './AlbumProfile';
import FriendsProfile from './FriendsProfile';
import RecFriendsProfile from './RecFriendsProfile';


const Profile = () => {
    return (
        <React.Fragment>
            <section>
                <div className="layoutProfile">
                    <div className ="titleprofile profilecentered">
                        <TitleProfile/>
                    </div>     
                    <div className ="photoprofile profilecentered">
                        <PhotoProfile/>
                    </div>     
                    <div className ="albumprofile profilecentered">
                        <AlbumProfile/>
                    </div>  
                    <div className ="friendsprofile profilecentered">
                        <FriendsProfile/>
                    </div>  
                    <div className ="recFriendsprofile profilecentered">
                        <RecFriendsProfile/>
                    </div> 
                </div>
            </section>
        </React.Fragment>
    );

}

export default Profile;