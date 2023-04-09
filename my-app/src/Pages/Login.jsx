import React, { useState } from 'react'
import './../App.css'

export const Login = (props) => {
    const [email, setEmail] = useState();
    const [password, setPassword] = useState();

    const handleSubmit = (e) => {
        e.preventDefault();
        console.log(email);
    }

    return (
        <div className="form-container">
            <form className="login-form" onSubmit={handleSubmit}>
                <label htmlFor="email">email </label>
                <input value={email} onChange={(e) => setEmail(e.target.value)} type="email" placeholder="email" id="email" name="email" />
                <br />
                <label htmlFor="password">password </label>
                <input value={password} onChange={(e) => setPassword(e.target.value)} type="password" placeholder="******" id="password" name="password=" />
                <br />
                <button className="login-button" type="submit">Login</button>
            </form>
            <button onClick={() => props.onFormSwitch('signup')}>Don't have an account? Sign up here</button>

        </div>
    )
}