import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Link, Routes } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import './App.css';
import { Login } from './Pages/Login';
import { Signup } from './Pages/Signup';
import {TopContributors} from './Pages/TopContributors';

function App() {
  const [currentForm, setCurrentForm] = useState('login');



  const toggleForm = (formName) => {
    setCurrentForm(formName);
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>PhotoSource</h1>
        <div className="header-buttons">
          <button className="header-button" onClick={() => toggleForm('login')}>
            Login
          </button>
          <button className="header-button" onClick={() => toggleForm('signup')}>
            Signup
          </button>
            <button className="header-buttons">
                See Top 10
            </button>

        </div>
      </header>
      <main className="App-Main">
        {currentForm === 'login' ? <Login onFormSwitch={toggleForm} /> : <Signup onFormSwitch={toggleForm} />}
      </main>
    </div>
  );
}

export default App;