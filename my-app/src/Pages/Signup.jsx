import React, { useState } from 'react';
import { addUser } from './../db';

export const Signup = (props) => {

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [homeTown, setHomeTown] = useState('');
    const [gender, setGender] = useState('male');
    const [dob, setDOB] = useState('');
    const [user_id, setUser_id] = useState('');

    const generateUserId = () => {
        let result = '';
        const characters = '0123456789';
        const charactersLength = characters.length;
        for (let i = 0; i < 10; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }

    const handleSubmit = async (e) => {
        e.preventDefault();
        const newUserId = generateUserId();
        setUser_id(newUserId);

        const newUser = {
            user_id: newUserId,
            email: email,
            hashed_password: password,
            first_name: firstName,
            last_name: lastName,
            home_town: homeTown,
            gender: gender,
            date_of_birth: dob
        };
        

        console.log(newUser);
    }


    return (
        <div className="form-container">
            <form className="signup-form" onSubmit={handleSubmit}>

                <label htmlFor="firstName">First Name</label>
                <input value={firstName} onChange={(e) => setFirstName(e.target.value)} type="firstName" placeholder="first name" id="firstName" name="firstName" /> <br />
                <label htmlFor="LastName">Last Name</label>
                <input value={lastName} onChange={(e) => setLastName(e.target.value)} type="lastName" placeholder="last name" id="lastName" name="lastName" /> <br />
                <label htmlFor="email">email </label>
                <input value={email} onChange={(e) => setEmail(e.target.value)} type="email" placeholder="email" id="email" name="email" /><br />
                <label htmlFor="password">password </label>
                <input value={password} onChange={(e) => setPassword(e.target.value)} type="password" placeholder="******" id="password" name="password" /><br />
                <label htmlFor="homeTown">Home Town </label>
                <input value={homeTown} onChange={(e) => setHomeTown(e.target.value)} type="homeTown" placeholder="home town" id="homeTown" name="homeTown" />
                <br />
                <label htmlFor="gender">Gender</label>
                <select value={gender} onChange={(e) => setGender(e.target.value)} id="gender" name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
                <br />
                <label htmlFor="dob">Date of Birth</label>
                <input value={dob} onChange={(e) => setDOB(e.target.value)} type="date" id="dob" name="dob" /> <br />
                <button className='signup-button' type="submit">Sign Up</button>
            </form>
            <button onClick={() => props.onFormSwitch('login')}>Already have an account? Login here</button>
        </div>
    )
}
